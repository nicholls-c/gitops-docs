---
date:
  created: 15-12-2025
---

# Minikube

These guides have been tested using `Minikube`.

!!! Warning "Local k8s"
    Other options are available. Namely `kind`.
    All steps should work on any local kubernetes offering.

Start a local cluster:
```bash
# start minikube server
minikube start \
--install-addons=true \
--driver=docker \
--kubernetes-version=v1.34.0
```

Enable addons:
```bash
# enable metallb
minikube addons enable metallb

# enable mettrics server
minikube addons enable metrics-server
```

Whilst not required, it is recommended to setup an IP address range for `MetalLb` to expose as a `LoadBalancer` type in the more advanced scenarious:
```bash
# configure IP range for LoadBalancer type
minikube addons configure metallb << EOF
192.168.49.100
192.168.49.120
EOF
```

We may as well start a tunnel, as any later use of Gateway CRDs will allow us to access services by their port over `127.0.0.1` on the host.

**Do this in a new terminal**
```bash
minikube tunnel
```