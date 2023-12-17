#
# This dockerfile does not work at all
#

# FROM mariadb:11.2.2

# WORKDIR /sql

# COPY database-v1.sql database-v1.sql

# RUN 'mysql --user=user --password=password < database-v1.sql'

# EXPOSE 3306

# CMD ["mariadbd"]

FROM mariadb:11.2.2 as builder

# That file does the DB initialization but also runs mysql daemon, by removing the last line it will only init
RUN ["sed", "-i", "s/exec \"$@\"/echo \"not running $@\"/", "/usr/local/bin/docker-entrypoint.sh"]

# needed for intialization
ENV MARIADB_ROOT_PASSWORD=example

# copy the backup file into the build image
COPY database-current.sql /docker-entrypoint-initdb.d/

# Need to change the datadir to something else that /var/lib/mysql because the parent docker file defines it as a volume.
# https://docs.docker.com/engine/reference/builder/#volume :
#       Changing the volume from within the Dockerfile: If any build steps change the data within the volume after
#       it has been declared, those changes will be discarded.
RUN ["/usr/local/bin/docker-entrypoint.sh", "mariadbd", "--datadir", "/initialized-db", "--aria-log-dir-path", "/initialized-db"]

FROM mariadb:11.2.2

COPY --from=builder /initialized-db /var/lib/mysql
# use healthcheck file
COPY healthcheck.cnf /