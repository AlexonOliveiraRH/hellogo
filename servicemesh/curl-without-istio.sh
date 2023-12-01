#!/bin/bash
while true; do curl -s http://$(oc get route hellogo --template '{{ .spec.host }}'); sleep 1; done
