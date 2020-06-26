## Medico Backend
---
Medico is a simple application that connect patients with doctor of different speciality.<br>
This is the web api section of the simple medico application built using ruby on rails.<br>
[The front-end section lives here.](https://github.com/Urchmaney/medico)

### Technologies
---
 1. Ruby on rails
 2. Minitest for testing
 3. Gems (Figaro, jwt)
 4. Postgres Database

### Installation
---
1. clone repository but running ```git clone https://github.com/Urchmaney/medico-backend.git``` on command prompt.

2. Run `bundle install` to install all required gems.

3. Run `bundle exec figaro install` to setup figaro and create application.yml file in config folder.

4. In application.yml file add `AUTH_SECRET: [ANY SECRET VALUE]` without the square braces.
   You can run `rails secret` in project command terminal to get a unique secret if you need to.
5. Also add `AUTH_SECRET : ***` for production as instructed in the file (application.yml).

6. Run `rails db:create` and `rails db:migrate` to set up database.

7. Run `rails test` to run tests and confirm all test run successfully.

8. Run `rails server` to host on your local machine. It can also be hosted it on a live server.But make neccessary changes to api links in calling application.
9. If application is going for production, after deployment run `figaro heroku:set -e production` to set environment variables    in production.


### Authors
---
 * [Unegbu kingsley](https://github.com/Urchmaney/medico)
