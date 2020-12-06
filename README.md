# MY CHOCOLATE COLLECTION

Database storing the data of my chocolate wrappers collection

## START UP

Just lauch

```
docker-compose up
```

and the access pgadmin at

```
localhost
```

with email `marcosh@marcosh.com` and password `password`.

If not present, add a new server with hostname `postgres`, username `marcosh` and password `marcosh`

## DUMP

In the `dump` folder, there is the dump of the initial version of this collection when it was firts imported in postgres

### replicate database

```bash
docker-compose exec pgadmin sh

pg_dump -h postgres -d chocolates -U marcosh >> /dump/<filename>.sql
```
