# SL
```
cd /home/pi/squeezelite
sudo wget http://www.gerrelt.nl/RaspberryPi/squeezelite_settings.sh
sudo mv squeezelite_settings.sh /usr/local/bin
sudo chmod a+x /usr/local/bin/squeezelite_settings.sh
 
sudo wget http://www.gerrelt.nl/RaspberryPi/squeezelitehf.sh
sudo mv squeezelitehf.sh /etc/init.d/squeezelite
sudo chmod a+x /etc/init.d/squeezelite
 
sudo wget http://www.gerrelt.nl/RaspberryPi/squeezelite.service
sudo mv squeezelite.service /etc/systemd/system
sudo systemctl enable squeezelite.service 
cd /home/pi
```
