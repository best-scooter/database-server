# database-server

Dockerfile i detta repo fungerar ej.
Databasen är en backup med Admins, Customers och Scooters.

```
docker exec <container> sh -c 'exec mariadb-dump --all-databases -uuser -ppassword' > ./database-current.sql
```

```
docker build -t bestscooter.azurecr.io/database-server .
```
