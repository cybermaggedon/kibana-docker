
VERSION=5.4.3a

PLUGINS=cohort.zip 3d-charts.tgz c3-charts.tgz area3d.tgz traffic-sg.tgz \
	gauge-sg.tgz network.tgz eslint.tgz swimlane.tgz enhanced-tilemap.tgz

all: ${PLUGINS} container

cohort.zip:
	rm -rf cohort
	git clone https://github.com/elo7/cohort
	sed -i -e 's/"version":[ \t]*".*"/"version": "5.4.3"/' cohort/package.json
	cd cohort && npm install
	cd cohort && npm run-script build
	cp cohort/build/cohort-5.4.3.zip cohort.zip

3d-charts.tgz:
	rm -rf 3d-charts
	git clone https://github.com/virusu/3D_kibana_charts_vis 3d-charts
	sed -i -e 's/"version":[ \t]*".*"/"version": "5.4.3"/' 3d-charts/package.json
	cd 3d-charts && npm install
	cd 3d-charts && tar cfz ../$@ .

c3-charts.tgz:
	rm -rf c3-charts
	git clone https://github.com/mstoyano/kbn_c3js_vis.git c3-charts
	sed -i -e 's/"version":[ \t]*".*"/"version": "5.4.3"/' c3-charts/package.json
	cd c3-charts && npm install
	cd c3-charts && tar cfz ../$@ .

area3d.tgz:
	rm -rf area3d
	git clone https://github.com/JuanCarniglia/area3d_vis area3d
	sed -i -e 's/"version":[ \t]*".*"/"version": "5.4.3"/' area3d/package.json
	cd area3d && npm install
	cd area3d && tar cfz ../$@ .

traffic-sg.tgz:
	rm -rf traffic-sg
	git clone https://github.com/sbeyn/kibana-plugin-traffic-sg traffic-sg
	sed -i -e 's/"version":[ \t]*".*"/"version": "5.4.3"/' traffic-sg/package.json
	cd traffic-sg && npm install
	cd traffic-sg && tar cfz ../$@ .

gauge-sg.tgz:
	rm -rf gauge-sg
	git clone https://github.com/sbeyn/kibana-plugin-gauge-sg gauge-sg
	sed -i -e 's/"version":[ \t]*".*"/"version": "5.4.3"/' gauge-sg/package.json
	cd gauge-sg && npm install
	cd gauge-sg && tar cfz ../$@ .

network.tgz:
	rm -rf network
	git clone https://github.com/dlumbrer/kbn_network network
	sed -i -e 's/"version":[ \t]*".*"/"version": "5.4.3"/' network/package.json
	cd network && npm install
	cd network && tar cfz ../$@ .

eslint.tgz:
	rm -rf eslint
	git clone https://github.com/elastic/eslint-config-kibana.git eslint
	sed -i -e 's/"version":[ \t]*".*"/"version": "5.4.3"/' eslint/package.json
	cd eslint && npm install
	cd eslint && npm pack
	cd eslint && tar cfz ../$@ .

swimlane.tgz:
	rm -rf swimlane
	git clone https://github.com/prelert/kibana-swimlane-vis swimlane
	sed -i -e 's/"version":[ \t]*".*"/"version": "5.4.3"/' swimlane/package.json
	cd swimlane && npm install
	cd swimlane && tar cfz ../$@ .

enhanced-tilemap.tgz:
	rm -rf enhanced-tilemap
	git clone https://github.com/nreese/enhanced_tilemap enhanced-tilemap
	sed -i -e 's/"version":[ \t]*".*"/"version": "5.4.3"/' enhanced-tilemap/package.json
	cd enhanced-tilemap && npm install
	cd enhanced-tilemap && tar cfz ../$@ .

container:
	docker build -t cybermaggedon/kibana:${VERSION} .

push: container
	docker push cybermaggedon/kibana:${VERSION}

