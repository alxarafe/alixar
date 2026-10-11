#!/usr/bin/env bash
#
# Maven Wrapper startup script
#

set -euo pipefail

# Resolve the project base directory (follow symlinks)
MAVEN_PROJECTBASEDIR="$(cd "$(dirname "$(readlink -f "$0")")" && pwd)"
MAVEN_WRAPPER_JAR="${MAVEN_PROJECTBASEDIR}/.mvn/wrapper/maven-wrapper.jar"
MAVEN_WRAPPER_PROPERTIES="${MAVEN_PROJECTBASEDIR}/.mvn/wrapper/maven-wrapper.properties"

# Check if Maven Wrapper JAR exists, if not download it
if [ ! -f "$MAVEN_WRAPPER_JAR" ]; then
    echo "Downloading Maven Wrapper..."
    WRAPPER_URL=$(grep '^wrapperUrl=' "$MAVEN_WRAPPER_PROPERTIES" | cut -d'=' -f2-)
    if [ -z "$WRAPPER_URL" ]; then
        WRAPPER_URL="https://repo.maven.apache.org/maven2/org/apache/maven/wrapper/maven-wrapper/3.3.2/maven-wrapper-3.3.2.jar"
    fi
    mkdir -p "$(dirname "$MAVEN_WRAPPER_JAR")"
    if command -v curl >/dev/null 2>&1; then
        curl -fsSL "$WRAPPER_URL" -o "$MAVEN_WRAPPER_JAR"
    elif command -v wget >/dev/null 2>&1; then
        wget -q "$WRAPPER_URL" -O "$MAVEN_WRAPPER_JAR"
    else
        echo "ERROR: curl or wget required to download Maven Wrapper" >&2
        exit 1
    fi
fi

# Run Maven Wrapper (JAR has no Main-Class in manifest, specify explicitly)
exec java -Dmaven.multiModuleProjectDirectory="$MAVEN_PROJECTBASEDIR" -cp "$MAVEN_WRAPPER_JAR" org.apache.maven.wrapper.MavenWrapperMain "$@"
