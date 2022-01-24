#!/bin/sh

# create users
rm -rf $HOME/.alteredcarbon
CHAINID=alteredcarbon
DENOM=uacarb
alteredcarbond config chain-id $CHAINID

echo "Setting up keyring-backend..."
alteredcarbond config keyring-backend test
alteredcarbond config output json
echo "Adding up validator..."
yes | alteredcarbond keys add validator
echo "Adding up treasury..."
yes | alteredcarbond keys add treasury

VALIDATOR=$(alteredcarbond keys show validator -a)
TREASURY=$(alteredcarbond keys show treasury -a)
echo "Got VALIDATOR $VALIDATOR"
echo "Got TREASURY $TREASURY"


# setup chain
alteredcarbond init $CHAINID --chain-id $CHAINID
# modify config for development
# config="$HOME/.alteredcarbond/config/config.toml"
# if [ "$(uname)" = "Linux" ]; then
#   sed -i "s/cors_allowed_origins = \[\]/cors_allowed_origins = [\"*\"]/g" $config
# else
#   sed -i '' "s/cors_allowed_origins = \[\]/cors_allowed_origins = [\"*\"]/g" $config
# fi

sed -e "s/\"stake\"/\"$DENOM\"/g" /Users/richurley/.alteredcarbon/config/genesis.json
alteredcarbond add-genesis-account $VALIDATOR 1000000000000uacarb
alteredcarbond add-genesis-account $TREASURY 2500000000000000uacarb
alteredcarbond prepare-genesis mainnet $CHAINID
alteredcarbond gentx validator 10000000000uacarb --chain-id $CHAINID --keyring-backend test
alteredcarbond collect-gentxs
alteredcarbond validate-genesis
alteredcarbond start
