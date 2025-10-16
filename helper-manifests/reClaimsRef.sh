#!/bin/bash

# Check if a PV name was provided
if [ -z "$1" ]; then
  echo "Usage: $0 <pv-name>"
  exit 1
fi

PV_NAME=$1

# Confirm the action with the user
echo "This will remove the claimRef from PV '$PV_NAME' to make it available."
read -p "Are you sure you want to continue? (y/n) " -n 1 -r
echo # Move to a new line

if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "Reclaiming PV $PV_NAME..."
  kubectl patch pv $PV_NAME -p '{"spec":{"claimRef":null}}'
  if [ $? -eq 0 ]; then
    echo "✅ Success! PV '$PV_NAME' is now available."
  else
    echo "❌ Error: Failed to patch PV '$PV_NAME'."
  fi
else
  echo "Aborted."
fi