# Blockscout install scripts

## **Get started**

### **Deploy Infra**
Deploy a VM with required properties to expose a webserver and contact the database you setup. (To complete)

#### **Deploy Database**

#### **Deploy VM**

### **Setup Blockscout**

1. SSH into you're newly created VM
2. Run `git clone git@github.com:Arianee/blockscout-install-scripts.git`
3. Setup environment variables :
   1. Run `mv ./blockscout-install-scripts/.env.example ./blockscout-install-scripts/.env`
   2. Run `vim  ./blockscout-install-scripts/.env` and edit environment variables as specified in the [documentation](https://docs.blockscout.com/for-developers/information-and-settings/env-variables)
4. Setup `certbot` following this howto : [Certbot Install Cert Debian](https://certbot.eff.org/instructions?ws=other&os=debianbuster)
5. Run `sudo ./blockscout-install-scripts/install_blockscout.sh`
6. To start blockscout, run `sudo systemctl start blockscout`
