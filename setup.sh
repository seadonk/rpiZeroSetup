# Update Package List
# REMOVE Microsoft Crap
sudo rm /etc/apt/sources.list.d/vscode.list
sudo rm /etc/apt/trusted.gpg.d/microsoft.gpg
# update system package list
sudo apt update

# INSTALL NODE JS
nodeVer=v15.9.0
instructionSet=armv61
sudo wget https://unofficial-builds.nodejs.org/download/release/$nodeVer/node-$nodeVer-linux-$instructionSet.tar.xz
sudo tar -xvf node-$nodeVer-linux-$instructionSet.tar.xz
sudo cp -R node-$nodeVer-linux-$instructionSet/* /usr/local/
node -v
npm -v

# _(OPTIONAL) INSTALL YARN Package Manager_
sudo npm install --global yarn
yarn -v

# _(OPTIONAL) Install Process Manager_
sudo yarn global add pm2
sudo pm2 install typescript
pm2 -v

# _(OPTIONAL) Install Typescript_
sudo yarn global add typescript
sudo yarn global add ts-node