# Cromer

Requirements:

Phoenix (Erlang/OTP 17, Elixir 1.0.5) : http://www.phoenixframework.org/docs/installation

### How to get started

1. Install dependencies with `mix deps.get`
2. Install node dependencies with `npm install`
3. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit `localhost:4000` from your browser.

Interactive shell:

```bash
$ iex -S mix phoenix.server
```

Running tests:

```bash
$ mix test
```
#### Database and migration

Setup a postgreSQL through a Docker container

```bash
$ docker run -i -t --name cromer-database --publish="5432:5432" -d postgres:9.3
```

Create database

```bash
$ mix ecto.create
```

Running migrations

```bash
$ mix ecto.migrate
```

How to stop/remove postgreSQL

```bash
$ docker stop cromer-database
$ docker rm cromer-database
```
