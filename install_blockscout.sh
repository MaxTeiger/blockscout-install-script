#!/bin/bash
echo "---   Install requirements   ---"
./scripts/install_requirements.sh

echo "---   Install blockscout ---"
./scripts/install_blockscout.sh

echo "--- Setup systemd blockscout service ---"
./scripts/setup_systemd.sh

echo "To start blockscout, just run 'sudo systemctl start blockscout'"
