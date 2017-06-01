FROM kibana:5.4.0

RUN apt-get update
RUN apt-get -y install git
RUN apt-get -y install npm


#RUN /usr/share/kibana/bin/kibana-plugin install https://github.com/elo7/cohort/releases/download/5.4.0/cohort-5.4.0.zip

#RUN /usr/share/kibana/bin/kibana-plugin install https://github.com/DeanF/health_metric_vis/releases/download/v0.3.5/health_metric_vis-5.4.0.zip

WORKDIR /usr/share/kibana/plugins
RUN git clone https://github.com/virusu/3D_kibana_charts_vis.git 3D_kibana_charts_vis
WORKDIR 3D_kibana_charts_vis
RUN sed -i -e 's/"version":[ \t]*".*"/"version": "5.4.0"/' package.json
RUN npm install

WORKDIR /usr/share/kibana/plugins
RUN git clone https://github.com/mstoyano/kbn_c3js_vis.git c3_charts
WORKDIR c3_charts
RUN sed -i -e 's/"version":[ \t]*".*"/"version": "5.4.0"/' package.json
RUN npm install

#WORKDIR /usr/share/kibana/plugins
#RUN git clone https://github.com/JuanCarniglia/area3d_vis
#WORKDIR area3d_vis
#RUN npm install

WORKDIR /usr/share/kibana/plugins
RUN git clone https://github.com/sbeyn/kibana-plugin-traffic-sg traffic-sg
WORKDIR traffic-sg
RUN grep version package.json
RUN sed -i -e 's/"version":[ \t]*".*"/"version": "5.4.0"/' package.json
RUN grep version package.json

WORKDIR /usr/share/kibana/plugins
RUN git clone https://github.com/sbeyn/kibana-plugin-gauge-sg guage_sg
WORKDIR guage_sg
RUN grep version package.json
RUN sed -i -e 's/"version":[ \t]*".*"/"version": "5.4.0"/' package.json
RUN grep version package.json

WORKDIR /usr/share/kibana/plugins
RUN git clone https://github.com/dlumbrer/kbn_network.git network_vis
WORKDIR network_vis
RUN grep version package.json
RUN sed -i -e 's/"version":[ \t]*".*"/"version": "5.4.0"/' package.json
RUN grep version package.json
RUN npm install

#RUN git clone https://github.com/elastic/eslint-config-kibana.git /tmp/eslint
#WORKDIR /tmp/eslint
#RUN npm install

#WORKDIR /usr/share/kibana/plugins
#RUN git clone https://github.com/prelert/kibana-swimlane-vis swimlane-vis
#WORKDIR swimlane-vis
#RUN grep version package.json
#RUN sed -i -e 's/"version":[ \t]*".*"/"version": "5.4.0"/' package.json
#RUN grep version package.json
#RUN npm install

#WORKDIR /usr/share/kibana/plugins
#RUN git clone https://github.com/nreese/enhanced_tilemap
#WORKDIR enhanced_tilemap
#RUN npm install

WORKDIR /

