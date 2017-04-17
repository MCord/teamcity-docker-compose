FROM jetbrains/teamcity-server

ARG database
ARG user
ARG pass

ENV DATABASE ${database}
ENV USER ${user}
ENV PASS ${pass}


# Enable Postgres ODBC driver.
ADD https://jdbc.postgresql.org/download/postgresql-42.0.0.jar /data/teamcity_server/datadir/lib/jdbc/postgresql-42.0.0.jar

ADD run-with-conf.sh run-with-conf.sh
RUN chmod +x ./run-with-conf.sh         
 
CMD ["./run-with-conf.sh"]