#
# This dockerfile does not work at all
#

FROM mariadb:11.2.2

WORKDIR /

COPY database/* /var/lib/mysql

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3306

CMD ["mariadbd"]