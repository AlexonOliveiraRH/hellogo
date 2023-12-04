#!/bin/bash

# Initialize counters for each API version
api_v1_count=0
api_v2_count=0
api_v3_count=0
total_requests=0

while true; do
    # Make a request and capture the API version from the response
    response=$(curl -s http://$(oc get route istio-ingressgateway -n istio-system -o jsonpath='{.spec.host}'))
    api_version=$(echo "$response" | grep -oP 'API v\d+')

    # Update the corresponding counter based on the API version
    case $api_version in
        "API v1")
            ((api_v1_count++))
            ;;
        "API v2")
            ((api_v2_count++))
            ;;
        "API v3")
            ((api_v3_count++))
            ;;
    esac

    # Increment the total requests counter
    ((total_requests++))

    # Display the response and counters
    echo "$response"

    # Calculate and display percentages every N requests (adjust N as needed)
    if [ $((total_requests % 10)) -eq 0 ]; then
        echo "API v1: $api_v1_count calls ($(echo "scale=2; $api_v1_count * 100 / $total_requests" | bc)%)"
        echo "API v2: $api_v2_count calls ($(echo "scale=2; $api_v2_count * 100 / $total_requests" | bc)%)"
        echo "API v3: $api_v3_count calls ($(echo "scale=2; $api_v3_count * 100 / $total_requests" | bc)%)"
        echo "Total requests: $total_requests"
        echo "------------------------------------------"
    fi

    sleep 1
done

