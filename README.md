# TPM device plugin

Kubernetes [device plugin](https://kubernetes.io/docs/concepts/extend-kubernetes/compute-storage-net/device-plugins/)
for mounting TPM 2.0 device (`/dev/tpmrm0`) to pods. Allows mounting device from the node only to the single pod at the
same time.

To mount device to the container you should add the following lines to the container spec:

```yaml
resources:
  limits:
    {{ .domain }}/tpmrm: 1
```

## Requirements

* golang (>= 1.21)
* make
* helm
* access to the existing kubernetes cluster

### Configuration

Chart has the following values:

| Name               | Description                                                  | Value               |
|--------------------|--------------------------------------------------------------|---------------------|
| `name`             | Name used for deployment.                                    | `tpm-device-plugin` |
| `image.repository` | Image repository. Ex: `registry.com/path/tpm-device-plugin`. | `""`                |
| `image.tag`        | Image tag.                                                   | `""`                |
| `image.pullPolicy` | Image pull policy.                                           | `IfNotPresent`      |
| `domain`           | Device domain.                                               | `2gis.com`          |

If you are using `make install`, the following values are configured from the environment variables:

| Name                 | Expression with envs                       | Value                 |
|----------------------|--------------------------------------------|-----------------------|
| `image.repository`   | `${REGISTRY}/${REGISTRY_PATH}/${APP_NAME}` | `//tpm-device-plugin` |
| `image.tag`          | `${IMAGE_VERSION}`                         | `latest`              |
| kubernetes namespace | `${NAMESPACE}`                             | `""`                  |

### Building and deploying application

Build application image and push it to the docker registry:

```sh
$ export REGISTRY="registry.com"
$ export REGISTRY_PATH="path"
$ make build-image push-image
```

Deploy application to the configured kubernetes cluster:

```sh
$ make install
```

Remove application from the configured kubernetes cluster:

```sh
$ make uninstall
```
