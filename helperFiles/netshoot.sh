#!/bin/bash

# Drop into a netshoot pod for network troubleshooting
kubectl run netshoot --image=nicolaka/netshoot --restart=Never --rm -it -- bash
