#!/bin/bash
cd /root

# while ! apt install -y ffmpeg; do sleep 5; done;

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
# wget https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4 -O ../home/ubuntu/I_RAN2.mp4
# curl -X POST "https://api.callmebot.com/whatsapp.php?phone=+8801630000&text=Ec2+transcoder+setup+complete&apikey=00000"

git clone https://github.com/ashraf-minhaj/test-notification
cd test-notification
python3 main.py