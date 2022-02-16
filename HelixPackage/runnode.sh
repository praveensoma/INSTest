echo " run node sh search for node-red"
PID=`ps -eaf | grep node-red | grep -v grep | awk '{print $2}'`
if [ "" !=  "$PID" ];
then
  echo "Node-RED already running with $PID"  
else
/data/data/com.termux/files/usr/bin/node /data/data/com.termux/files/usr/lib/node_modules/node-red/red.js -s /data/data/com.termux/files/usr/lib/node_modules/node-red/settings.js &
sleep 2
echo "Node-RED not running and restarting"


PID2=`ps -eaf | grep node-red | grep -v grep | awk '{print $2}'`
if [ "" !=  "$PID2" ]; then
  echo "Node-RED started with $PID"
fi
fi
