package main

import (
	"context"
	"os"
	"time"

	dpapi "github.com/intel/intel-device-plugins-for-kubernetes/pkg/deviceplugin"
	"github.com/pkg/errors"
	pluginapi "k8s.io/kubelet/pkg/apis/deviceplugin/v1beta1"
)

const (
	deviceFile = "/dev/tpmrm0"
	deviceType = "tpmrm"

	scanPeriod = 5 * time.Second
)

type devicePlugin struct {
	ctx context.Context
}

func newDevicePlugin(ctx context.Context) *devicePlugin {
	return &devicePlugin{
		ctx: ctx,
	}
}

func (dp *devicePlugin) Scan(notifier dpapi.Notifier) error {
	for ; dp.ctx.Err() == nil; time.Sleep(scanPeriod) {
		if _, err := os.Stat(deviceFile); err != nil {
			if !errors.Is(err, os.ErrNotExist) {
				return err
			}

			continue
		}

		devInfo := dpapi.NewDeviceInfo(
			pluginapi.Healthy,
			[]pluginapi.DeviceSpec{{
				HostPath:      deviceFile,
				ContainerPath: deviceFile,
				Permissions:   "rw",
			}},
			nil,
			nil,
			nil,
		)

		devTree := dpapi.NewDeviceTree()
		devTree.AddDevice(deviceType, deviceType, devInfo)

		notifier.Notify(devTree)
	}

	return nil
}
