#install jre 1.7.0_80
O_URL="http://download.oracle.com/otn-pub/java"
O_REPO=b15
JAVA_V=7u80
JAVA_HOME=/usr/java
PATH=$JAVA_HOME/bin:$PATH
mkdir $JAVA_HOME
cd $JAVA_HOME
set -ex \
    && curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" $O_URL/jdk/$JAVA_V-$O_REPO/jre-$JAVA_V-linux-x64.tar.gz > jre-$JAVA_V-linux-x86.tar.gz \
    && tar zxvf  jre-$JAVA_V-linux-x86.tar.gz -C $JAVA_HOME --strip-components=1 \
    && rm -f jre-$JAVA_V-linux-x86.tar.gz



#install tomcat
CATALINA_HOME=/usr/local/tomcat
PATH=$CATALINA_HOME/bin:$PATH
mkdir -p "$CATALINA_HOME"
cd $CATALINA_HOME
TOMCAT_MAJOR=7
TOMCAT_VERSION=7.0.68
TOMCAT_TGZ_URL="https://www.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz"
set -x \
    && curl -fSL "$TOMCAT_TGZ_URL" -o tomcat.tar.gz \
    && tar -xvf tomcat.tar.gz --strip-components=1 \
    && rm bin/*.bat \
    && rm tomcat.tar.gz* \
    && rm -rf webapps/* \
    && mkdir webapps/ROOT


#modify configuration file
Git_URL=https://raw.githubusercontent.com/changelit/scripts/master/tomcat/v7.0.68
wget $Git_URL/server.xml -O $CATALINA_HOME/conf/server.xml
wget $Git_URL/catalina.sh -O $CATALINA_HOME/bin/catalina.sh
