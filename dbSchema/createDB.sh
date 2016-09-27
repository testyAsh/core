set -e
echo "Creating database"
sudo mysql -f < database.sql
echo "Creation done"
