FROM postgres:9.5
ARG database
ARG user
ARG pass

ENV POSTGRES_DB ${database}
ENV POSTGRES_USER ${user}
ENV POSTGRES_PASSWORD ${pass}

# Set recommended Postgres config for Teamcity
COPY set-pg-conf.sh /docker-entrypoint-initdb.d/set-config.sh

# Add backup scripts
ADD backup.sh /usr/local/bin/backup 
ADD restore.sh /usr/local/bin/restore
ADD list-backups.sh /usr/local/bin/list-backups

# Make them executable
RUN chmod +x /usr/local/bin/restore         \
 && chmod +x /usr/local/bin/list-backups    \
 && chmod +x /usr/local/bin/backup          \
