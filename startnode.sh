#!/bin/sh

# create users
rm -rf $HOME/.alteredcarbond
alteredcarbond config chain-id localnet-1

KEYS=$(alteredcarbond keys list )
if [[ -n $KEYS  ]]
then
    echo "Existing key config found."
else
    echo "Setting up keyring-backend..."
    alteredcarbond config keyring-backend
    alteredcarbond config output json
    echo "Adding up validator..."
    yes | alteredcarbond keys add validator
    echo "Adding up treasury..."
    yes | alteredcarbond keys add treasury
fi



VALIDATOR=$(alteredcarbond keys show validator -a)
TREASURY=$(alteredcarbond keys show treasury -a)
echo "Got VALIDATOR $VALIDATOR"
echo "Got TREASURY $TREASURY"


# setup chain

gen=$($HOME/.alteredcarbon/config/genesis.json)
if [[ -n gen ]]
then
    echo "Genesis file exists on your filesystem. Not re-initalising chain."
else
    echo "Setting up mainnet..."
    alteredcarbond init alteredcarbon --chain-id mainnet-1
fi
# modify config for development
# config="$HOME/.alteredcarbond/config/config.toml"
# if [ "$(uname)" = "Linux" ]; then
#   sed -i "s/cors_allowed_origins = \[\]/cors_allowed_origins = [\"*\"]/g" $config
# else
#   sed -i '' "s/cors_allowed_origins = \[\]/cors_allowed_origins = [\"*\"]/g" $config
# fi

tx=$($HOME/.alteredcarbon/config/gentx/gentx-*.json)
if [[ -n tx  ]]
then
    echo "Genesis transaction on your filesystem. Not creating genesis transaction."
else
    echo "Creating genesis transaction...."
    alteredcarbond gentx validator 10000000000uacarb --chain-id localnet-1 
    alteredcarbond add-genesis-account $VALIDATOR 1000000000000uacarb
    alteredcarbond add-genesis-account $TREASURY 2500000000000000uacarb
fi

alteredcarbond collect-gentxs
alteredcarbond validate-genesis
alteredcarbond start
