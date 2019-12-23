apt-get update
apt-get install -yq git mysql-client

mysql --host=35.187.184.139 --user=root --password=QUBccProject -e \
"source ./createandpop.sql"
