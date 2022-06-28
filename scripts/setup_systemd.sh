#!/bin/bash

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

cp ../systemd/blockscout_entrypoint.sh /opt/blockscout/blockscout_entrypoint.sh
chmod +x /opt/blockscout/blockscout_entrypoint.sh

sudo cp ../systemd/blockscout.service /etc/systemd/system/blockscout.service
