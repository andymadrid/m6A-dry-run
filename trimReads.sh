# trim sequenced paired-end reads with trim_galore

# some pretty severe trimming to be done 
/media/Data/WGBS/trim_galore 
  --cores 4 
  --path_to_cutadapt ~/.local/bin/cutadapt 
  -q 30 
  --length 30 
  --clip_R1 50 
  --clip_R2 50
  --three_prime_clip_R1 50 
  --three_prime_clip_R2 50 
  --paired reads_R1.fastq reads_R2.fastq
