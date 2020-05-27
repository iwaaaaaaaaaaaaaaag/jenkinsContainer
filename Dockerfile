FROM jenkins/jenkins:2.190.1

USER root

# Disabling the Setup Wizard
# ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# install jenkins plugins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

#create user 
ENV JENKINS_USER admin
ENV JENKINS_PASS admin

COPY initScript/custom.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY initScript/default-user.groovy /usr/share/jenkins/ref/init.groovy.d/