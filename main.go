package main

import (
	"context"
	"flag"
	"log"
	"os"
	"os/signal"
	"syscall"

	dpapi "github.com/intel/intel-device-plugins-for-kubernetes/pkg/deviceplugin"
)

func main() {
	var domain string

	flag.StringVar(&domain, "domain", "2gis.com", "device plugin domain")
	flag.Parse()

	log.Default().Println("TPM device plugin started")
	log.Default().Printf("domain: %s", domain)

	plugin := newDevicePlugin(signalCtx())

	manager := dpapi.NewManager(domain, plugin)
	manager.Run()
}

func signalCtx() context.Context {
	ctx, cancel := context.WithCancel(context.Background())

	ch := make(chan os.Signal, 1)
	signal.Ignore(syscall.SIGHUP, syscall.SIGPIPE)
	signal.Notify(ch, syscall.SIGINT, syscall.SIGTERM)

	go func() {
		<-ch
		cancel()
	}()

	return ctx
}
