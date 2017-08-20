# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

```
							ORM
ActiveRecod is an ORM: Object relational mapper that connects a database with actual Ruby objects. ActiveRecord follows
convention over configuration so to tell a class that it's an
ActiveRecord backed class we have to let the class inherit
from ActiveRecord: :Base
We get create from ActiveRecord and use it/add it to classes
in order to add info to database.

User.create( :name  => 'richard',
             :movie => 'zoolander')

	Here we have created two key/value pairs

	Read this from left to right

	> rich = User.where(:name => "richard", movie:.first
 =>(rocket/return) the key and all it's glory.

 puts rich.name

 ActiveRecord is a loose wrapper for Sql.

 rake db: create creates a database.

 rake db: drop will drop in an already populated database table.

 rake is from make: ruby make = rake

 1) rake db:create
 2) rake db:migrate


 After creating the migration files, we have to run  rails db:migrate
 before rspec.
 A Creating the Model and its supporting files.
 1) rails g to make the model
 2) rake or rails db:migrate
 3) check the schema.rb file
B) Create the tests.
```
