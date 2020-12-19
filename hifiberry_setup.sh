sudo apt update -y
sudo apt dist-upgrade -y

sudo apt install -y libasound2-plugin-equal

sudo sed -i 's/dtparam=audio=on/#dtparam=audio=on/g' /boot/config.txt
sudo sed -i -e '$a dtoverlay=hifiberry-dacplus' /boot/config.txt
sudo mv /etc/asound_old.conf
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
