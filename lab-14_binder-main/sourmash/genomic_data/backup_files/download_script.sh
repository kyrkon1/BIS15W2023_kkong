# downloads script, takes 1-2 minutes to run

#set up directories
cd ~/sourmash/genomic_data


# download a metagenome (comes in two parts)
# 60 sec
curl -JLO ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR885/005/SRR8859675/SRR8859675_1.fastq.gz
curl -JLO ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR885/005/SRR8859675/SRR8859675_2.fastq.gz

# downloads a GTDB genomic representatives database, containing ~65,000 genomes
curl -JLO https://osf.io/3a6gn/download

# taxonomy table for database
curl -JLO https://osf.io/v3zmg/download

cd ~/sourmash

