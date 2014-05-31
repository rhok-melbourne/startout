# Startout

This app was developed as a part of RHoK Melbourne.

## Development Setup

The following should get you started hacking:

```
$ cp config/database.yml.example config/database.yml
$ cp .env.example .env
$ bundle install
$ rake db:create db:migrate db:seed
$ foreman start
```
