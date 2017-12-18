#!/data/data/com.termux/files/usr/bin/bash

proxy="157.240.7.32"
port="80"
host="server4.operamini.com"
respons=200

echo "=============================================="
echo "          TOOLS SCANNING IP WORKING"
echo "          NEW PHREAKER ABABIL"
echo "==============================================\n"
echo "     Reconnecting Data ...\n"
echo "     Please Wait ...\n"
svc data enable
sleep 2.7

while (ipc="`ip route`"; [ -z "$ipc" ]); do 
sleep 0.3
done

echo "=============================================="
echo "                   My IP Address"
ip route
echo "==============================================\n"
proxy=($proxy)
sleep 0.2;

scanProxy()
{
echo "Sending HEAD"
RES=` curl -IL $host --proxy $proxy:$port --max-time 1 | grep "HTTP/1.1"`

if [ ! -z "$RES" ]; then
  RES=($RES)
  RES1=${RES[1]}
  RES=${RES[@]}
else
  RES="No Respons"
  RES1=1
fi
sleep 0.3
echo $RES
}

for proxy in ${proxy[@]}; do
scanProxy

if [ $RES1 -eq $respons ]; then
  echo "     Connected "
  ekor=${proxy##*.}
  echo "Proxy npa.group:80"
  exit 0
fi

done

echo "\nFailed !\n"
echo "Reconnecting ...\n\n"
svc data disable
sleep 1.2
$0