#!/bin/bash
while true; do curl -s http://$(oc get route istio-ingressgateway -n istio-system -o jsonpath='{.spec.host}'); sleep 1; done
