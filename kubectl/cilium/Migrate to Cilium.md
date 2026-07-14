1. Patch nodes to disable flannel and kube-proxy (Not really necessary, only used when bootstrapping a new cluster)

cluster:
  network:
    cni:
      name: none
  proxy:
    disabled: true

2. Install cilium

helm install \
    cilium \
    oci://quay.io/cilium/charts/cilium \
    --version 1.19.5 \
    --namespace kube-system \
    --set ipam.mode=kubernetes \
    --set l2announcements.enabled=true \
    --set kubeProxyReplacement=true \
    --set securityContext.capabilities.ciliumAgent="{CHOWN,KILL,NET_ADMIN,NET_RAW,IPC_LOCK,SYS_ADMIN,SYS_RESOURCE,DAC_OVERRIDE,FOWNER,SETGID,SETUID}" \
    --set securityContext.capabilities.cleanCiliumState="{NET_ADMIN,SYS_ADMIN,SYS_RESOURCE}" \
    --set cgroup.autoMount.enabled=false \
    --set cgroup.hostRoot=/sys/fs/cgroup \
    --set k8sServiceHost=localhost \
    --set k8sServicePort=7445 \
    --set=bpf.hostLegacyRouting=true \
    --set hubble.enabled=false

3. Delete flannel and kube-proxy daemonSets

4. Reboot nodes one by one

5. Install cilium cli https://github.com/cilium/cilium-cli

6. Check status with "cilium status"