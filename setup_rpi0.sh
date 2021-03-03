# For setting up RaspberryPi Zero
# Update Package List
# REMOVE Microsoft Crap
sudo rm ~/etc/apt/sources.list.d/vscode.list
sudo rm ~/etc/apt/trusted.gpg.d/microsoft.gpg
(or for rpi 2)
sudo rm ~/../../etc/apt/sources.list.d/vscode.list
sudo rm ~/../../etc/apt/trusted.gpg.d/microsoft.gpg
# update system package list
sudo apt update

# INSTALL NODE JS
nodeVer=v15.9.0
instructionSet=armv61
sudo wget https://unofficial-builds.nodejs.org/download/release/$nodeVer/node-$nodeVer-linux-$instructionSet.tar.xz
sudo tar -xvf node-$nodeVer-linux-$instructionSet.tar.xz
sudo cp -R node-$nodeVer-linux-$instructionSet/* /usr/local/

# _(OPTIONAL) INSTALL YARN Package Manager_
sudo npm install --global yarn

# _(OPTIONAL) Install Process Manager_
sudo yarn global add pm2
#optional if you want pm2 to run typescript files, but not recommended for production
sudo pm2 install typescript 

# _(OPTIONAL) Install Typescript_
sudo yarn global add typescript
sudo yarn global add ts-node

# _(OPTIONAL) Install GPIO Zero library_
sudo apt install python3-gpiozero

# _(OPTIONAL) Install Angular Globally_
sudo yarn global add @angular/cli