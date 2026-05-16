#### submit_job.sh START ####
#!/bin/bash
#$ -cwd
#$ -o ./joblog.$JOB_ID.txt                   #set the job log output file
#$ -j y                                      #set error = Merged with joblog
#$ -l h_rt=24:00:00,h_data=15G      #specify requested resources (h_rt gives time request in 'hrs:mins:secs' format) (h_data specifies requested RAM per task) (highp=TRUE means run it on Aguillon Lab owned nodes)
#$ -pe shared 1                              #specify number of CPUs requested

#load necessary modules
. /u/local/Modules/default/init/modules.sh

#run plink2 (v2.0.0) to make 'KING' relatedness table
/u/project/aguillon/shared_bin/plink2 --vcf myzo.filtered.snps.vcf.gz --make-king-table --allow-extra-chr --chr-set 50
