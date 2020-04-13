FROM python:3

RUN apt-get -qqy update && apt-get dist-upgrade -qqy && apt-get -y install ksh

EXPOSE 12121

ADD *.csv /
ADD index.html /
ADD tabbed_index.html /
ADD viz_dsta_docker.sh /
ADD style.css /
ADD js/charts.js /js/charts.js
ADD js/dygraph-combined.js /js/dygraph-combined.js
ADD js/jquery.csv-0.71.js /js/jquery.csv-0.71.js
ADD js/jquery.min.js /js/jquery.min.js
ENTRYPOINT [ "./viz_dstat_docker.sh" ]

