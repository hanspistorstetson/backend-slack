FROM elixir:latest

MAINTAINER Hans Pistor <hpistor@stetson.edu>

RUN mix local.hex --force

RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez

RUN mix local.rebar --force

WORKDIR /app
