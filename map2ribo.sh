# map to mouse ribosomal sequence (most 3 mismatch) and keep unaligned reads
# may be an unnecessary step...will keep working on it

/media/Data/WGBS/bowtie-1.3.0-linux-x86_64/bowtie 
  --threads 78 
  --un unalignedRiboSeq.bt 
  -n 3 /media/Data/RNAseq/Mouse/mm10/m6A/Ribosomal_RNA/BK000964.3.fa 
  -1 trimmed_reads_R1_val_1.fq -2 trimmed_reads_R2_val_2.fq alignedRiboSeq.bt
