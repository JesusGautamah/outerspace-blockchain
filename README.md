# <img src="https://outerspace-coding.herokuapp.com/assets/pq-70825bc795d25668cf4f11b06b990ed0d1c2cae887acce0625e5059226a7946a.png" width="25" height="25"> Outerspace Blockchain
<!-- Outerspace Logo -->


### A Ruby implementation of the Outerspace blockchain.
#### Developed using TDD (Test Driven Development).
#### Chrome Selenium tests are used to test the blockchain in a browser and its interaction with the blockchain.
#### Chrome Selenium are included in the docker compose without any additional setup.
#### Simplecov is used to test code coverage.

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

## RVM Commands to install Ruby 3.0.3 and Rails
* `rvm install 3.0.3`
* `rvm use 3.0.3`
* `rvm gemset create outerspace`
* `rvm gemset use outerspace`
* `gem install bundler`
* `bundle install`
## Configuration
### Rake tasks

This application has rake tasks to help you with the development process with docker.
The tasks are:

* `rake compose:install` - build docker compose and migrate the database
* `rake compose:up` - start the docker compose services
* `rake compose:down` - stop the docker compose services
* `rake compose:migration` - run the migrations
* `rake compose:restart` - restart the docker compose services
* `rake compose:test` - run rspec tests with docker compose services
* `rake compose:reset` - rebuild the docker compose and reset database


### LOGS
To see the logs of the development environment, use the log file created by rails in the log folder. Path: `log/development.log`
Test logs is in the log/test.log file. But the test suit is printing the logs in the terminal correctly.

## Start the blockchain
````bash
$ rake compose:up
````
### Access the blockchain web interface
http://localhost

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/outerspace-coding/outerspace-blockchain

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
* [LICENSE](LICENSE) - MIT License