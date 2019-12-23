apt-get update
apt-get install -yq git mysql-client

git clone https://github.com/ConorMcFeelyQUB/cloud-sql-setup.git

cd cloud-sql-setup/

mysql --host=35.187.184.139 --user=root --password=QUBccProject -e \
"source ./createandpop.sql"
