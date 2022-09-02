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
    --name="tc_pugo_agent"\
    -e SERVER_URL="172.17.0.2:8111" \
    -e AGENT_NAME="pugo_agent" \
    -v /home/raysandman/teamcity/teamcity_agent/conf:/data/teamcity_agent/conf \
    --network 672ed6a1107dd6ea26c0ddb0aac1c4f0ebcf13cf557b7d5bebb21667b3b1fd9d \
jetbrains/teamcity-agent:latest