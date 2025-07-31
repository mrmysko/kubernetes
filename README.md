# Home kubernetes cluster

Manifest files for my kubernetes cluster.

### Installing helm charts
<code>helm install -n \<namespace> -f <values_file> <release_name> <app_dir></code>

### Todo
<ul> 
<li>Helm charts (crowdsec)</li>
<li>Template values files</li>
<li>Live/readiness checks (redis)</li>
<li>Network policies</li>
<li>Metrics</li>
</ul>

![cluster image](img/cluster.png)
