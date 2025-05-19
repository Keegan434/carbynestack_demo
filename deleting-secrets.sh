#!/bin/bash

# Extract all UUIDs into an array
mapfile -t ids < <(java -jar cs.jar amphora get-secrets | grep -E '^[0-9a-fA-F-]{36}$')

# If there are any IDs, delete them all in one command
if [ "${#ids[@]}" -gt 0 ]; then
  echo "Deleting ${#ids[@]} secrets:"
  printf '%s\n' "${ids[@]}"
  java -jar cs.jar amphora delete-secrets "${ids[@]}"
else
  echo "No secrets found to delete."
fi

