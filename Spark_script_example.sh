######################################################################################################################################
## Script: cds03dl001.sh
## Created by : Clearance Insights. Syed.Umer/z079355
## On 09-12-2020
## Description: This Script trigger's the PLU header Flow built in Spark/Scala
######################################################################################################################################

path=/home_dir/svclrcdshdp
data_flow=smart_plu_program
jarName=clearancedatapipeline-assembly-1.0.jar
config_file=kickstarter.conf

echo "smart_plu_program Flow: [Spark/Scala] has been started"


spark-submit --class com.tgt.de.clearance.SmrtPluPipelineMain --queue SVCLRCDSHDP --jars /usr/share/hive-warehouse-connector-tgt/hive-warehouse-connector.jar --conf spark.hadoop.hive.llap.daemon.service.hosts=@llap0 --conf spark.sql.hive.hiveserver2.jdbc.url="jdbc:hive2://brcn1003.target.com:2181,brcn1004.target.com:2181,brcn1008.target.com:2181,brcn1009.target.com:2181,brcn1012.target.com:2181/;serviceDiscoveryMode=zooKeeperHA;zooKeeperNamespace=llap0-hs2ha" /home_dir/svclrcdshdp/smrt_plu_ads/smrt_plu_pmtn/clearancedatapipeline-assembly-1.0.jar /home_dir/svclrcdshdp/smrt_plu_ads/smrt_plu_pmtn/kickstarter.conf


 if [ $? != 0 ]
     then
        echo "The Spark Application for smart_plu_program Flow has been Failed."
        exit 2
  fi

echo "The Spark Application for smart_plu_program Flow has been completed successfully"

exit 0



