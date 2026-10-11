@echo off
REM Maven Wrapper startup script for Windows

setlocal

REM Resolve the project base directory
set "MAVEN_PROJECTBASEDIR=%~dp0"
set "MAVEN_PROJECTBASEDIR=%MAVEN_PROJECTBASEDIR:~0,-1%"
set "MAVEN_WRAPPER_JAR=%MAVEN_PROJECTBASEDIR%\.mvn\wrapper\maven-wrapper.jar"
set "MAVEN_WRAPPER_PROPERTIES=%MAVEN_PROJECTBASEDIR%\.mvn\wrapper\maven-wrapper.properties"

REM Check if Maven Wrapper JAR exists, if not download it
if not exist "%MAVEN_WRAPPER_JAR%" (
    echo Downloading Maven Wrapper...
    for /f "tokens=2 delims==" %%A in ('findstr "^wrapperUrl=" "%MAVEN_WRAPPER_PROPERTIES%"') do set "WRAPPER_URL=%%A"
    if not defined WRAPPER_URL set "WRAPPER_URL=https://repo.maven.apache.org/maven2/org/apache/maven/wrapper/maven-wrapper/3.3.2/maven-wrapper-3.3.2.jar"
    if not exist "%MAVEN_PROJECTBASEDIR%\.mvn\wrapper" mkdir "%MAVEN_PROJECTBASEDIR%\.mvn\wrapper"
    curl -fsSL "%WRAPPER_URL%" -o "%MAVEN_WRAPPER_JAR%" 2>nul || powershell -Command "Invoke-WebRequest -Uri '%WRAPPER_URL%' -OutFile '%MAVEN_WRAPPER_JAR%'"
)

REM Run Maven Wrapper (JAR has no Main-Class in manifest, specify explicitly)
java -Dmaven.multiModuleProjectDirectory="%MAVEN_PROJECTBASEDIR%" -cp "%MAVEN_WRAPPER_JAR%" org.apache.maven.wrapper.MavenWrapperMain %*