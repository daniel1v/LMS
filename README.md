# SL

Download: 
```
cd /home/pi/squeezelite
sudo wget https://raw.githubusercontent.com/daniel1v/SL/master/squeezelite_settings.sh
sudo mv squeezelite_settings.sh /usr/local/bin
sudo chmod a+x /usr/local/bin/squeezelite_settings.sh
 
sudo wget https://raw.githubusercontent.com/daniel1v/SL/master/squeezelitehf.sh
sudo mv squeezelitehf.sh /etc/init.d/squeezelite
sudo chmod a+x /etc/init.d/squeezelite
 
sudo wget https://raw.githubusercontent.com/daniel1v/SL/master/squeezelite.service
sudo mv squeezelite.service /etc/systemd/system
sudo systemctl enable squeezelite.service 
cd /home/pi
```
