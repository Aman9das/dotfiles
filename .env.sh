#! /usr/bin/sh

export BWS_ACCESS_TOKEN=$(cat ~/.bws_token)

export OPENAI_API_KEY=$(bws secret get 0159e7df-f772-41d2-b239-b124008c3668 | jq '.value' | tr -d '"')
