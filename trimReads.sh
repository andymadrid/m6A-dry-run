# trim sequenced paired-end reads with trim_galore

# some pretty severe trimming to be done 
/media/Data/WGBS/trim_galore 
  --cores 4 
  --path_to_cutadapt ~/.local/bin/cutadapt 
  -q 30 
  --length 30 
  --clip_R1 11 
  --clip_R2 11
  --three_prime_clip_R1 5 
  --three_prime_clip_R2 5 
  --paired reads_R1.fastq reads_R2.fastq
