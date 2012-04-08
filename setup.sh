#! /bin/bash

# Setup the database.
echo "Creating database.."
sudo -u postgres psql -c "\i sql/createDatabase.sql"

# As projectuser, set up the database using sql/createTables.sql
echo "Adding database tables and plpgsql functions."
psql -U ttuser -W ttaker  -c "\i sql/makeAll.sql"

#echo "Performing bundle install to get Ruby gems, if needed."
#bundle install

echo "Project 2 Rails setup done. Start rails server with 'rails s'"
