# malone Readme

## Database Setup

You'll need to create config/database.yml file for your local database connection. Here's a sample:

    development:
      adapter: postgresql
      encoding: unicode
      database: malone_development
      pool: 5
    test:
      adapter: postgresql
      encoding: unicode
      database: malone_test
      pool: 5

## Guard
Run the following command to automatically execute your tests as you change them.

    bundle exec guard start -i

## Code coverage
Run the following command to execute all tests and view a code coverage report.

    bundle exec rspec . ; open coverage/index.html

## Github
Assuming the repo has already been created, execute the following to do your first push to github

    git remote add origin <git_repo_url>
    git push -u origin master

## Twitter Bootstrap
More info on using Twitter Bootstrap

* [http://twitter.github.com/bootstrap/](http://twitter.github.com/bootstrap/)
* [https://github.com/seyhunak/twitter-bootstrap-rails](https://github.com/seyhunak/twitter-bootstrap-rails)

## Simple Form
More info on using Simple Form

[https://github.com/plataformatec/simple_form](https://github.com/plataformatec/simple_form)

Inside your views, use the 'simple_form_for' with one of the Bootstrap form
  classes, '.form-horizontal', '.form-inline', '.form-search' or
  '.form-vertical', as the following:

    <%= simple_form_for(@user, :html => {:class => 'form-horizontal' }) do |f| %>
    <% end %>

## Turbolinks
This app has the [turbolinks](https://github.com/rails/turbolinks) gem installed and enabled. This gem makes page loading
significantly faster, but it does change the DOM events you need to listen to when running javascript on a page.
Read the docs for more info.

## Heroku
You will need to add memcache and newrelic to your heroku app in order to use them
as they are configured in this app. Note that all of these options are free on Heroku.

### Install memcache

    heroku addons:add memcache

### Install New Relic

    heroku addons:add newrelic:standard

### Install Backup
We strongly recommend that you also configure heroku to backup your database.

    heroku addons:add pgbackups:auto-month

