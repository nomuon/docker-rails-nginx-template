# Description

- Docker: 3
- Nginx: 1.15.10
- Ruby: 2.6
    - Ruby on Rails: 5.2.3

# Usage

## docker-compose build
```
$ docker-compose build
$ docker-compose up
```

## create database
```
$ docker-compose run --rm app rake db:create
```
