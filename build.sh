docker build . --target=ubuntu-desktop --tag=mssoftware/ubuntu-desktop:latest
docker push mssoftware/ubuntu-desktop

docker build . --target=ubuntu-workspace --tag=mssoftware/ubuntu-workspace:latest
docker push mssoftware/ubuntu-workspace
