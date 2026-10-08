#!/usr/bin/env bash
set -o errexit

bundle install
bin/rails assets:precompile
bin/rails assets:clean
bin/rails db:migrate

if [ "${SEED_DATABASE:-false}" = "true" ]; then
  bin/rails db:seed
fi

postgresql://movie_rwv7_user:XfgZokOGzsi8H9AIFDzuvAjSQq5Hmc6P@dpg-db3i34jtqb8s73e3mmmg-a/movie_rwv7