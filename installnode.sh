echo "Enter directory name"
curl https://raw.githubusercontent.com/praveensoma/INSTest/master/HelixPackage.zip -o HelixPackage.zip
wait
if [ ! -d "/data/data/com.termux/files/home/storage" ]
then
    echo "storage directory doesn't exist. Creating now"
    mkdir storage
    echo "storage directory created"
else
    echo "File exists"
fi
if [ ! -d "/data/data/com.termux/files/home/storage" ]
then
    echo "storage directory doesn't exist still"
else
    echo "storage directory exist now"
fi
echo "---------------------------------------"
echo "change directory to node_modules"
cd /data/data/com.termux/files/usr/lib/node_modules 
echo "---------------------------------------"
echo "pwd is"
pwd
echo "---------------------------------------"
echo "install l8 next begin"
npm install -g react-i18next
echo "install finished il8 next"
echo "Node-RED begin install"
npm i -g --unsafe-perm node-red 
wait
echo "Node-RED finish install"
echo "------------------moving back to home--------------"
cd /data/data/com.termux/files/home
pwd
echo "------------------moved back to home--------------"
cp HelixPackage.zip /data/data/com.termux/files/home/storage/HelixPackage.zip
echo "---------------------------------------"
echo "install request"
npm i -g  request --save 
wait
echo "---------------------------------------"
echo "install words-to-numbers"
npm i -g words-to-numbers --save
wait
echo "---------------------------------------"
echo "Helix Package Unzipped Begin"
chmod 0777 /data/data/com.termux/files/home/storage/HelixPackage.zip
wait
unzip /data/data/com.termux/files/home/storage/HelixPackage.zip -d /data/data/com.termux/files/home/storage/
wait
echo "---------------------------------------"
echo "Helix Package Unzipped End"
sleep 5
echo "---------------------------------------"
echo "Helix Node-RED Package Unzipped Begin"
chmod 0777 /data/data/com.termux/files/home/storage/HelixPackage/Helix-Voice-Node-RED.zip
wait
unzip /data/data/com.termux/files/home/storage/HelixPackage/Helix-Voice-Node-RED.zip -d /data/data/com.termux/files/home/storage/HelixPackage/
wait
echo "---------------------------------------"
sleep 5
echo "Helix Node-RED Package Unzipped End"
cp /data/data/com.termux/files/home/storage/HelixPackage/settings.js /data/data/com.termux/files/usr/lib/node_modules/node-red/settings.js
wait
cp /data/data/com.termux/files/home/storage/HelixPackage/flows.json /data/data/com.termux/files/usr/lib/node_modules/node-red/flows.json
wait
cp /data/data/com.termux/files/home/storage/HelixPackage/runnode.sh /data/data/com.termux/files/home/runnode.sh 
wait
dos2unix /data/data/com.termux/files/home/runnode.sh
echo "---------------------------------------"
echo "Helix npm Package install begin"
npm i -g /data/data/com.termux/files/home/storage/HelixPackage/Helix-Voice-Node-RED
wait
echo "Helix npm Package installed"
echo "---------------------------------------"
echo "install termux-api"
apt install termux-api
echo "---------------------------------------"
echo "starting node-red "
/data/data/com.termux/files/usr/bin/node /data/data/com.termux/files/usr/lib/node_modules/node-red/red.js -s /data/data/com.termux/files/usr/lib/node_modules/node-red/settings.js 
sleep 2
PID2=`ps -eaf | grep node-red | grep -v grep | awk '{print $2}'`
if [ "" !=  "$PID2" ]; then
  echo "Node-RED started with $PID"
fi