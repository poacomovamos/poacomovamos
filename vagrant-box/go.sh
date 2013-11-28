#!/usr/bin/env bash

set -e

echo "Running:"
echo ".. Making sure VM is up"
vagrant --no-provision up

echo ".. Making sure VM is fully provisioned"
vagrant provision

echo ".. Starting up Project"
vagrant ssh -c "cd /poacomovamos/ && bundle install"
vagrant ssh -c "cd /poacomovamos/ && shotgun -o 0.0.0.0"

echo ".. Done - navigate to http://localhost:9393 to view the application"