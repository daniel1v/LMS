# SL
## Logitech Media Server
### Download and Installation


```
cd ~
mkdir lms
cd lms
sudo wget https://raw.githubusercontent.com/daniel1v/SL/master/install_lms.sh

sudo nano install_lms.sh
sudo chmod a+x install_lms.sh
sudo ./install_lms.sh
```

## LMS Client
### About
Modified scripts for automated installation of LMS Client (Squeezebox Lite) on a freshly installed Raspberry Pi with HifiBerry Amp2 (should also work with other HifiBerry devices, at least DAC+).

The installation is based on [this](http://www.gerrelt.nl/RaspberryPi/wordpress/tutorial-installing-squeezelite-player-on-raspbian) tutorial

### Download and Installation
```
cd ~
mkdir squeezelite
cd squeezelite
sudo wget https://raw.githubusercontent.com/daniel1v/SL/master/hifiberry_setup.sh
sudo wget https://raw.githubusercontent.com/daniel1v/SL/master/install_lms_client.sh
sudo wget https://raw.githubusercontent.com/daniel1v/SL/master/squeezelite_settings.sh 
sudo wget https://raw.githubusercontent.com/daniel1v/SL/master/squeezelitehf.sh
sudo wget https://raw.githubusercontent.com/daniel1v/SL/master/squeezelite.service

sudo nano install_lms_client.sh
sudo chmod a+x install_lms_client.sh
sudo ./install_lms_client.sh
```

### Update from given URL
```
sudo /etc/init.d/squeezelite update https://sourceforge.net/projects/lmsclients/files/squeezelite/linux/squeezelite-1.9.7.1237-armv6hf.tar.gz

```
### Start Equalizer
```
sudo alsamixer -D equal
```