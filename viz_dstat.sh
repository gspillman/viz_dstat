#!/bin/ksh
# Launch webserver and visualize dstat measurement in a browser
# Create dstat file using this format
#  $ dstat --time -v --net --output [DSTAT_CSV] [DELAY_SEC]
#  Example:
#  $ dstat --time -v --net --output example.csv 1 10
#  $ ./viz_dstat.sh example.csv
# If called with no arguments, will launch dstat measurement
#  $ ./viz_dstat.sh


HTML_DIR=dstat-report-$(date +"%Y%m%d-%H%M%S")
mkdir -p $HTML_DIR
cp -r js $HTML_DIR/.
cp style.css $HTML_DIR/.
echo Working directory is $HTML_DIR

CSV_FN=$1
set -A A_FILES $( echo "$CSV_FN" | sed 's/,/ /g' )
i=0
while [ -n "${A_FILES[i]}" ]
  do
     echo "Visualizing file ${A_FILES[i]}"
     cp ${A_FILES[i]} $HTML_DIR/.
     #cat index.html | sed "s/dstat.csv/${A_FILES[i]}/g" > $HTML_DIR/index.html
     cat index.html | sed "s/dstat.csv/${A_FILES[i]}/g" > $HTML_DIR/index.html
     cat $HTML_DIR/index.html | sed "s/dstat-graph/${A_FILES[i]}-report/g" > $HTML_DIR/index$i.html
     (( i = i + 1 ))
  done
echo "Files copied"

cp tabbed_index.html $HTML_DIR/
cd $HTML_DIR
rm index.html
mv tabbed_index.html index.html

kill_server() {
	echo
 [ $DSTAT_PID ] && echo "Stopping dstat measurement" && kill $DSTAT_PID > /dev/null
  echo "Stopping web server"
	kill $SRV_PID 2> /dev/null
}
trap 'kill_server' SIGTERM SIGINT # Kill measurement when webserver is killed

echo Starting web server--point your browser to http://localhost:12121
python -m SimpleHTTPServer 12121 2> http_log&
SRV_PID=$!
sleep 0.5
echo "Press a key to stop web server"
read text
kill_server
