# Configuration
url="http://www.mysqueezebox.com/update/?version=8.0.0&revision=1&geturl=1&os=deb"
#url="http://www.mysqueezebox.com/update/?version=7.9.3&revision=1&geturl=1&os=deb"

sudo apt update -y
sudo apt full-upgrade -y
sudo apt install -y libsox-fmt-all libflac-dev libfaad2 libmad0
sudo apt install -y perl-openssl-abi-1.1 libnet-ssleay-perl libio-socket-ssl-perl
latest_lms=$(wget -q -O - "$url")
sudo wget $latest_lms
lms_deb=${latest_lms##*/}
sudo dpkg -i $lms_deb
sudo apt-get -f install

# port forwarding (port 80 --> port 9000) for lms web interface
sudo apt install iptables-persistent -y &&
sudo iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 9000 &&
sudo iptables -A PREROUTING -t nat -i wlan0 -p tcp --dport 80 -j REDIRECT --to-port 9000 &&
sudo bash -c "iptables-save > /etc/iptables/rules.v4" &&
sudo bash -c "iptables-save > /etc/iptables/rules.v6" &&
sudo ufw allow 9000/tcp

