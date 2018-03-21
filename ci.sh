#!/bin/bash

# Get config template
curl -s -X GET http://localhost:8080/job/FEMA_1.0/config.xml -u admin:admin -o config.xml


# Create Job
#CRUMB=$(wget -q --auth-no-challenge --user admin --password admin --output-document - \
#	'http://localhost:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
#echo ${CRUMB}
#curl -X POST 'http://localhost:8080/createItem?name=PlayBoy' -u admin:admin --data-binary @config.xml -H "${CRUMB}" -H "Content-Type:text/xml"

# Build Job
CRUMB=$(wget -q --auth-no-challenge --user admin --password admin --output-document - \
	'http://localhost:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
echo ${CRUMB}
curl -X POST 'http://localhost:8080/job/PlayBoy/build' -u admin:admin -H "${CRUMB}"
