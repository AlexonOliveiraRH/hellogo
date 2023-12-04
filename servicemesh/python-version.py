import requests
import time

api_v1_count = 0
api_v2_count = 0
api_v3_count = 0
total_requests = 0

while True:
    # Make a request and capture the API version from the response
    response = requests.get("http://istio-ingressgateway-istio-system.apps.cluster-rvbjh.rvbjh.sandbox2696.opentlc.com")
    api_version = response.text.split(":")[0].strip()

    # Update the corresponding counter based on the API version
    if api_version == "API v1":
        api_v1_count += 1
    elif api_version == "API v2":
        api_v2_count += 1
    elif api_version == "API v3":
        api_v3_count += 1

    # Increment the total requests counter
    total_requests += 1

    # Display the response and counters
    print(response.text)

    # Calculate and display percentages every N requests (adjust N as needed)
    if total_requests % 10 == 0:
        print(f"API v1: {api_v1_count} calls ({api_v1_count * 100 / total_requests:.2f}%)")
        print(f"API v2: {api_v2_count} calls ({api_v2_count * 100 / total_requests:.2f}%)")
        print(f"API v3: {api_v3_count} calls ({api_v3_count * 100 / total_requests:.2f}%)")
        print(f"Total requests: {total_requests}")
        print("------------------------------------------")

    time.sleep(1)
