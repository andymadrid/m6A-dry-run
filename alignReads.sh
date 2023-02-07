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
