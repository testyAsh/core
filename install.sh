set -e
echo "installing dependencies"
./installDeps.sh
echo "done installing dependencies"
cd dbSchema
echo "setting DB user"
./setupUserDB.sh
echo "done setting users"
echo "creating db"
./createDB.sh
echo "done creating db"
