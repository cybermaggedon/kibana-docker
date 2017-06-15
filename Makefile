
VERSION=5.4.0c

all: cohort.zip 3d-charts.tgz c3-charts.tgz area3d.tgz traffic-sg.tgz \
	gauge-sg.tgz network.tgz eslint.tgz swimlane.tgz enhanced-tilemap.tgz \
	container

cohort.zip:
	rm -rf cohort
	git clone https://github.com/elo7/cohort
	sed -i -e 's/"version":[ \t]*".*"/"version": "5.4.1"/' cohort/package.json
	cd cohort && npm install
	cd cohort && npm run-script build
	cp cohort/build/cohort-5.4.1.zip cohort.zip

3d-charts.tgz:
	rm -rf 3d-charts
	git clone https://github.com/virusu/3D_kibana_charts_vis 3d-charts
	sed -i -e 's/"version":[ \t]*".*"/"version": "5.4.1"/' 3d-charts/package.json
	cd 3d-charts && npm install
	cd 3d-charts && tar cfz ../3d-charts.tgz .

c3-charts.tgz:
	rm -rf c3-charts
	git clone https://github.com/mstoyano/kbn_c3js_vis.git c3-charts
	sed -i -e 's/"version":[ \t]*".*"/"version": "5.4.1"/' c3-charts/package.json
	cd c3-charts && npm install
	cd c3-charts && npm pack
	cp c3-charts/*.tgz c3-charts.tgz

area3d.tgz:
	rm -rf area3d
	git clone https://github.com/JuanCarniglia/area3d_vis area3d
	sed -i -e 's/"version":[ \t]*".*"/"version": "5.4.1"/' area3d/package.json
	cd area3d && npm install
	cd area3d && npm pack
	cp area3d/*.tgz area3d.tgz

traffic-sg.tgz:
	rm -rf area3d
	git clone https://github.com/sbeyn/kibana-plugin-traffic-sg traffic-sg
	sed -i -e 's/"version":[ \t]*".*"/"version": "5.4.1"/' traffic-sg/package.json
	cd traffic-sg && npm install
	cd traffic-sg && npm pack
	cp traffic-sg/*.tgz traffic-sg.tgz

gauge-sg.tgz:
	rm -rf area3d
	git clone https://github.com/sbeyn/kibana-plugin-gauge-sg gauge-sg
	sed -i -e 's/"version":[ \t]*".*"/"version": "5.4.1"/' gauge-sg/package.json
	cd gauge-sg && npm install
	cd gauge-sg && npm pack
	cp gauge-sg/*.tgz gauge-sg.tgz

network.tgz:
	rm -rf network
	git clone https://github.com/dlumbrer/kbn_network network
	sed -i -e 's/"version":[ \t]*".*"/"version": "5.4.1"/' network/package.json
	cd network && npm install
	cd network && npm pack
	cp network/*.tgz $@

eslint.tgz:
	rm -rf eslint
	git clone https://github.com/elastic/eslint-config-kibana.git eslint
	sed -i -e 's/"version":[ \t]*".*"/"version": "5.4.1"/' eslint/package.json
	cd eslint && npm install
	cd eslint && npm pack
	cp eslint/*.tgz $@

swimlane.tgz:
	rm -rf swimlane
	git clone https://github.com/prelert/kibana-swimlane-vis swimlane
	sed -i -e 's/"version":[ \t]*".*"/"version": "5.4.1"/' swimlane/package.json
	cd swimlane && npm install
	cd swimlane && npm pack
	cp swimlane/*.tgz $@

enhanced-tilemap.tgz:
	rm -rf enhanced-tilemap
	git clone https://github.com/nreese/enhanced_tilemap enhanced-tilemap
	sed -i -e 's/"version":[ \t]*".*"/"version": "5.4.1"/' enhanced-tilemap/package.json
	cd enhanced-tilemap && npm install
	cd enhanced-tilemap && npm pack
	cp enhanced-tilemap/*.tgz $@


container:
	docker build -t cybermaggedon/kibana:${VERSION} .

push: container
	docker push cybermaggedon/kibana:${VERSION}

