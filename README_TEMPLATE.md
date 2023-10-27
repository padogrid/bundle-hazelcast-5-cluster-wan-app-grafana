![PadoGrid](https://github.com/padogrid/padogrid/raw/develop/images/padogrid-3d-16x16.png) [*PadoGrid*](https://github.com/padogrid) | [*Catalogs*](https://github.com/padogrid/catalog-bundles/blob/master/all-catalog.md) | [*Manual*](https://github.com/padogrid/padogrid/wiki) | [*FAQ*](https://github.com/padogrid/padogrid/wiki/faq) | [*Releases*](https://github.com/padogrid/padogrid/releases) | [*Templates*](https://github.com/padogrid/padogrid/wiki/Using-Bundle-Templates) | [*Pods*](https://github.com/padogrid/padogrid/wiki/Understanding-Padogrid-Pods) | [*Kubernetes*](https://github.com/padogrid/padogrid/wiki/Kubernetes) | [*Docker*](https://github.com/padogrid/padogrid/wiki/Docker) | [*Apps*](https://github.com/padogrid/padogrid/wiki/Apps) | [*Quick Start*](https://github.com/padogrid/padogrid/wiki/Quick-Start)

---

<!-- Platforms -->
[![Host OS](https://github.com/padogrid/padogrid/wiki/images/padogrid-host-os.drawio.svg)](https://github.com/padogrid/padogrid/wiki/Platform-Host-OS) [![VM](https://github.com/padogrid/padogrid/wiki/images/padogrid-vm.drawio.svg)](https://github.com/padogrid/padogrid/wiki/Platform-VM) [![Docker](https://github.com/padogrid/padogrid/wiki/images/padogrid-docker.drawio.svg)](https://github.com/padogrid/padogrid/wiki/Platform-Docker) [![Kubernetes](https://github.com/padogrid/padogrid/wiki/images/padogrid-kubernetes.drawio.svg)](https://github.com/padogrid/padogrid/wiki/Platform-Kubernetes)

# Hazelcast Multi-Cluster Demo

This bundle demonstrates the Grafana capability to monitor three (3) Hazelcast clusters.

## Installing Bundle

```bash
install_bundle -download -workspace bundle-hazelcast-5-cluster-wan-app-granfana
```

## Use Case

Hazelcast provides a wealth of monitoring metrics that can be scraped by Prometheus to create Grafana dashboards that can rival the Hazelcast Management Center. In this bundle, we use PadoGrid's own dashboards to demonstrate the Grafana capabilities in a multi-cluster environment.

![Bundle Template Diagram](/images/bundle-template.jpg)

## Required Software

- PadoGrid 0.9.30+
- Hazelcast Enterprise 5.x

## Required Hardware

- Memory: 8 GB
- CPUs: 4

## Bundle Contents

```console
apps
├── grafana
├── perf_test_myhz
├── perf_test_wan1
└── perf_test_wan2

clusters
├── myhz
├── wan1
└── wan2

groups
└── wan
```

## Startup Sequence



## Teardown

```bash
stop_workspace -all
```

## References

1. *Hazelcast Grafana App*, Padogrid, <https://github.com/padogrid/padogrid/wiki/Hazelcast-Grafana-App>
1. *Hazelcast Kubernetes Helm Charts*, PadoGrid Bundles, <https://github.com/padogrid/bundle-hazelcast-3n4n5-k8s-kubectl_helm>
1. *Grafana*, GranfnaLabs, <https://grafana.com/>
1. *Prometheus*, Prometheus, <https://prometheus.io/>

---

![PadoGrid](https://github.com/padogrid/padogrid/raw/develop/images/padogrid-3d-16x16.png) [*PadoGrid*](https://github.com/padogrid) | [*Catalogs*](https://github.com/padogrid/catalog-bundles/blob/master/all-catalog.md) | [*Manual*](https://github.com/padogrid/padogrid/wiki) | [*FAQ*](https://github.com/padogrid/padogrid/wiki/faq) | [*Releases*](https://github.com/padogrid/padogrid/releases) | [*Templates*](https://github.com/padogrid/padogrid/wiki/Using-Bundle-Templates) | [*Pods*](https://github.com/padogrid/padogrid/wiki/Understanding-Padogrid-Pods) | [*Kubernetes*](https://github.com/padogrid/padogrid/wiki/Kubernetes) | [*Docker*](https://github.com/padogrid/padogrid/wiki/Docker) | [*Apps*](https://github.com/padogrid/padogrid/wiki/Apps) | [*Quick Start*](https://github.com/padogrid/padogrid/wiki/Quick-Start)
