echo "Enter directory name"
curl https://github.com/praveensoma/INSTest/blob/main/HelixPackage.zip -L -o HelixPackage.zip
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
cp HelixPackage.zip /data/data/com.termux/files/home/storage/HelixPackage.zip
echo "---------------------------------------"
echo "apt update begin"
apt update
echo "---------------------------------------"
wait
echo "---------------------------------------"
echo "apt upgrade begin"
apt upgrade -y
echo "---------------------------------------"
wait
echo "---------------------------------------"
echo "apt install nodejs"
apt install coreutils nano nodejs
wait
echo "---------------------------------------"
echo "apt install node-red"
npm i -g --unsafe-perm node-red
wait
echo "---------------------------------------"
echo "start node-red"
node-red &
sleep 30
echo "---------------------------------------"
echo "search for node-red"
PID=`ps -eaf | grep node-red | grep -v grep | awk '{print $2}'`
if [ "" !=  "$PID" ]; then
  echo "killing $PID"
  echo "killing node-red"
  kill -9 $PID
fi
echo "---------------------------------------"
echo "Moving to Node-RED directory"
cd /data/data/com.termux/files/home/.node-red
echo "pwd is"
pwd
echo "---------------------------------------"
echo "install request"
npm install  request --save 
wait
echo "---------------------------------------"
echo "install words-to-numbers"
npm install words-to-numbers --save
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
cp /data/data/com.termux/files/home/storage/HelixPackage/settings.js /data/data/com.termux/files/home/.node-red/settings.js
wait
dos2unix /data/data/com.termux/files/home/.node-red/settings.js
wait
cp /data/data/com.termux/files/home/storage/HelixPackage/flows.json /data/data/com.termux/files/home/.node-red/flows.json
wait
echo "---------------------------------------"
echo "Helix npm Package install begin"
npm install /data/data/com.termux/files/home/storage/HelixPackage/Helix-Voice-Node-RED
wait
echo "Helix npm Package installed"
echo "---------------------------------------"
echo "starting node-red "
node-red &
sleep 5
PID2=`ps -eaf | grep node-red | grep -v grep | awk '{print $2}'`
if [ "" !=  "$PID2" ]; then
  echo "Node-RED started with $PID"
fi