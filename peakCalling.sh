# Call peaks with MACS2
# May switch it up to exomePeak
# default parameters with q-value < 0.05 peaks, mfold [5,50]
~/.local/bin/macs2 callpeak -g mm -f BAMPE --nomodel -c .test_input_486_Aligned.out.bam -t m6A_Aligned.out.bam
