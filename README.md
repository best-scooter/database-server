# database-server

Dockerfile i detta repo bygger en image med en mariadb-databas efter en förberedd databas.

Du kan använda detta kommando för att dumpa en mariadb-databas i en image.

```
docker exec <container> sh -c 'exec mariadb-dump --all-databases -uuser -ppassword' > ./database-current.sql
```

När du har `database-current.sql` använder du dessa kommandon för att ladda in en förberedd databas och bygga & pusha imagen.

```
docker build -t missivaeak/bestscooter_database-server .
docker push missivaeak/bestscooter_database-server
```
