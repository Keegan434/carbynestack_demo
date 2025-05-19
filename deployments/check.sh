#!/bin/bash

# Step 1: Get all secret UUIDs
java -jar cs.jar amphora get-secrets > input.txt

# Step 2: Read all UUIDs into an array
mapfile -t uuids < <(grep -Eo '([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})' input.txt)

# Step 3: Check if any UUIDs were found
if [ ${#uuids[@]} -eq 0 ]; then
  echo "No UUIDs currently"
  exit 1
else
  echo "There is data."
  count=${#uuids[@]}
  echo "UUID count: $count"
fi

