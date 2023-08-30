module gitlab.2gis.ru/iodev/on-premise/tpm-device-plugin

go 1.21

require (
	github.com/intel/intel-device-plugins-for-kubernetes v0.27.1
	github.com/pkg/errors v0.9.1
	k8s.io/kubelet v1.27.3
)

require (
	github.com/fsnotify/fsnotify v1.6.0 // indirect
	github.com/go-logr/logr v1.2.4 // indirect
	github.com/gogo/protobuf v1.3.2 // indirect
	github.com/golang/protobuf v1.5.3 // indirect
	golang.org/x/net v0.13.0 // indirect
	golang.org/x/sys v0.10.0 // indirect
	golang.org/x/text v0.11.0 // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20230525234030-28d5490b6b19 // indirect
	google.golang.org/grpc v1.55.0 // indirect
	google.golang.org/protobuf v1.30.0 // indirect
	k8s.io/klog/v2 v2.90.1 // indirect
)

replace (
	k8s.io/api => k8s.io/api v0.27.3
	k8s.io/apiextensions-apiserver => k8s.io/apiextensions-apiserver v0.27.3
	k8s.io/apimachinery => k8s.io/apimachinery v0.27.3
	k8s.io/apiserver => k8s.io/apiserver v0.27.3
	k8s.io/cli-runtime => k8s.io/cli-runtime v0.27.3
	k8s.io/client-go => k8s.io/client-go v0.27.3
	k8s.io/cloud-provider => k8s.io/cloud-provider v0.27.3
	k8s.io/cluster-bootstrap => k8s.io/cluster-bootstrap v0.27.3
	k8s.io/code-generator => k8s.io/code-generator v0.27.3
	k8s.io/component-base => k8s.io/component-base v0.27.3
	k8s.io/component-helpers => k8s.io/component-helpers v0.27.3
	k8s.io/controller-manager => k8s.io/controller-manager v0.27.3
	k8s.io/cri-api => k8s.io/cri-api v0.27.3
	k8s.io/csi-translation-lib => k8s.io/csi-translation-lib v0.27.3
	k8s.io/dynamic-resource-allocation => k8s.io/dynamic-resource-allocation v0.27.3
	k8s.io/kms => k8s.io/kms v0.27.3
	k8s.io/kube-aggregator => k8s.io/kube-aggregator v0.27.3
	k8s.io/kube-controller-manager => k8s.io/kube-controller-manager v0.27.3
	k8s.io/kube-proxy => k8s.io/kube-proxy v0.27.3
	k8s.io/kube-scheduler => k8s.io/kube-scheduler v0.27.3
	k8s.io/kubectl => k8s.io/kubectl v0.27.3
	k8s.io/kubelet => k8s.io/kubelet v0.27.3
	k8s.io/legacy-cloud-providers => k8s.io/legacy-cloud-providers v0.27.3
	k8s.io/metrics => k8s.io/metrics v0.27.3
	k8s.io/mount-utils => k8s.io/mount-utils v0.27.3
	k8s.io/pod-security-admission => k8s.io/pod-security-admission v0.27.3
	k8s.io/sample-apiserver => k8s.io/sample-apiserver v0.27.3
	k8s.io/sample-cli-plugin => k8s.io/sample-cli-plugin v0.27.3
	k8s.io/sample-controller => k8s.io/sample-controller v0.27.3
)
