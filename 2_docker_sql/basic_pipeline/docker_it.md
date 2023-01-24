# Docker Interactive Mode

```
docker run -it \
    -e POSTGRES_USER='root' \
    -e POSTGRES_PASSWORD='root' \
    -e POSTGRES_DB='ny-taxi' \
    -v $(pwd)/ny-taxi-data:/var/lib/postgresql/data \
    -p 5432:5432 \
    postgres:13 
```

pgAdmin

```
docker run -it \ 
    -p 80:80 \
    -e PGADMIN_DEFAULT_EMAIL=jermaine@zoomcamp.com \
    -e PGADMIN_DEFAULT_PASSWORD=password \
    -e PGADMIN_CONFIG_PROXY_X_HOST_COUNT=1 \
    -e PGADMIN_CONFIG_PROXY_X_PREFIX_COUNT=1 \
    dpage/pgadmin4
```