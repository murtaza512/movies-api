# Movies Collection Backend

Movie Collection Endpoint is a Github repository that provides a RESTful API for managing a database of movies. It allows users to perform operations on movie records.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Installing


* Ruby version
 3.1.0

 ```
 rvm install 3.1.0
 ```
* Database
postgresql

```
brew install postgres
```


* Clone the repository


```
mkdir movies_endpoint

cd movies_endpoint

git clone https://github.com/murtaza512/movies-api.git

cd movies_endpoint
```

* Install Gems
```
bundle install
```

* Database creation

```
  rails db:create
  rails db:migrate
```

* Populate Database with csv data
```
  rails db:seed
```

* Run app locally on 3000 port

```
rails server
```

it will run the app on this url. Visit it and you can play with it
http://localhost:3000/

* How to run the test suite

```
rspec
```

### Gems and plugins
- Used rspec, factorybot along with shoulda matchers gem for test coverage

### Workflow and functionality

- User can see the all the movies on root page
- User can see details of specific movie by clicking on it
- User can switch to different pages using Page numbers buttons
