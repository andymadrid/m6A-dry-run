# Prepare the genome for downstream analyses

# GRCm38 (mm10) version/annotation

# Download from ENSEMBL
# FASTA at ftp://ftp.ensembl.org/pub/release-102/fasta/mus_musculus/dna/
# GTF at ftp://ftp.ensembl.org/pub/release-102/gtf/mus_musculus/

# remove scaffolds, keep only chromosomes
/media/Data/WGBS/seqkit/seqkit grep -vrp "^[JG]" Mus_musculus.GRCm38.dna.primary_assembly.fa > Mus_musculus.GRCm38.fasta 

# prepare the genome for STAR
/media/Data/WGBS/STAR-2.7.0f/bin/Linux_x86_64/STAR 
  --runThreadN 30 
  --runMode genomeGenerate 
  --genomeDir /media/Data/RNAseq/Mouse/mm10/m6A/ 
  --genomeFastaFiles /media/Data/RNAseq/Mouse/mm10/m6A/Mus_musculus.GRCm38.fasta 
  --sjdbGTFfile /media/Data/RNAseq/Mouse/mm10/m6A/Mus_musculus.GRCm38.102.gtf 
  --sjdbOverhang 149
