FROM jetbrains/teamcity-server

ARG database
ARG user
ARG pass

ENV DATABASE ${database}
ENV USER ${user}
ENV PASS ${pass}

# In order to modify teamcity configuration we need to relocated the data folder to a new path 
# since the one specified in the parent container is already used in a volume and is immutable.
ENV TEAMCITY_DATA_PATH /data/teamcity


# Enable Postgres ODBC driver.
ADD https://jdbc.postgresql.org/download/postgresql-42.0.0.jar ${TEAMCITY_DATA_PATH}/lib/jdbc/postgresql-42.0.0.jar

# Plugins
ADD https://github.com/PeteGoo/tcSlackBuildNotifier/releases/download/v1.4.6/tcSlackNotificationsPlugin.zip /data/teamcity/plugins/tcSlackNotificationsPlugin.zip
ADD https://github.com/JeanRev/TeamcityDockerCloudPlugin/releases/download/v0.3.4/docker-cloud_0.3.4.zip /data/teamcity/plugins/docker-cloud_0.3.4.zip

# Configure database
ADD database.properties $TEAMCITY_DATA_PATH/config/database.properties
RUN eval "echo \"$(cat $TEAMCITY_DATA_PATH/config/database.properties)\"" > ${TEAMCITY_DATA_PATH}/config/database.properties 

VOLUME $TEAMCITY_DATA_PATH