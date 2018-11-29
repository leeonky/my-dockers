FROM leeonky/os-dev:ubuntu

ENV GRADLE_VERSIN=4.10.2

RUN sudo apt-get update && sudo apt-get install -y openjdk-8-jdk &&\
	curl -o "$USER_HOME/gradle-$GRADLE_VERSIN-bin.zip" https://downloads.gradle.org/distributions/gradle-$GRADLE_VERSIN-bin.zip &&\
	cd "$USER_HOME" && unzip gradle-$GRADLE_VERSIN-bin.zip &&\
	mv "gradle-$GRADLE_VERSIN" "gradle" &&\
	rm gradle-$GRADLE_VERSIN-bin.zip &&\
	sudo ln -s "$USER_HOME/gradle/bin/gradle" /usr/local/bin/

RUN mkdir -p "$USER_HOME/.gradle/caches/modules-2/files-2.1" && chown $USER_NAME:$USER_NAME -R "$USER_HOME/.gradle" &&\
	mkdir -p "$USER_HOME/.m2" && chown $USER_NAME:$USER_NAME -R "$USER_HOME/.m2"

