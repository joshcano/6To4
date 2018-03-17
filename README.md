# README

# run this to create the docker image for rails and bring up the rails server
docker-compose up --build

# run this to create the database, migrate schema, and seed database
docker-compose run web rake db:create db:migrate db:seed

# if your database is already created adjust the db: params
docker-compose run web rake db:migrate

