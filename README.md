# <img src="https://outerspace-coding.herokuapp.com/assets/pq-70825bc795d25668cf4f11b06b990ed0d1c2cae887acce0625e5059226a7946a.png" width="25" height="25"> Outerspace Blockchain
<!-- Outerspace Logo -->
### A Ruby implementation of web blockchain framework.
#### Developed using TDD (Test Driven Development).
#### Github Actions CI/CD pipeline.
#### Chrome Selenium tests are used to test the blockchain in a browser and its interaction with the blockchain.
#### Chrome Selenium are included in the docker compose without any additional setup.
#### Simplecov is used to test code coverage.

#### Rails Engine is used to create the blockchain.
#### Tailwind CSS is used to style the blockchain web interface.

#### Rspec is used to test the blockchain.

## System dependencies
    1. Docker
    2. Postgresql
    3. Ruby
    4. Redis

* Ruby 3.0.3
* Compose Version 3.3
* Docker Image: ruby:3.0.3

* [Installation](#installation)
    - [Docker](#docker) https://docs.docker.com/engine/install/
    - [RVM](#rvm) https://rvm.io/rvm/install
    - [Redis](#redis) https://redis.io/download
    - [Postgres](#postgres) https://www.postgresql.org/download/
    - [Rails](#rails) https://guides.rubyonrails.org/getting_started.html

### Compile OSBC from source
========================
<!-- Compile OSBC from source -->
Compile the gem from source with the following commands:
```bash
git clone 
cd outerspace-blockchain
bundle install
```

### Run OSBC
========================
<!-- Run OSBC -->
Run the gem with the following command:
```bash
bin/osbc
```

### Installation
========================
<!-- Installation -->
Build and install the gem with the following commands:
```bash
gem build osbc.gemspec
gem install osbc-GENERATED_VERSION.gem
```

Use the gem with the following command:
```bash
osbc PATH_TO_GENERATE_BLOCKCHAIN
``` 
## RVM Commands to install Ruby 3.0.3 and Compile the Gem
* `rvm install 3.0.3`
* `rvm use 3.0.3`
* `rvm gemset create outerspace`
* `rvm gemset use outerspace`
* `gem install bundler`
* `bundle install`
## Environment Variables
The application has a .env file in root folder with the following environment variables:

    FIRST_CHAIN_NAME=YOUR_CHAIN_NAME
    FIRST_CHAIN_MAINTAINER=YOUR_NAME
    CONTRACTS_LIMIT=100
    SIGNATURES_LIMIT=5
## Configuration
### Rake tasks

This application has rake tasks to help you with the development process with docker.
The tasks are:
#### Docker actions
* `rake compose:install` - build docker compose and migrate the database
* `rake compose:up` - start the docker compose services
* `rake compose:down` - stop the docker compose services
* `rake compose:restart` - restart the docker compose services
* `rake compose:test` - run rspec tests with docker compose services
* `rake compose:build` - build docker compose services
* `rake compose:db_detach` - detach the database from the docker compose services
* `rake compose:redis_detach` - detach the redis from the docker compose services
* `rake compose:back_detach` - detach the backend(redis, sidekiq, db) from the docker compose services
* `rake compose:clean_all` - clean all docker compose services
#### Database actions
* `rake compose_db:migrate` - migrate the database
* `rake compose_db:reset` - reset the database
* `rake compose_db:drop` - drop the database
* `rake compose_db:create` - create the database
* `rake compose_db:seed` - seed the database
* `rake compose_db:rollback` - rollback the database
* `rake compose_db:setup` - setup the database
* `rake compose_db:complete_setup` - complete setup the database
* `rake compose_db:reset_setup` - drop and setup the database
* `rake compose_db:reset` - reset the database
### LOGS
To see the logs of the development environment, use the log file created by rails in the log folder. Path: `log/development.log`
Test logs is in the log/test.log file. But the test suit is printing the logs in the terminal correctly.

## Start the blockchain
````bash
$ rake compose:up
````
### Access the blockchain web interface
http://localhost

## Mining Concept
- Every user will have a **randomized acceptable word list**
- This word list will have three classes of words
1. Common words
2. Symbol Sequence
3. Number Sequence

<p> 
When a user want to mine a block, the user will open a ticket in the server
and after the ticket is open, the user will start to mine the block
</p> 

<p>
The mine will depend of the contract signatures that will be formed by the server using the word list of the user
</p>


## Steps to mine a block:

1. The user will open a TICKET in the server
2. The server will send a message to the user to start mining if the POOL is open
3. The users will load the RANDOM WORD LIST provided by the server API
4. The user have to use 1 common word, 1 symbol sequence and 1 number sequence, randomize the characters
5. Transform the chartacters in a SHA256 hash
6. Transform the block info in before ticket opened in a SHA256 hash
5. Transform (Chars SHA256 hash + block info hash) in a SHA256 hash
6. If the hash is valid, the user will send the hash to the server
7. The server will check if the hash is valid
8. If the hash is valid, check if the same transactions have the same block state confirmation
9. If this transactions was not confirmed at this point at block history the server will add the user signature to the transaction contract
10. The block only can be hashed when the minimum number of contracts valids with minimum number of signatures is reached
11. The server will use the signature timeline to determine what transactions will be added to the block
12. The server will calculate the master hash after confirm all valid contracts signatures
13. The server will add the block to the blockchain and create a new one with last block unconfirmed transactions but completely unsigned
13. The server will start a open/closed pool cycle
14. The server will send a message to the user to start mining when the POOL is open and user has a ticket
<p>
The timestamps of the signatures will be usefull to version the block, checking it as a timeline
</p>

**The miners will be rewarded with the block reward distributed by the number of signatures**
## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/outerspace-coding/outerspace-blockchain

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
* [LICENSE](LICENSE) - MIT License