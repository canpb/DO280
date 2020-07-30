
# Copyright 2019 Red Hat
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# ------------------------------------------------------------------------
#
# This is a Dockerfile for the jboss-eap-6/eap64-openshift:1.9 image.

FROM rhel7:7-released

USER root

# Add scripts used to configure the image
COPY modules /tmp/scripts/

# Add all artifacts to the /tmp/artifacts directory
COPY \
    jboss-eap-6.4.23-patch.zip \
    jboss-eap-6.4.19-patch.zip \
    jboss-eap-6.4.9-patch.zip \
    artifacts/jboss-eap-6.4.0.zip \
    artifacts/jolokia-jvm-1.6.2.redhat-00002-agent.jar \
    artifacts/tomcat-7-valves-1.0.3.Final-redhat-1.jar \
    artifacts/txn-recovery-marker-jdbc-common-1.1.2.Final-redhat-00001.jar \
    artifacts/txn-recovery-marker-jdbc-hibernate4-1.1.2.Final-redhat-00001.jar \
    artifacts/openshift-ping-common-1.2.5.Final-redhat-1.jar \
    artifacts/openshift-ping-dns-1.2.5.Final-redhat-1.jar \
    artifacts/openshift-ping-kube-1.2.5.Final-redhat-1.jar \
    artifacts/oauth-20100527.jar \
    artifacts/javax.json-1.0.4.jar \
    artifacts/jboss-logmanager-ext-1.0.0.Alpha5-redhat-1.jar \
    activemq-rar-5.11.0.redhat-630371.rar \
    artifacts/rh-sso-7.2.2-eap6-adapter.zip \
    artifacts/rh-sso-7.2.2-saml-eap6-adapter.zip \
    artifacts/hawkular-javaagent-1.0.1.Final-redhat-2-shaded.jar \
    artifacts/jmx_prometheus_javaagent-0.3.1.redhat-00006.jar \
    /tmp/artifacts/

# begin jboss.container.user:1.0

# Install required RPMs and ensure that the packages were installed
USER root
RUN yum --setopt=tsflags=nodocs install -y yum-utils unzip tar rsync \
    && rpm -q yum-utils unzip tar rsync

# Environment variables
ENV \
    HOME="/home/jboss" 

# Custom scripts
USER root
RUN [ "bash", "-x", "/tmp/scripts/jboss.container.user/configure.sh" ]

# end jboss.container.user:1.0
# begin jboss.container.openjdk.jdk:8

# Install required RPMs and ensure that the packages were installed
USER root
RUN yum --setopt=tsflags=nodocs install -y java-1.8.0-openjdk-devel \
    && rpm -q java-1.8.0-openjdk-devel

# Environment variables
ENV \
    JAVA_HOME="/usr/lib/jvm/java-1.8.0" \
    JAVA_VENDOR="openjdk" \
    JAVA_VERSION="1.8.0" \
    JBOSS_CONTAINER_OPENJDK_JDK_MODULE="/opt/jboss/container/openjdk/jdk" 

# Labels
LABEL \
      org.jboss.product="openjdk"  \
      org.jboss.product.openjdk.version="1.8.0"  \
      org.jboss.product.version="1.8.0" 

# Custom scripts
USER root
RUN [ "bash", "-x", "/tmp/scripts/jboss.container.openjdk.jdk/configure.sh" ]

# end jboss.container.openjdk.jdk:8
# begin eap-6.4.0:1.0

# Environment variables
ENV \
    JBOSS_EAP_VERSION="6.4.0.GA" \
    JBOSS_HOME="/opt/eap" \
    JBOSS_PRODUCT="eap" \
    LAUNCH_JBOSS_IN_BACKGROUND="true" \
    PRODUCT_VERSION="6.4.0.GA" 

# Labels
LABEL \
      com.redhat.deployments-dir="/opt/eap/standalone/deployments"  \
      com.redhat.dev-mode="DEBUG:true"  \
      com.redhat.dev-mode.port="DEBUG_PORT:8787"  \
      org.jboss.deployments-dir="/opt/eap/standalone/deployments"  \
      org.jboss.product="eap"  \
      org.jboss.product.eap.version="6.4.0.GA"  \
      org.jboss.product.version="6.4.0.GA" 

# Exposed ports
EXPOSE 8080
# Custom scripts
USER root
RUN [ "bash", "-x", "/tmp/scripts/eap-6.4.0/install.sh" ]

# end eap-6.4.0:1.0
# begin eap-6.4.9:1.0

# Environment variables
ENV \
    JBOSS_EAP_VERSION="6.4.9.GA" \
    PRODUCT_VERSION="6.4.9.GA" 

# Labels
LABEL \
      org.jboss.product.eap.version="6.4.9.GA"  \
      org.jboss.product.version="6.4.9.GA" 

# Custom scripts
USER root
RUN [ "bash", "-x", "/tmp/scripts/eap-6.4.9/install.sh" ]

# end eap-6.4.9:1.0
# begin eap-6.4.19:1.0

# Environment variables
ENV \
    JBOSS_EAP_VERSION="6.4.19.GA" \
    PRODUCT_VERSION="6.4.19.GA" 

# Labels
LABEL \
      org.jboss.product.eap.version="6.4.19.GA"  \
      org.jboss.product.version="6.4.19.GA" 

# Custom scripts
USER root
RUN [ "bash", "-x", "/tmp/scripts/eap-6.4.19/install.sh" ]

# end eap-6.4.19:1.0
# begin eap-6.4.23:1.0

# Environment variables
ENV \
    JBOSS_EAP_VERSION="6.4.23.GA" \
    PRODUCT_VERSION="6.4.23.GA" 

# Labels
LABEL \
      org.jboss.product.eap.version="6.4.23.GA"  \
      org.jboss.product.version="6.4.23.GA" 

# Custom scripts
USER root
RUN [ "bash", "-x", "/tmp/scripts/eap-6.4.23/install.sh" ]

# end eap-6.4.23:1.0
# begin eap-install-cleanup:1.0

# Custom scripts
USER root
RUN [ "bash", "-x", "/tmp/scripts/eap-install-cleanup/install.sh" ]

# end eap-install-cleanup:1.0
# begin eap-6.4-latest:1.0

# end eap-6.4-latest:1.0
# begin jboss.container.java.jvm.api:1.0

# end jboss.container.java.jvm.api:1.0
# begin jboss.container.proxy.api:2.0

# end jboss.container.proxy.api:2.0
# begin jboss.container.java.proxy.bash:2.0

# Environment variables
ENV \
    JBOSS_CONTAINER_JAVA_PROXY_MODULE="/opt/jboss/container/java/proxy" 

# Custom scripts
USER root
RUN [ "bash", "-x", "/tmp/scripts/jboss.container.java.proxy.bash/configure.sh" ]
USER root
RUN [ "bash", "-x", "/tmp/scripts/jboss.container.java.proxy.bash/backward_compatibility.sh" ]

# end jboss.container.java.proxy.bash:2.0
# begin jboss.container.java.jvm.bash:1.0

# Environment variables
ENV \
    JBOSS_CONTAINER_JAVA_JVM_MODULE="/opt/jboss/container/java/jvm" 

# Custom scripts
USER root
RUN [ "bash", "-x", "/tmp/scripts/jboss.container.java.jvm.bash/configure.sh" ]
USER root
RUN [ "bash", "-x", "/tmp/scripts/jboss.container.java.jvm.bash/backward_compatibility.sh" ]

# end jboss.container.java.jvm.bash:1.0
# begin os-java-run:1.0

# end os-java-run:1.0
# begin dynamic-resources:1.0

# Custom scripts
USER root
RUN [ "bash", "-x", "/tmp/scripts/dynamic-resources/install.sh" ]

# end dynamic-resources:1.0
# begin jboss.container.maven.api:1.0

# end jboss.container.maven.api:1.0
# begin jboss.container.maven.35.bash:1.0

# Install required RPMs and ensure that the packages were installed
USER root
RUN yum --setopt=tsflags=nodocs install -y rh-maven35 \
    && rpm -q rh-maven35

# Environment variables
ENV \
    JBOSS_CONTAINER_MAVEN_35_MODULE="/opt/jboss/container/maven/35/" \
    MAVEN_VERSION="3.5" 

# Labels
LABEL \
      io.fabric8.s2i.version.maven="3.5" 

# Custom scripts
USER root
RUN [ "bash", "-x", "/tmp/scripts/jboss.container.maven.35.bash/configure.sh" ]

# end jboss.container.maven.35.bash:1.0
# begin jboss.container.util.logging.bash:1.0

# Environment variables
ENV \
    JBOSS_CONTAINER_UTIL_LOGGING_MODULE="/opt/jboss/container/util/logging/" 

# Custom scripts
USER root
RUN [ "bash", "-x", "/tmp/scripts/jboss.container.util.logging.bash/configure.sh" ]
USER root
RUN [ "bash", "-x", "/tmp/scripts/jboss.container.util.logging.bash/backward_compatibility.sh" ]

# end jboss.container.util.logging.bash:1.0
# begin jboss.container.maven.default.bash:1.0

# Environment variables
ENV \
    JBOSS_CONTAINER_MAVEN_DEFAULT_MODULE="/opt/jboss/container/maven/default/" 

# Custom scripts
USER root
RUN [ "bash", "-x", "/tmp/scripts/jboss.container.maven.default.bash/configure.sh" ]
USER root
RUN [ "bash", "-x", "/tmp/scripts/jboss.container.maven.default.bash/backward_compatibility.sh" ]

# end jboss.container.maven.default.bash:1.0
# begin s2i-common:1.0

# end s2i-common:1.0
# begin java-alternatives:1.0

# Custom scripts
USER root
RUN [ "bash", "-x", "/tmp/scripts/java-alternatives/run.sh" ]

# end java-alternatives:1.0
# begin os-eap64-openshift:1.0

# Custom scripts
USER root
RUN [ "bash", "-x", "/tmp/scripts/os-eap64-openshift/prepare.sh" ]
USER 185
RUN [ "bash", "-x", "/tmp/scripts/os-eap64-openshift/configure.sh" ]

# end os-eap64-openshift:1.0
# begin jboss.container.s2i.core.api:1.0

# Environment variables
ENV \
    S2I_SOURCE_DEPLOYMENTS_FILTER="*" 

# Labels
LABEL \
      io.openshift.s2i.destination="/tmp"  \
      io.openshift.s2i.scripts-url="image:///usr/local/s2i"  \
      org.jboss.container.deployments-dir="/deployments" 

# end jboss.container.s2i.core.api:1.0
# begin jboss.container.maven.s2i.api:1.0

# end jboss.container.maven.s2i.api:1.0
# begin jboss.container.s2i.core.bash:1.0

# Environment variables
ENV \
    JBOSS_CONTAINER_S2I_CORE_MODULE="/opt/jboss/container/s2i/core/" 

# Custom scripts
USER root
RUN [ "bash", "-x", "/tmp/scripts/jboss.container.s2i.core.bash/configure.sh" ]

# end jboss.container.s2i.core.bash:1.0
# begin jboss.container.maven.s2i.bash:1.0

# Environment variables
ENV \
    JBOSS_CONTAINER_MAVEN_S2I_MODULE="/opt/jboss/container/maven/s2i" 

# Custom scripts
USER root
RUN [ "bash", "-x", "/tmp/scripts/jboss.container.maven.s2i.bash/configure.sh" ]

# end jboss.container.maven.s2i.bash:1.0
# begin jboss.container.eap.s2i.bash:1.0

# Environment variables
ENV \
    JBOSS_CONTAINER_EAP_S2I_MODULE="/opt/jboss/container/eap/s2i" \
    S2I_SOURCE_DEPLOYMENTS_FILTER="*.war *.ear *.rar *.jar" 

# Custom scripts
USER root
RUN [ "bash", "-x", "/tmp/scripts/jboss.container.eap.s2i.bash/configure.sh" ]
USER root
RUN [ "bash", "-x", "/tmp/scripts/jboss.container.eap.s2i.bash/backward_compatibility.sh" ]

# end jboss.container.eap.s2i.bash:1.0
# begin os-eap-s2i:1.0

# end os-eap-s2i:1.0
# begin jboss.container.jolokia.api:1.0

# Environment variables
ENV \
    AB_JOLOKIA_AUTH_OPENSHIFT="true" \
    AB_JOLOKIA_HTTPS="true" \
    AB_JOLOKIA_PASSWORD_RANDOM="true" 

# end jboss.container.jolokia.api:1.0
# begin jboss.container.jolokia.bash:1.0

# Environment variables
ENV \
    AB_JOLOKIA_AUTH_OPENSHIFT="true" \
    AB_JOLOKIA_HTTPS="true" \
    AB_JOLOKIA_PASSWORD_RANDOM="true" \
    JBOSS_CONTAINER_JOLOKIA_MODULE="/opt/jboss/container/jolokia" \
    JOLOKIA_VERSION="1.6.2" 

# Labels
LABEL \
      io.fabric8.s2i.version.jolokia="1.6.2-redhat-00002" 

# Exposed ports
EXPOSE 8778
# Custom scripts
USER root
RUN [ "bash", "-x", "/tmp/scripts/jboss.container.jolokia.bash/configure.sh" ]
USER root
RUN [ "bash", "-x", "/tmp/scripts/jboss.container.jolokia.bash/backward_compatibility.sh" ]

# end jboss.container.jolokia.bash:1.0
# begin os-java-jolokia:1.0

# end os-java-jolokia:1.0
# begin jolokia:1.0

# Custom scripts
USER 185
RUN [ "bash", "-x", "/tmp/scripts/jolokia/configure.sh" ]

# end jolokia:1.0
# begin os-eap64-modules:1.0

# Custom scripts
USER 185
RUN [ "bash", "-x", "/tmp/scripts/os-eap64-modules/configure.sh" ]

# end os-eap64-modules:1.0
# begin os-eap64-ping:1.0

# Custom scripts
USER 185
RUN [ "bash", "-x", "/tmp/scripts/os-eap64-ping/configure.sh" ]

# end os-eap64-ping:1.0
# begin os-eap-launch:1.0

# Install required RPMs and ensure that the packages were installed
USER root
RUN yum --setopt=tsflags=nodocs install -y hostname \
    && rpm -q hostname

# Environment variables
ENV \
    DEFAULT_ADMIN_USERNAME="eapadmin" 

# Custom scripts
USER 185
RUN [ "bash", "-x", "/tmp/scripts/os-eap-launch/configure.sh" ]

# end os-eap-launch:1.0
# begin os-eap-node-name:1.0

# Custom scripts
USER 185
RUN [ "bash", "-x", "/tmp/scripts/os-eap-node-name/configure.sh" ]

# end os-eap-node-name:1.0
# begin os-eap-txnrecovery:1.0

# Install required RPMs and ensure that the packages were installed
USER root
RUN yum --setopt=tsflags=nodocs install -y python-enum34 python-requests \
    && rpm -q python-enum34 python-requests

# Custom scripts
USER root
RUN [ "bash", "-x", "/tmp/scripts/os-eap-txnrecovery/install_as_root.sh" ]

# end os-eap-txnrecovery:1.0
# begin os-eap-migration:1.0

# Custom scripts
USER 185
RUN [ "bash", "-x", "/tmp/scripts/os-eap-migration/configure.sh" ]

# end os-eap-migration:1.0
# begin os-eap64-launch:1.0

# Environment variables
ENV \
    JBOSS_MODULES_SYSTEM_PKGS="org.jboss.logmanager,jdk.nashorn.api" 

# Custom scripts
USER 185
RUN [ "bash", "-x", "/tmp/scripts/os-eap64-launch/configure.sh" ]

# end os-eap64-launch:1.0
# begin jboss.eap.logging.ext:1.0

# Custom scripts
USER 185
RUN [ "bash", "-x", "/tmp/scripts/jboss.eap.logging.ext/configure.sh" ]

# end jboss.eap.logging.ext:1.0
# begin os-eap-probes:1.0

# Install required RPMs and ensure that the packages were installed
USER root
RUN yum --setopt=tsflags=nodocs install -y python-enum34 python-requests \
    && rpm -q python-enum34 python-requests

# Custom scripts
USER 185
RUN [ "bash", "-x", "/tmp/scripts/os-eap-probes/configure.sh" ]

# end os-eap-probes:1.0
# begin jboss-maven:1.0

# end jboss-maven:1.0
# begin os-eap-db-drivers:1.0

# Install required RPMs and ensure that the packages were installed
USER root
RUN yum --setopt=tsflags=nodocs install -y rh-mongodb36-mongo-java-driver postgresql-jdbc mysql-connector-java \
    && rpm -q rh-mongodb36-mongo-java-driver postgresql-jdbc mysql-connector-java

# Custom scripts
USER 185
RUN [ "bash", "-x", "/tmp/scripts/os-eap-db-drivers/configure.sh" ]

# end os-eap-db-drivers:1.0
# begin os-eap-activemq-rar:1.0

# Custom scripts
USER 185
RUN [ "bash", "-x", "/tmp/scripts/os-eap-activemq-rar/configure.sh" ]

# end os-eap-activemq-rar:1.0
# begin os-eap-sso:1.0

# Custom scripts
USER 185
RUN [ "bash", "-x", "/tmp/scripts/os-eap-sso/configure.sh" ]

# end os-eap-sso:1.0
# begin os-eap64-sso:1.0

# Custom scripts
USER 185
RUN [ "bash", "-x", "/tmp/scripts/os-eap64-sso/configure.sh" ]

# end os-eap64-sso:1.0
# begin jboss.container.hawkular.api:1.0

# end jboss.container.hawkular.api:1.0
# begin jboss.container.hawkular.bash:1.0

# Environment variables
ENV \
    JBOSS_CONTAINER_HAWKULAR_MODULE="/opt/jboss/container/hawkular" 

# Custom scripts
USER root
RUN [ "bash", "-x", "/tmp/scripts/jboss.container.hawkular.bash/configure.sh" ]
USER root
RUN [ "bash", "-x", "/tmp/scripts/jboss.container.hawkular.bash/backward_compatibility.sh" ]

# end jboss.container.hawkular.bash:1.0
# begin os-java-hawkular:1.0

# end os-java-hawkular:1.0
# begin os-eap64-hawkular:1.0

# Custom scripts
USER root
RUN [ "bash", "-x", "/tmp/scripts/os-eap64-hawkular/install_as_root" ]

# end os-eap64-hawkular:1.0
# begin os-eap-hawkular:1.0

# Custom scripts
USER 185
RUN [ "bash", "-x", "/tmp/scripts/os-eap-hawkular/configure.sh" ]

# end os-eap-hawkular:1.0
# begin os-eap-deployment-scanner:1.0

# Custom scripts
USER 185
RUN [ "bash", "-x", "/tmp/scripts/os-eap-deployment-scanner/configure.sh" ]

# end os-eap-deployment-scanner:1.0
# begin os-eap-extensions:1.0

# Custom scripts
USER 185
RUN [ "bash", "-x", "/tmp/scripts/os-eap-extensions/configure.sh" ]

# end os-eap-extensions:1.0
# begin openshift-layer:1.0

# Custom scripts
USER 185
RUN [ "bash", "-x", "/tmp/scripts/openshift-layer/configure_layers.sh" ]

# end openshift-layer:1.0
# begin openshift-passwd:1.0

# end openshift-passwd:1.0
# begin os-logging:1.0

# end os-logging:1.0
# begin jboss.container.prometheus.api:1.0

# end jboss.container.prometheus.api:1.0
# begin jboss.container.prometheus.bash:1.0

# Environment variables
ENV \
    AB_PROMETHEUS_JMX_EXPORTER_CONFIG="/opt/jboss/container/prometheus/etc/jmx-exporter-config.yaml" \
    AB_PROMETHEUS_JMX_EXPORTER_PORT="9799" \
    JBOSS_CONTAINER_PROMETHEUS_MODULE="/opt/jboss/container/prometheus" 

# Custom scripts
USER root
RUN [ "bash", "-x", "/tmp/scripts/jboss.container.prometheus.bash/configure.sh" ]

# end jboss.container.prometheus.bash:1.0
# begin jboss.container.eap.prometheus.agent:1.0

# Custom scripts
USER 185
RUN [ "bash", "-x", "/tmp/scripts/jboss.container.eap.prometheus.agent/configure.sh" ]

# end jboss.container.eap.prometheus.agent:1.0
# begin jboss.container.eap.prometheus.config:6.4

# Custom scripts
USER root
RUN [ "bash", "-x", "/tmp/scripts/jboss.container.eap.prometheus.config/configure.sh" ]

# end jboss.container.eap.prometheus.config:6.4
# begin jboss-eap-6/eap64-openshift:1.9

# Install required RPMs and ensure that the packages were installed
USER root
RUN yum --setopt=tsflags=nodocs install -y python-requests python-enum34 PyYAML \
    && rpm -q python-requests python-enum34 PyYAML

# Environment variables
ENV \
    JBOSS_IMAGE_NAME="jboss-eap-6/eap64-openshift" \
    JBOSS_IMAGE_VERSION="1.9" 

# Labels
LABEL \
      com.redhat.component="jboss-eap-6-eap64-openshift-container"  \
      description="Red Hat JBoss Enterprise Application Platform 6.4 OpenShift container image"  \
      io.cekit.version="3.2.1"  \
      io.k8s.description="Platform for building and running JavaEE applications on JBoss EAP 6.4"  \
      io.k8s.display-name="JBoss EAP 6.4"  \
      io.openshift.expose-services="8080:http"  \
      io.openshift.s2i.scripts-url="image:///usr/local/s2i"  \
      io.openshift.tags="builder,javaee,eap,eap6"  \
      maintainer="Red Hat"  \
      name="jboss-eap-6/eap64-openshift"  \
      summary="Red Hat JBoss Enterprise Application Platform 6.4 OpenShift container image"  \
      version="1.9" 

# Exposed ports
EXPOSE 8443
# end jboss-eap-6/eap64-openshift:1.9

USER root
RUN [ ! -d /tmp/scripts ] || rm -rf /tmp/scripts
RUN [ ! -d /tmp/artifacts ] || rm -rf /tmp/artifacts

# Clear package manager metadata
RUN yum clean all && [ ! -d /var/cache/yum ] || rm -rf /var/cache/yum



# Run user
USER 185

# Specify the working directory
WORKDIR /home/jboss

# Specify run cmd
CMD ["/opt/eap/bin/openshift-launch.sh"]
