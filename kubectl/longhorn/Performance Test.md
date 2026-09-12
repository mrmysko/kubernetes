# StorageClasses:

---
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: longhorn-test-rwo
provisioner: driver.longhorn.io
allowVolumeExpansion: true
reclaimPolicy: Delete
volumeBindingMode: Immediate
parameters:
  numberOfReplicas: "2"
  fsType: "xfs"
  dataLocality: "disabled"
  dataEngine: "v1"
  accessMode: "ReadWriteOnce"
---
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: longhorn-test-rwx
provisioner: driver.longhorn.io
allowVolumeExpansion: true
reclaimPolicy: Delete
volumeBindingMode: Immediate
parameters:
  numberOfReplicas: "2"
  fsType: "xfs"
  dataLocality: "disabled"
  dataEngine: "v1"
  accessMode: "ReadWriteMany"

# Create pods with mounted storage