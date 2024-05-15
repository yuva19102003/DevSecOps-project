FROM mysql:latest

# Set environment variables
ENV MYSQL_DATABASE=anime_db \
    MYSQL_ROOT_PASSWORD=root

# Copy SQL file to docker-entrypoint-initdb.d directory
COPY ./data.sql /docker-entrypoint-initdb.d/

