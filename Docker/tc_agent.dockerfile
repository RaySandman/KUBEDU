FROM jetbrains/teamcity-agent:latest
ADD gradle:6.5.1-jdk14
LABEL name="pugoagent"