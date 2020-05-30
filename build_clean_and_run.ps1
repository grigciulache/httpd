$ErrorActionPreference = 'SilentlyContinue'
docker build -t apache .
docker stop apache
docker rm apache
docker run -d -p 8089:80 --name apache apache