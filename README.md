# Outerspace Blockchain

* Ruby 3.0.3

* System dependencies
    1. Docker
    2. Postgresql
    3. Ruby
    4. Redis

* Configuration

* Database creation
````bash
    sudo docker-compose run web rake db:setup
````
* OR
````bash
    sudo docker-compose run web rake db:create
    sudo docker-compose run web rake db:migrate
````

* Database initialization(run only if not used setup)
````bash
    sudo docker-compose run web rake db:seed
````

* How to run the test suite
````bash
    sudo docker-compose run web bundle exec rspec
````

* Services
    1. Blockchain

* Start the blockchain
````bash
    sudo docker-compose up
````
* Access the blockchain
````bash
    http://localhost
````