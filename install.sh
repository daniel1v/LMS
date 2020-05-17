# Config
hostname=wohnzimmer
ssid="mywifissid"
psk="#mywifipassword"
lmsclientpath="https://sourceforge.net/projects/lmsclients/files/squeezelite/linux/squeezelite-1.9.7.1237-armv6hf.tar.gz"
# for newest version see: https://sourceforge.net/projects/lmsclients/files/squeezelite/linux


# Install
sudo sed -i 's/raspberrypi/$hostname/g' /etc/hostname
sudo sed -i 's/raspberrypi/$hostname/g' /etc/hosts

sudo sed -i -e '$a network={\n   ssid='$ssid'\n   psk='$psk'\n}' /etc/wpa_supplicant/wpa_supplicant.conf

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install -y libasound2-plugin-equal

sudo sed -i 's/dtparam=audio=on/#dtparam=audio=on/g' /boot/config.txt
sudo sed -i -e '$a dtoverlay=hifiberry-dacplus' /boot/config.txt
sudo rm /etc/asound.conf
echo 'ctl.equal {
type equal;
controls "/home/pi/.alsaequal.bin"
}
 
pcm.plugequal {
type equal;
slave.pcm "plughw:0,0";
controls "/home/pi/.alsaequal.bin"
}
 
pcm.equal {
type plug;
slave.pcm plugequal;
}
' | sudo tee /etc/asound.conf


wget -O squeezelite-armv6hf.tar.gz $lmsclientpath
tar -xvzf squeezelite-armv6hf.tar.gz
mv squeezelite squeezelite-armv6hf
sudo mv squeezelite-armv6hf /usr/bin
sudo chmod a+x /usr/bin/squeezelite-armv6hf

sudo wget https://raw.githubusercontent.com/daniel1v/SL/master/squeezelite_settings.sh
sudo mv squeezelite_settings.sh /usr/local/bin
sudo chmod a+x /usr/local/bin/squeezelite_settings.sh
 
sudo wget https://raw.githubusercontent.com/daniel1v/SL/master/squeezelitehf.sh
sudo mv squeezelitehf.sh /etc/init.d/squeezelite
sudo chmod a+x /etc/init.d/squeezelite
 
sudo wget https://raw.githubusercontent.com/daniel1v/SL/master/squeezelite.service
sudo mv squeezelite.service /etc/systemd/system
sudo systemctl enable squeezelite.service 
cd ~

sudo sed -i 's/SL_SOUNDCARD="sysdefault:CARD=ALSA"/SL_SOUNDCARD="equal"/g' /usr/local/bin/squeezelite_settings.sh
sudo sed -i 's/#SL_NAME="Framboos"/SL_NAME="'$hostname'"/g' /usr/local/bin/squeezelite_settings.sh


