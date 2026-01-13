#!/bin/bash

# Drop into a mariadb pod
kubectl run mariadb-shell --rm -it --image=mariadb:11.8.2 -- /bin/bash