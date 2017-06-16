
FROM docker.elastic.co/kibana/kibana:5.4.1

USER root

RUN yum install -y git
RUN yum install -y unzip

COPY cohort.zip /tmp

WORKDIR /usr/share/kibana/plugins

RUN unzip /tmp/cohort.zip
RUN mv kibana/cohort .
RUN rmdir kibana

COPY 3d-charts.tgz /tmp
WORKDIR /usr/share/kibana/plugins
RUN mkdir 3d-charts
WORKDIR 3d-charts
RUN tar xvfz /tmp/3d-charts.tgz

COPY c3-charts.tgz /tmp
WORKDIR /usr/share/kibana/plugins
RUN mkdir c3-charts
WORKDIR c3-charts
RUN tar xvfz /tmp/c3-charts.tgz

COPY area3d.tgz /tmp
WORKDIR /usr/share/kibana/plugins
RUN mkdir area3d
WORKDIR area3d
RUN tar xvfz /tmp/area3d.tgz

COPY traffic-sg.tgz /tmp
WORKDIR /usr/share/kibana/plugins
RUN mkdir traffic-sg
WORKDIR traffic-sg
RUN tar xvfz /tmp/traffic-sg.tgz

COPY gauge-sg.tgz /tmp
WORKDIR /usr/share/kibana/plugins
RUN mkdir gauge-sg
WORKDIR gauge-sg
RUN tar xvfz /tmp/gauge-sg.tgz

COPY network.tgz /tmp
WORKDIR /usr/share/kibana/plugins
RUN mkdir network
WORKDIR network
RUN tar xvfz /tmp/network.tgz

COPY eslint.tgz /tmp
WORKDIR /usr/share/kibana/plugins
RUN mkdir eslint
WORKDIR eslint
RUN tar xvfz /tmp/eslint.tgz

COPY swimlane.tgz /tmp
WORKDIR /usr/share/kibana/plugins
RUN mkdir swimlane
WORKDIR swimlane
RUN tar xvfz /tmp/swimlane.tgz

COPY enhanced-tilemap.tgz /tmp
WORKDIR /usr/share/kibana/plugins
RUN mkdir enhanced-tilemap
WORKDIR enhanced-tilemap
RUN tar xvfz /tmp/enhanced-tilemap.tgz

USER kibana

WORKDIR /

