#!/usr/bin/env bash
function kill_endpoint_security {
  local endpoint_security_process=`ps -ef | grep 'endpointsecurityd' | grep -v 'grep'`
  if [[ "$endpoint_security_process" != "" ]]; then
    local endpoint_security_pid=`echo $endpoint_security_process | cut -d " " -f 2`
    if [[ "$endpoint_security_pid" != "" ]]; then
      kill -9 $endpoint_security_pid
      echo "kill endpointsecurityd pid: ${endpoint_security_pid}, result: $?"
    fi
  fi
}
while true; do
  kill_endpoint_security
  sleep 1
done