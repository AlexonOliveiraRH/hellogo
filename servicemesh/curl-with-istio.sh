#!/bin/bash
while true; do curl -s http://$(oc get route istio-ingressgateway -n user1-istio -o jsonpath='{.spec.host}'); sleep 1; done
