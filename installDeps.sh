set -e
sudo apt-get update
sudo apt-get install libmysqlclient-dev -y
sudo apt-get install python-dev -y
sudo apt-get install pip
sudo pip install -r requirements.txt
