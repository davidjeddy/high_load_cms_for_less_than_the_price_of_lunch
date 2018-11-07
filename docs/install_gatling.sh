#!/bin/bash
# @source https://dzone.com/articles/how-to-install-gatling-on-ubuntu
apt-get update -y
apt-get install -y unzip
add-apt-repository -y ppa:webupd8team/java
apt-get install -y oracle-java8-installer
update-alternatives --config java

echo 'JAVA_HOME="/usr/lib/jvm/java-8-oracle"''' >> /etc/environment

wget https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/3.0.0/gatling-charts-highcharts-bundle-3.0.0-bundle.zip
unzip gatling-charts-highcharts-bundle-3.0.0-bundle.zip
echo 'GATLING_HOME="/root/gatling-charts-highcharts-bundle-3.0.0/bin"' >> /etc/environment

tail /etc/environment

export PATH=$PATH:/root/gatling-charts-highcharts-bundle-3.0.0/bin

git clone https://github.com/davidjeddy/high_load_cms_for_less_than_the_price_of_lunch
cd high_load_cms_for_less_than_the_price_of_lunch
git checkout load_runs_compiled_together
