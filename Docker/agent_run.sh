#создаем сеть для teamcity
#docker network create teamcity
#запускаем сервер
#docker run \
#    --name="tc_pugo_agent"\
#    -e SERVER_URL="192.168.0.222:8111" \
#    -e AGENT_NAME="pugo_agent" \
#    -v /home/raysandman/teamcity/teamcity_agent/conf:/data/teamcity_agent/conf \
#    --network teamcity
#jetbrains/teamcity-agent:latest
#запускаем агента
docker run \
    -d \
    --name="tc_pugo_agent"\
    -e SERVER_URL="172.17.0.2:8111" \
    -e AGENT_NAME="pugo_agent" \
    -v /home/raysandman/teamcity/teamcity_agent/conf:/data/teamcity_agent/conf \
    --network 672ed6a1107dd6ea26c0ddb0aac1c4f0ebcf13cf557b7d5bebb21667b3b1fd9d \
jetbrains/teamcity-agent:latest
#NEXUS
docker run \
    -d -p 8081:8081 \
    --name nexus \
    -v nexus-data:/nexus-data \
    --network 672ed6a1107dd6ea26c0ddb0aac1c4f0ebcf13cf557b7d5bebb21667b3b1fd9d \
    sonatype/nexus3
#BITBUCKET
docker run \
    -d -p 7990:7990 \
    --name nexus \
    -v bitbucketVolume:/var/atlassian/application-data/bitbucket \
    --network 672ed6a1107dd6ea26c0ddb0aac1c4f0ebcf13cf557b7d5bebb21667b3b1fd9d \
    atlassian/bitbucket
#gitlab
sudo docker run --detach \
  --hostname gitlab.example.com \
  --publish 8443:443 --publish 8080:80 --publish 8022:22 \
  --name gitlab \
  --restart always \
  --volume /home/raysandman/gitlab/config:/etc/gitlab \
  --volume /home/raysandman/gitlab/logs:/var/log/gitlab \
  --volume /home/raysandman/gitlab/data:/var/opt/gitlab \
  --network 672ed6a1107dd6ea26c0ddb0aac1c4f0ebcf13cf557b7d5bebb21667b3b1fd9d \
  --shm-size 256m \
  gitlab/gitlab-ee:latest