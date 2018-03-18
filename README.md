# README

### run this to create the docker image for rails and bring up the rails server
`docker-compose up --build`

### run this to create the database, migrate schema, and seed database
`docker-compose run web rake db:create db:migrate db:seed`

### at this point you should be able to get to the application on localhost:3000

## Analytics
`git submodule init`
`git submodule update`
Then see the analytics README
