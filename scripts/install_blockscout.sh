#!/bin/bash
cd /opt
git clone https://github.com/poanetwork/blockscout
cd blockscout

# Install Elixir / Erlang / Node dependencies for the specified version
asdf install

# Install mix deps
eval "mix do deps.get, local.rebar --force, deps.compile"

# create and export secret
echo "export SECRET_KEY_BASE=$(mix phx.gen.secret)" > ~/.bashrc
# cat .env > ~/.profile

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

# Enabble HTTP/S in production
cat <<EOF >> ./config/prod.exs
config :block_scout_web, BlockScoutWeb.Endpoint,
  http: [port: 80],
  https: [
    port: 443,
    cipher_suite: :strong,
    certfile: "/etc/letsencrypt/live/blockscout.ce.arianee.net/fullchain.pem",
    keyfile: "/etc/letsencrypt/live/blockscout.ce.arianee.net/privkey.pem"
  ]
EOF

# Export required environment variables in profile for persisting accross
# sessions
echo "export $(grep -v '^#' /env/.env | tr '\n' '\0' | xargs -0 '\n')" > ~/.bashrc
