#!/bin/sh

# create users
rm -rf $HOME/.alteredcarbond
alteredcarbond config chain-id localnet-1
alteredcarbond config keyring-backend
alteredcarbond config output json
yes | alteredcarbond keys add validator
yes | alteredcarbond keys add treasury

VALIDATOR=$(alteredcarbond keys show validator -a)
TREASURY=$(alteredcarbond keys show creator -a)

# setup chain
alteredcarbond init alteredcarbon --chain-id mainnet-1
# modify config for development
# config="$HOME/.alteredcarbond/config/config.toml"
# if [ "$(uname)" = "Linux" ]; then
#   sed -i "s/cors_allowed_origins = \[\]/cors_allowed_origins = [\"*\"]/g" $config
# else
#   sed -i '' "s/cors_allowed_origins = \[\]/cors_allowed_origins = [\"*\"]/g" $config
# fi

alteredcarbond add-genesis-account $VALIDATOR 10000000000000000stake
alteredcarbond add-genesis-account $TREASURY 10000000000000000ustarx
alteredcarbond gentx validator 10000000000stake --chain-id localnet-1 --keyring-backend
alteredcarbond collect-gentxs
alteredcarbond validate-genesis
alteredcarbond start
