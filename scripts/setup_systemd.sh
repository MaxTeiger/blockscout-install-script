#!/bin/bash

cp ../systemd/blockscout_entrypoint.sh ~/blockscout/blockscout_entrypoint.sh
chmod +x ~/blockscout/blockscout_entrypoint.sh

sudo cp ../systemd/blockscout.service /etc/systemd/system/blockscout.service
