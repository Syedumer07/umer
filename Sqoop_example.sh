#--Sqoop import from DB2 Prod SMRT_PLU_PMTN to Bigred3 HDFS
#!/bin/bash


#Truncate the files and import new incremental files from DB2 tables

hadoop fs -ls /user/SVCLRCDSHDP/temp/plu/SMRT_PLU_PMTN/

if [ $? -ne 1 ]
then
hadoop fs -rm -r /user/SVCLRCDSHDP/temp/plu/SMRT_PLU_PMTN/
echo "Removed files"

fi

#sqoop import DB2 plu header data in to hdfs

sqoop import \
--connect jdbc:db2://DB21-TGTSPLEX.TARGET.COM:30140/DB21: \
--username JDBCBDW \
--password 'BC$B5DW' \
--table db2prod.SMRT_PLU_PMTN \
--num-mappers 1 \
--null-string '\\N' \
--null-non-string '\\N' \
--target-dir /user/SVCLRCDSHDP/temp/plu/SMRT_PLU_PMTN/ \
--split-by PMTN_I 



if [ $? -ne 0 ]
then
echo "Error importing source data"
exit 1
fi