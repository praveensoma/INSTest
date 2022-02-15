echo " run node sh search for node-red"
PID=`ps -eaf | grep node-red | grep -v grep | awk '{print $2}'`
if [ "" !=  "$PID" ]; then
  echo "killing $PID"
  echo "killing node-red"
  kill -9 $PID
fi
echo "---------------------------------------"
echo "Moving to Node-RED directory"
echo "starting node-red "
/data/data/com.termux/files/usr/bin/node /data/data/com.termux/files/usr/lib/node_modules/node-red/red.js -s /data/data/com.termux/files/usr/lib/node_modules/node-red/settings.js
sleep 5
PID2=`ps -eaf | grep node-red | grep -v grep | awk '{print $2}'`
if [ "" !=  "$PID2" ]; then
  echo "Node-RED started with $PID"
fi