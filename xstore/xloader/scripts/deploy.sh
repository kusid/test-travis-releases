#!/bin/bash

release_version=${1}

mvn deploy:deploy-file -DgroupId=com.kusid -DartifactId=xstore -Dversion=${release_version} -DgeneratePom=true \
-Dpackaging=jar -DrepositoryId=nexus -Durl=http://localhost:8081/repository/maven-releases -Dfile=target/project-1.0.0.jar