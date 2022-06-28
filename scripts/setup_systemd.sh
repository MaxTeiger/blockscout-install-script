#!/bin/bash

cp ../systemd/blockscout_entrypoint.sh /opt/blockscout/blockscout_entrypoint.sh
chmod +x /opt/blockscout/blockscout_entrypoint.sh

sudo cp ../systemd/blockscout.service /etc/systemd/system/blockscout.service
