# MetalLB

Deploys [MetalLB - Load Balancer for Kubernetes](https://github.com/metallb/metallb)

## Installation

```kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.15.2/config/manifests/metallb-native.yaml```

This will install:
- MetalLB controller
- MetalLB speaker (for announcing routes)
- CRDs for configuring address pools and BGP/ARP

```kubectl apply -f loadbalancer.yaml```

This will create:
- An IP address pool for services
- ARP advertisements for services using the pool