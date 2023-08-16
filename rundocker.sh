#!/bin/bash

# Leer las credenciales de AWS desde el archivo
export AWS_ACCESS_KEY_ID=$(grep 'aws_access_key_id' ~/.aws/credentials | awk '{print $3}')
export AWS_SECRET_ACCESS_KEY=$(grep 'aws_secret_access_key' ~/.aws/credentials | awk '{print $3}')
export AWS_SESSION_TOKEN=$(grep 'aws_session_token' ~/.aws/credentials | awk '{print $3}') # Si es necesario

# Ejecutar el contenedor Docker, pasando las variables de entorno
docker run \
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  -e AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN \ # Si es necesario
  awsee:last

echo "Contenedor iniciado con las credenciales de AWS."