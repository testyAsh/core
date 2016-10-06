set -e
sudo apt-get update
sudo apt-get install libmysqlclient-dev -y
sudo apt-get install python-dev -y
sudo apt-get install python-setuptools -y
sudo apt-get install mysql-client -y
sudo apt-get install mysql-server -y
sudo easy_install pip
sudo pip install -r requirements.txt
sudo pip install sqlalchemy
sudo pip install flask-sqlalchemy
sudo pip install sqlalchemy-migrate
sudo pip install flask-whooshalchemy