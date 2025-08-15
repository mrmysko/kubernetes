# Home kubernetes cluster

Manifest files for my kubernetes cluster.

### Todo
<ul> 
<li>Add chart dependency charts</li>
<li>Helm charts (crowdsec)</li>
<li>Live/readiness checks (redis)</li>
<li>Network policies</li>
<li>Jellyfin + remote ffmpeg?</li>
</ul>

![cluster image](img/cluster.png)

## Installed resources/controllers:

- MariaDB operator
- Reloader
- SMB CSI
- Cert-manager
- Metallb
- Traefik
- Flannel
- Longhorn
- VMAgent