#!/bin/bash

# Variáveis de conexão
MYSQL_HOST=datasane-app-db-1  
MYSQL_USER=root           
MYSQL_PASSWORD=root123         

# Tentativa de conexão ao MySQL
until mysql -h "$MYSQL_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "select 1" &> /dev/null
do
  echo "MySQL está indisponível - aguardando..."
  sleep 5
done

echo "MySQL está disponível - iniciando o processo..."

# Comando para rodar o container Java
docker run --rm --name java-etl-runner datasane-app-etl-java-api