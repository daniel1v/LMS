# Config variables
hostname=wohnzimmer
ssid="#mywifissid"
psk="#mywifipassword"
lmsclientpath="https://sourceforge.net/projects/lmsclients/files/squeezelite/linux/squeezelite-1.9.7.1256-armv6hf.tar.gz"
# for newest version see: https://sourceforge.net/projects/lmsclients/files/squeezelite/linux
cronjob='0 4 * * * sudo /sbin/shutdown -r now'  # nightly reboot a 4am

# Install

# set cron job for reboot 
crontab -l | { cat; echo "$cronjob"; } | crontab -

# set hostname and wifi credentials
sudo sed -i 's/raspberrypi/$hostname/g' /etc/hostname
sudo sed -i 's/raspberrypi/$hostname/g' /etc/hosts
sudo sed -i -e '$a network={\n   ssid='$ssid'\n   psk='$psk'\n}' /etc/wpa_supplicant/wpa_supplicant.conf

# install hifiberry amp2 / dac+, uncomment the following lines, if not needed
sudo chmod a+x hifiberry_setup.sh
sudo ./hifiberry_setup.sh
sudo sed -i 's/SL_SOUNDCARD="sysdefault:CARD=ALSA"/SL_SOUNDCARD="equal"/g' squeezelite_settings.sh

# install lms client
wget -O squeezelite-armv6hf.tar.gz $lmsclientpath
tar -xvzf squeezelite-armv6hf.tar.gz
mv squeezelite squeezelite-armv6hf
sudo chmod a+x /usr/bin/squeezelite-armv6hf

# modify and display squeezelite_settings.sh
sudo sed -i 's/#SL_NAME="Framboos"/SL_NAME="'$hostname'"/g' squeezelite_settings.sh
sudo nano squeezelite_settings.sh

sudo mv squeezelite-armv6hf /usr/bin
sudo chmod a+x /usr/bin/squeezelite-armv6hf
sudo mv squeezelite_settings.sh /usr/local/bin
sudo chmod a+x /usr/local/bin/squeezelite_settings.sh
sudo mv squeezelitehf.sh /etc/init.d/squeezelite
sudo chmod a+x /etc/init.d/squeezelite 
sudo mv squeezelite.service /etc/systemd/system
sudo systemctl enable squeezelite.service

