#!/bin/bash

# Drop into a postgres pod
kubectl run postgres-shell --rm -it --image=postgres:16 -- /bin/bash