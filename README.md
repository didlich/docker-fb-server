This is a docker image with nginx to redirect the server application http calls
to the linked docker containers, PostgreSQL database and to Elasticsearch search engine.

For the first run of rails server use:

    bundle install


    rake db:insert-test-data


    rails server --port 3000 --bind 0.0.0.0



# Commands

build:

    docker build -t fb-server --rm=true .

debug:
    
    docker run -p 3000:3000 -e LOCAL_USER_ID=`id -u $USER` --name fb-server -i -t -v ~/git:/home/user/git --link postgres_instance:postgres --entrypoint=sh fb-server

run:

    docker run -p 3000:3000 -e LOCAL_USER_ID=`id -u $USER` --name fb-server -v ~/git:/home/user/git --link postgres_instance:postgres -i -P fb-server


login:

    docker exec -i -t -u user fb-server /bin/bash


logout:

    exit