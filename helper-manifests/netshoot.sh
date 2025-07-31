#!/bin/bash

# Drop into a netshoot pod

kubectl run netshoot --image=nicolaka/netshoot --restart=Never --rm -it -- bash
