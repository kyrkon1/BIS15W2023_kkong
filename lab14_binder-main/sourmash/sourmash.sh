cd ~/sourmash/

# prepare microbial genome database
gunzip genomic_data/gtdb-rs207.taxonomy.csv.gz
sourmash tax prepare -t genomic_data/gtdb-rs207.taxonomy.csv \
    -o gtdb-rs207.taxonomy.sqldb -F sql

# makes representation of the metagenome
sourmash sketch dna -p k=31,abund genomic_data/SRR8859675*.gz \
    -o SRR8859675.sig.gz --name SRR8859675
    
# compare metagenome to database of microbial genomes
sourmash gather SRR8859675.sig.gz genomic_data/gtdb-rs207.genomic-reps.dna.k31.zip --save-matches matches.zip
sourmash gather SRR8859675.sig.gz matches.zip -o hotspring_microbiome.csv

ls

