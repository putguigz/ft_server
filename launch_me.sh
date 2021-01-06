docker build -t bonjourmonde .
docker run -it -p 80:80 --rm --name server bonjourmonde
