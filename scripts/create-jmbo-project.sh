#! /bin/bash

# Will move to Genshi templates in future

# Defaults
SITE=site
PORT=9000
CREATE_DIR=/tmp

# Prompt for params
echo -n "Egg name, eg. jmbo-myapp. [enter]: "
read EGG
echo -n "Django app name, eg. myapp. [enter]: "
read APP
echo -n "Site name, eg. ghana. This is useful if you have different sites forming a logical whole, eg. a site per country. (default=site) [enter]: "
read asite
if [ -n "$asite" ];
then
    SITE=$asite
fi    
echo -n "Port. The port Django listens on. (default=9000) [enter]: "
read aport
if [ -n "$aport" ];
then
    PORT=$aport
fi    
echo -n "Source code directory. (default=/tmp) [enter]: "
read adir
if [ -n "$adir" ];
then
    CREATE_DIR=$adir
fi    

# Create the project
PROJECT_DIR=${CREATE_DIR}/${APP}
APP_DIR=${PROJECT_DIR}/${APP}
mkdir $PROJECT_DIR
cp bootstrap.py ${PROJECT_DIR}/
cp buildout.cfg ${PROJECT_DIR}/
cp -r buildout_templates ${PROJECT_DIR}/
cp dev_base.cfg ${PROJECT_DIR}/
cp dev_basic_site.cfg ${PROJECT_DIR}/dev_basic_${SITE}.cfg
cp dev_web_site.cfg ${PROJECT_DIR}/dev_web_${SITE}.cfg
cp -r jmbodemo ${PROJECT_DIR}/${APP}
cp live_base.cfg ${PROJECT_DIR}/
cp live_basic_site.cfg ${PROJECT_DIR}/live_basic_${SITE}.cfg
cp live_web_site.cfg ${PROJECT_DIR}/live_basic_${SITE}.cfg
cp qa_base.cfg ${PROJECT_DIR}/
cp qa_basic_site.cfg ${PROJECT_DIR}/qa_basic_${SITE}.cfg
cp qa_web_site.cfg ${PROJECT_DIR}/qa_basic_${SITE}.cfg
cp setup.py ${PROJECT_DIR}/
cp versions.cfg ${PROJECT_DIR}/
mv ${APP_DIR}/settings_dev_basic_site.py ${APP_DIR}/settings_dev_basic_${SITE}.py
mv ${APP_DIR}/settings_dev_web_site.py ${APP_DIR}/settings_dev_web_${SITE}.py
mv ${APP_DIR}/settings_live_basic_site.py ${APP_DIR}/settings_live_basic_${SITE}.py
mv ${APP_DIR}/settings_live_web_site.py ${APP_DIR}/settings_live_web_${SITE}.py
mv ${APP_DIR}/settings_qa_basic_site.py ${APP_DIR}/settings_qa_basic_${SITE}.py
mv ${APP_DIR}/settings_qa_web_site.py ${APP_DIR}/settings_qa_web_${SITE}.py

# Change strings in the newly copied source