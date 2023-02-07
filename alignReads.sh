# Map trimmed reads to the mouse (GRCm38) genome with STAR

# Reporting randomly one position, 4% mismatch allowed
/media/Data/WGBS/STAR-2.7.0f/bin/Linux_x86_64/STAR 
  --outReadsUnmapped Fastx  
  --runThreadN 78 
  --genomeDir /media/Data/RNAseq/Mouse/mm10/m6A/ 
  --alignIntronMax 1  
  --outFilterMultimapNmax 5000 
  --outSAMmultNmax 1 
  --outFilterMismatchNmax 999 
  --outFilterMismatchNoverLmax 0.04 
  --bamRemoveDuplicatesType UniqueIdenticalNotMulti 
  --outFilterScoreMinOverLread 0 
  --outFilterMatchNminOverLread 0 
  --outFilterMatchNmin 0 
  --alignEndsType EndToEnd 
  --readFilesIn trimmed_reads_R1_1_val_1.fq trimmed_reads_R2_1_val_2.fq

# Convert SAM to sorted BAM file
samtools view -@ 78 -b Aligned.out.sam > Aligned.out.bam 
samtools sort -@ 78 Aligned.out.bam > Aligned.out.sorted.bam
samtools index -@ 78 Aligned.out.sorted.bam 

# Convert sorted BAM to BigWig and bedGraph
~/.local/bin/bamCoverage 
  --normalizeUsing RPKM 
  --numberOfProcessors max 
  --bam Aligned.out.sorted.bam 
  --outFileFormat bigwig 
  --outFileName Aligned.out.bigwig

~/.local/bin/bamCoverage 
  --normalizeUsing RPKM 
  --numberOfProcessors max 
  --bam Aligned.out.sorted.bam 
  --outFileFormat bedgraph 
  --outFileName Aligned.out.bigwig

# QC of alignment
export PATH=$PATH:/media/Data/RNAseq/qualimap_v2.2.1/
qualimap rnaseq 
  --java-mem-size=2400M 
  -bam Aligned.out.bam 
  -gtf /media/Data/RNAseq/Mouse/mm10/m6A/Mus_musculus.GRCm38.102.gtf 
  -outdir ./ 
  -p non-strand-specific 
  -pe

# RNA-SeQC
rna-seqc 
  -t /media/Data/RNAseq/Mouse/mm10/m6A/Mus_musculus.GRCm39.106.gtf Aligned.out.bam 
  -r /media/Data/RNAseq/Mouse/mm10/m6A/Mus_musculus.GRCm38.fasta 
  -o ./ 
  -s s.txt 
  -singleEnd no
