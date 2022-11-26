
#!/bin/bash
cd /root
apt update && sudo apt upgrade -y
echo "done"
apt-get install ffmpeg -y
apt  install awscli -y

apt install python3-pip -y
pip3 install boto3

wget https://github.com/shaka-project/shaka-packager/releases/download/v2.6.1/packager-linux-x64  -O ../bin/packager
chmod +x ../bin/packager

echo "for faster/visual confirmation of above execution.."
wget https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4 -O I_RAN.mp4


cd /home/ubuntu/project/src
python3 main.py

#
sudo wget https://github.com/shaka-project/shaka-packager/releases/download/v2.6.1/packager-linux-x64  -O bin/packager
chmod +x bin/packager