# SL
## About
Modified scripts for automated installation of LMS Client (Squeezebox Lite) on a freshly installed Raspberry Pi with HifiBerry Amp2.

The installation is based on [this](http://www.gerrelt.nl/RaspberryPi/wordpress/tutorial-installing-squeezelite-player-on-raspbian) tutorial

## Download and Installation
```
cd ~
mkdir squeezelite
cd squeezelite
sudo wget https://raw.githubusercontent.com/daniel1v/SL/master/install.sh
sudo wget https://raw.githubusercontent.com/daniel1v/SL/master/squeezelite_settings.sh 
sudo wget https://raw.githubusercontent.com/daniel1v/SL/master/squeezelitehf.sh
sudo wget https://raw.githubusercontent.com/daniel1v/SL/master/squeezelite.service

sudo nano install.sh
sudo chmod a+x install.sh
sudo ./install.sh
```

## Usage
### Update LMS Client from given URL
```
sudo /etc/init.d/squeezelite update https://sourceforge.net/projects/lmsclients/files/squeezelite/linux/squeezelite-1.9.7.1237-armv6hf.tar.gz

```
