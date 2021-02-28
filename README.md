#  rpiZeroSetup
Setup and configure an rpiZero with nodejs, typescript, yarn, pm2, and a test project


# Setup RaspberryPi OS
* Copy Raspbian to an SSD card
  * (Preferred: Headless)
  * https://www.raspberrypi.org/software/
* Open the ssd card on your computer in a terminal
  * `cd yourDriveLetter:`
## Setup SSH Access
* `touch ssh`
## Setup Wifi
`nano wpa_supplicant.conf`
* add the following text to the file and save
    ```
    country=US
    ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
    update_config=1

    network={
    ssid="YOUR_SSID"
    scan_ssid=1
    psk="YOUR_WIFI_PASSWORD"
    }
    ```

* Make sure your raspberry pi zero is off
* Now eject your sd card from your computer, and insert it into your pi zero
* make sure your raspberry pi is the only one on the network, otherwise it will be named raspberrypi-2 (or whatever #), and you'll have to likely access it by IP address
* power on your raspberry pi zero
* wait a minute then try to connect
  * `ssh pi@raspberrypi  * the password is raspberry`
  * you are now in a terminal of your raspberry pi zero!
* _(OPTIONAL) change your password_
  * `sudo passwd`

# _(OPTIONAL) Setup Passwordless SSH Access using Keys_
* on your computer find your key
  * `ls ~/.ssh/*.pub`
* if you don't have a key or want a different one generate it
  * `ssh-keygen`
* once you have your key, copy it over ssh to your rpi
  * `cat ~/.ssh/id_rsa.pub`
ssh-copy-id pi@raspberrypi #authenticate using your password
* you should now be able to access your rpi without a password
  * `ssh pi@raspberrypi`

# INSTALL GIT
https://git-scm.com/

` sudo apt install git`

# _(OPTIONAL) SSH ACCESS TO GITHUB_
_SSH access allows you to authenticate using keys instead of passwords._

https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh
* list ssh keys, use an existing public one or create a new one
  * `ls ~./ssh/*.pub`
* to generate a key
  * `ssh-keygen -t ed25519 -C "your_user_name@github.com"`
* display the key
  * `cat ~./ssh/id_ed25519.pub`
* copy the displayed text to the keyboard
* add the key to your github account ssh keys
* test your key, you should get a success message
  * `ssh git@github`

### _From here you can either run the rest of the steps manually, or clone the repo and run the setup file using `sudo setup.sh`_ 

# set timezone
`sudo raspi-config`

go to localization options > timezone

# Update Package List
* REMOVE Microsoft Crap
  * `sudo rm /etc/apt/sources.list.d/vscode.list`
  * `sudo rm /etc/apt/trusted.gpg.d/microsoft.gpg`
* update system package list
  * `sudo apt update`
* _(OPTIONAL) update all installed packages_
  * `sudo apt-get dist-upgrade`


# INSTALL NODE JS
_for rpi zero, use armv61 binaries from nodejs.org_

_these binaries are no longer officially supported as of node 12+, so you'll have to install node12, or an unnoficial binary_

* download the latest official armv61 binary (node 11.x)
  * https://nodejs.org/dist/latest-v11.x/
* or download the latest unnoficial binary here:
  * https://unofficial-builds.nodejs.org/download/release/

_IN the example below we will use the latest unnoficial version_

`sudo mkdir ~/downloads`

`cd ~/downloads`
* for ease, set this variable to the build version
nodeVer=v15.9.0
sudo wget https://unofficial-builds.nodejs.org/download/release/$nodeVer/node-$nodeVer-linux-armv6l.tar.xz
* extract and run it
sudo tar -xvf node-$nodeVer-linux-armv6l.tar.xz
* copy to local
sudo cp -R node-$nodeVer-linux-armv6l/* /usr/local/
* verify installation, nodejs and npm should now be installed
  * `node -v`
  * `npm -v`

# _(OPTIONAL) INSTALL YARN Package Manager_
_Yarn is an alternative to NPM_
https://yarnpkg.com/
* npm is bundled with node, use npm to install yarn
* otherwise apt-get will find the cmdtest yarn package which is different
* install yarn globally
  * `sudo npm install --global yarn`
* verify installation
  * `yarn -v`

# _(OPTIONAL) Install Process Manager_
_This will allow you to automatically start your code on power on, or restart code that exits_
  https://www.npmjs.com/package/pm2
* install pm2 globally (use `npm` if you didn't install yarn)
  * `sudo yarn global add pm2`
* install typescript for pm2 (#optional if you want pm2 to run typescript files, but not recommended for production)
  * `sudo pm2 install typescript`
* verify installation
  * `pm2 -v`

# _(OPTIONAL) Install Typescript_
`sudo yarn global add typescript`

`sudo yarn global add ts-node`

* Start a repl using `ts-node repl`

# _(OPTIONAL) Clone a test Repo_
* I recommend putting your repos in a folder like 'projects'
* `mkdir projects`
* `cd projects`
* If you setup ssh access to git, you can use the command below
  * `git clone git@github.com:seadonk/rpiZeroSetup.git`
* If not, then use this command
  * `git clone https://github.com/seadonk/rpiZeroSetup.git`
* `cd rpiZeroSetup`
* Install packages
   * `yarn install` 
* `yarn start` _or npm start if you didn't install yarn_
   * You should see test output
* `yarn start-express`
   * You should see a url that you can access to find "Hello World"


# _(OPTIONAL) Create your hello world example_
* In your projects directory, make a new folder:
  * `mkdir helloWorld`
  * `cd helloWorld`
* Create an app.ts file and add some output
  * `nano app.ts`
  * ``console.log(`${new Date().toLocaleTimeString('short')} - Hello World!`)``
* Run your app
  * `ts-node app.ts`
  * You should see your hello world output.