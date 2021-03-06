#!/bin/sh
# startup.sh - startup script for the server docker image

echo "Starting Conductor server"

# Start the server
cd /app/libs
echo "Property file: $CONFIG_PROP"
echo $CONFIG_PROP
export config_file=

if [ -z "$CONFIG_PROP" ];
  then
    echo "Using /app/config/config.properties";
    export config_file=/app/config/config.properties
  else
    echo "Using '$CONFIG_PROP'";
    export config_file=/app/config/$CONFIG_PROP
fi

echo "Using /app/config/log4j.properties";

java $CONDUCTOR_JAVA_OPTS -jar conductor-server-*-all.jar $config_file /app/config/log4j.properties
