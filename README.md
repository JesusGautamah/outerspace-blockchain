# <img src="https://osbc-blockchain.herokuapp.com/assets/logo-70825bc795d25668cf4f11b06b990ed0d1c2cae887acce0625e5059226a7946a.png" width="25" height="25"> Outerspace Blockchain
<!-- Outerspace Logo -->
## What is Outerspace Blockchain?
### A Ruby implementation of web blockchain framework.
Outerspace Blockchain is a blockchain framework that allows you to create your own blockchain in a few minutes with this backend server.
This application has the intention to be a blockchain framework that can be used to create a blockchain with a web interface and a mobile wallet.
Utility Tokens and NFT's will be supported native in this blockchain framework.
This blockchain framework will be used to create a blockchain for the Outerspace Coding projects in the future.

This blockchain works with a different approach than the other blockchains.
Use it to work with less complexity and more flexibility.
Perfect for small/medium projects that need a blockchain and can't use Ethereum Network or other blockchains.

Remember always to verify your enviroment variables and do security modifications like changing the default passwords, increasing the security of the database, etc.

### This application is unstable and under development.
### Please, use it with caution and at your own risk.
### Demo version:  (temporary down)
https://osbc.outerspacecoding.com

#### Developed using TDD (Test Driven Development).
#### Github Actions CI/CD pipeline.
#### Firestore will be used to store the blockchain data.

#### Simplecov is used to test code coverage.

#### Rails Engine is used to create the blockchain.
#### Tailwind CSS is used to style the blockchain web interface.

#### Rspec is used to test the blockchain.

## Build Version: 0.2.1

## In Progress
* [ ] Add and correct tests
* [ ] Better layout for the blockchain web interface
* [ ] Add and correct documentation, create api documentation page
## Todo
* [ ] Better Rack Cors Config
* [ ] Add Rack Attack and Rack Attack Throttle
* [ ] Simplify SMTP configuration
* [ ] Create a template for the user registration email
* [ ] Create blockchain report mailer to admin
* [ ] Create blockchain monitor board to admin
* [ ] Firestore integration (this will be used instead of Redis management)
* [ ] Add user verification methods
* [ ] Increase environment variables for easily setup custom information for the blockchain
* [ ] Create the price visualization and the price history api
* [ ] Add more blockchain features
* [ ] Add more blockchain tests
* [ ] Add more blockchain documentation
* [ ] Add nft's classification class
* [ ] Add nft's modularization class
* [ ] Add nft's generator class
* [ ] Benchmark blockchain and mining
* [ ] Create a blockchain dinamic explorer
* [ ] Create a default blockchain wallet android app generator with flutter
* [ ] Create generators that will work with rails and flutter at the same time
* [ ] Create the user marketplace
* [ ] Integrate Blockchain Api in other projects

Kubernetes integration will be worked on in the future.
Appwrite integration will be worked on in the future.
## System dependencies
    1. Docker
    2. Postgresql
    3. Ruby
    4. Redis

* Ruby 3.2
* Compose Version 3.3
* Docker Image: ruby:3.2

* [Installation](#installation)
    - [Docker](#docker) https://docs.docker.com/engine/install/
    - [RVM](#rvm) https://rvm.io/rvm/install
    - [Redis](#redis) https://redis.io/download
    - [Postgres](#postgres) https://www.postgresql.org/download/
    - [Rails](#rails) https://guides.rubyonrails.org/getting_started.html

### Install it from RubyGems (Ruby 3.2)
```bash
gem install osbc
```
## Run to generate new project
```bash
osbc PATH
```
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
## RVM Commands to install Ruby 3.2
* `rvm install 3.2`
* `rvm use 3.2`
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
### Lucy Dockerunner gem

This application has rake tasks to help you with the development process with docker imported from the [Lucy Dockerunner](https://rubygems.org/gems/lucy_dockerunner) gem.
Example of the rake tasks:
#### Docker actions
* `rake compose:install` - build docker compose and migrate the database
* `rake compose:build` - build docker compose services
* `rake compose:up` - start the docker compose services
* `rake compose:down` - stop the docker compose services
* `rake compose:db_detach` - detach the database from the docker compose services
* `rake compose:restart` - restart the docker compose services
* `rake compose:clean_all` - clean all docker compose services
* `rake compose:clean_volumes` - clean docker compose volumes
... more commands in the [Github: Lucy Dockerunner](https://github.com/JesusGautamah/lucy_dockerunner) gem
#### Database actions
* `rake compose_db:migrate` - migrate the database
* `rake compose_db:reset` - reset the database
* `rake compose_db:drop` - drop the database
* `rake compose_db:create` - create the database
... more commands in the [Github: Lucy Dockerunner](https://github.com/JesusGautamah/lucy_dockerunner) gem

### Tests actions
* `rake compose_test:all` - run all tests
* `rake compose_test:clean_all` - run all tests after cleaning docker compose services
* `rake compose_test:controllers` - run controllers tests
* `rake compose_test:models` - run models tests
* `rake compose_test:requests` - run requests tests
... more commands in the [Github: Lucy Dockerunner](https://github.com/JesusGautamah/lucy_dockerunner) gem

### LOGS actions
* `rake compose_logs:web` - show web logs
* `rake compose_logs:db` - show db logs
* `rake compose_logs:redis` - show redis logs
* `rake compose_logs:sidekiq` - show sidekiq logs
* `rake compose_logs:all` - show all logs
* `rake compose_logs:tail_web` - tail web logs
* `rake compose_logs:tail_db` - tail db logs
... more commands in the [Github: Lucy Dockerunner](https://github.com/JesusGautamah/lucy_dockerunner) gem
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
5. Transform the shuffled chartacters in a SHA256 hash
6. The user will send the hash to the server
7. The server will validate the hash and will send a message to the user if the hash is valid
8. If the hash is valid, check if the same transactions have the same block state confirmation, if yes, the user will have to mine again in a new state of the transactions timeline
9. If this transactions was not confirmed at this point at block history the server will add the user signature to the transactions contracts included in the users ticket timeline range
10. The block only can be hashed when the minimum number of contracts valids with minimum number of signatures is reached
11. The server will use the signature timeline to determine what transactions will be added to the block
12. The server will calculate the master hash after confirm all valid contracts signatures
13. Assignmaster hash to the block, create new block and add to the blockchain with previous block hash
13. The server will start a open/closed pool cycle ( pool is open only if has a minimun of transactions to mine )
14. The server will send a message to the user to start mining when the POOL is open and user has a ticket
<p>
The timestamps of the signatures will be usefull to version the block, checking it as a timeline
</p>

**The miners will be rewarded with the block reward distributed by the number of signatures**
## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/JesusGautamah/outerspace-blockchain

## [![Repography logo](https://images.repography.com/logo.svg)](https://repography.com) Recent activity 
[![Time period](https://images.repography.com/33522702/JesusGautamah/outerspace-blockchain/recent-activity/0yzGOYYHXYK_C0-EPT33h2yxMGPjAfT8cxuHq8Ukjrg/Zuq9y_QVJvoZeqCjzE6_J-roxfVO_FF0P0SDhZ9Yo6Y_badge.svg)](https://repography.com)

[![Timeline graph](https://images.repography.com/33522702/JesusGautamah/outerspace-blockchain/recent-activity/0yzGOYYHXYK_C0-EPT33h2yxMGPjAfT8cxuHq8Ukjrg/Zuq9y_QVJvoZeqCjzE6_J-roxfVO_FF0P0SDhZ9Yo6Y_timeline.svg)](https://github.com/JesusGautamah/outerspace-blockchain/commits)
[![Issue status graph](https://images.repography.com/33522702/JesusGautamah/outerspace-blockchain/recent-activity/0yzGOYYHXYK_C0-EPT33h2yxMGPjAfT8cxuHq8Ukjrg/Zuq9y_QVJvoZeqCjzE6_J-roxfVO_FF0P0SDhZ9Yo6Y_issues.svg)](https://github.com/JesusGautamah/outerspace-blockchain/issues)

[![Pull request status graph](https://images.repography.com/33522702/JesusGautamah/outerspace-blockchain/recent-activity/0yzGOYYHXYK_C0-EPT33h2yxMGPjAfT8cxuHq8Ukjrg/Zuq9y_QVJvoZeqCjzE6_J-roxfVO_FF0P0SDhZ9Yo6Y_prs.svg)](https://github.com/JesusGautamah/outerspace-blockchain/pulls)
[![Top contributors](https://images.repography.com/33522702/JesusGautamah/outerspace-blockchain/recent-activity/0yzGOYYHXYK_C0-EPT33h2yxMGPjAfT8cxuHq8Ukjrg/Zuq9y_QVJvoZeqCjzE6_J-roxfVO_FF0P0SDhZ9Yo6Y_users.svg)](https://github.com/JesusGautamah/outerspace-blockchain/graphs/contributors)

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
* [LICENSE](LICENSE) - MIT License