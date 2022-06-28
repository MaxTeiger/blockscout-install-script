#!/bin/bash
cd ~
git clone https://github.com/poanetwork/blockscout
cd blockscout

# Install Elixir / Erlang / Node dependencies for the specified version
asdf install

# Install mix deps
eval "mix do deps.get, local.rebar --force, deps.compile"

# create and export secret
echo "export SECRET_KEY_BASE=$(mix phx.gen.secret)" > ~/.profile
cat .env > ~/.profile

# Clean from previous deployments
mix phx.digest.clean

# Compile
mix compile

# Install nodejs deps
cd apps/block_scout_web/assets; npm install && node_modules/webpack/bin/webpack.js --mode production; cd -
cd apps/explorer && npm install; cd -

# Build static assets
mix phx.digest

# # Enable HTTPS in development
# cd apps/block_scout_web; mix phx.gen.cert blockscout blockscout.local; cd -

# Export required environment variables in profile for persisting accross
# sessions
echo "export $(grep -v '^#' .env | tr '\n' '\0' | xargs -0 '\n')" > ~/.profile
