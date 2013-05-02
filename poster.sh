#!/bin/bash

curl -d '{"body": "140 characters"}' 'http://damp-taiga-5083.herokuapp.com/datum/new' -H Content-Type:application/json -v