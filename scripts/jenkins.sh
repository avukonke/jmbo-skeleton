#!/bin/sh

SITE_TYPE=basic

#rm -rf ve bin	
virtualenv --no-site-packages ve
ve/bin/python bootstrap.py

bin/buildout -c dev_${SITE_TYPE}_site.cfg

bin/skeleton-dev-$SITE_TYPE-site syncdb
bin/skeleton-dev-$SITE_TYPE-site migrate
bin/skeleton-dev-$SITE_TYPE-site load_photosizes
bin/skeleton-dev-$SITE_TYPE-site loaddata skeleton/fixtures/sites.json
#rm -rf static
bin/skeleton-dev-$SITE_TYPE-site collectstatic --noinput

cd src/jmbo-foundry
../bin/setuptest-runner setup.py test
cd -
