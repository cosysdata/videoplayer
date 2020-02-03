#!/bin/sh
## play the M4TV Stream to the HDMI output
## please run before starting
## sudo apt-get install ansible git omxplayer -y
## To enable add the following to /etc/rc.local
## sleep 10
## echo localhost > /etc/ansible/hosts
## su - pi -c "git clone https://github.com/cosysdata/videoplayer.git bin > /dev/null 2>&1 || echo Already Exists"
## su - pi -c "cd /home/pi/bin ; git pull || echo Error checkout"
## su - pi -c "/bin/sh /home/pi/bin/distribute.sh &"
## su - pi -c "cd /home/pi/bin ; ansible-playbook playbook.yml"
##

sudo apt-get install ansible git omxplayer -y
SERVICE='omxplayer'
while true; do
if ps ax | grep -v grep | grep $SERVICE > /dev/null
  then
    echo "running"  >> /dev/null
  else
    omxplayer --no-keys --no-osd -b --loop --timeout 20 -o hdmi http://streaming.m4tv.at:1935/live/stream/playlist.m3u8 &
  fi
done
