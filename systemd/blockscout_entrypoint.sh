#!/bin/bash
# export $(grep -v '^#' .env | xargs -d '\n')
source ~/.bashrc
mix phx.server
