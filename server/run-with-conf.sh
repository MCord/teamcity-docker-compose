#!/bin/bash

config_dir=/data/teamcity_server/datadir/config
config_file=$config_dir/database.properties

mkdir -p $config_dir
if [ ! -f $config_file ]; then

    echo connectionUrl=jdbc:postgresql://postgres:5432/$DATABASE > $config_file
    echo connectionProperties.user=$USER >> $config_file
    echo connectionProperties.password=$PASS >> $config_file
    echo maxConnections=50 >> $config_file
    echo testOnBorrow=false >> $config_file
fi

cat $config_file

source "/run-services.sh"
