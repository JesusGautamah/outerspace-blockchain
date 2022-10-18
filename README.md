# Outerspace Blockchain

A Ruby implementation of the Outerspace blockchain.
Developed using TDD (Test Driven Development).
Chrome Selenium tests are used to test the blockchain in a browser and its interaction with the blockchain.
Chrome Selenium are included in the docker compose without any additional setup.
Simplecov is used to test code coverage.

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

## System dependencies
    1. Docker
    2. Postgresql
    3. Ruby
    4. Redis

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

MIT License

Copyright (c) 2022 Igor Lima de Jesus

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.