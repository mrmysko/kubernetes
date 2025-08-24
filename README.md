# Home kubernetes cluster

Manifest files for my kubernetes cluster.

### Todo
<ul> 
<li>Expand READMEs</li>
<li>Live/readiness checks (redis)</li>
<li>Network policies</li>
<li>Jellyfin, crowdsec deployments</li>
<li>Set template default values</li>
</ul>

![cluster image](img/cluster.png)

## Necessary resources/controllers:

- MariaDB operator
- SMB CSI
- Cert-manager
- Metallb
- Traefik
- Flannel
- Longhorn
- VMAgent