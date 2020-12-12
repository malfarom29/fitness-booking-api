# README

API developed on Ruby on Rails which register different activities and these can
scheduled by an admin and booked by a client.

Things you may want to cover:

* Ruby version
```
ruby 2.7.2
```

* Configuration

In order to have up and running the app, you must create the database, run the
migrations and seeds, you can test on the go.

```
rails db:create
rails db:migrate
rails db:seed 
```

The example users are:

```
# admin
admin@admin.com / admin123

# client
johndoe@example.com / test123
```

* How to run the test suite

The tests were made with RSpec, run the following command in order to run them

```
rails spec
```

For the swagger documentation for this project, 
in case the swagger.yaml file is not present, run
```
rails rswag:specs:swaggerize
``` 

To start the application run
```
rails s
```

And you're ready to go 
