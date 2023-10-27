![PadoGrid](https://github.com/padogrid/padogrid/raw/develop/images/padogrid-3d-16x16.png) [*PadoGrid*](https://github.com/padogrid) | [*Catalogs*](https://github.com/padogrid/catalog-bundles/blob/master/all-catalog.md) | [*Manual*](https://github.com/padogrid/padogrid/wiki) | [*FAQ*](https://github.com/padogrid/padogrid/wiki/faq) | [*Releases*](https://github.com/padogrid/padogrid/releases) | [*Templates*](https://github.com/padogrid/padogrid/wiki/Using-Bundle-Templates) | [*Pods*](https://github.com/padogrid/padogrid/wiki/Understanding-Padogrid-Pods) | [*Kubernetes*](https://github.com/padogrid/padogrid/wiki/Kubernetes) | [*Docker*](https://github.com/padogrid/padogrid/wiki/Docker) | [*Apps*](https://github.com/padogrid/padogrid/wiki/Apps) | [*Quick Start*](https://github.com/padogrid/padogrid/wiki/Quick-Start)

---

<!-- Platforms -->
[![Host OS](https://github.com/padogrid/padogrid/wiki/images/padogrid-host-os.drawio.svg)](https://github.com/padogrid/padogrid/wiki/Platform-Host-OS) [![VM](https://github.com/padogrid/padogrid/wiki/images/padogrid-vm.drawio.svg)](https://github.com/padogrid/padogrid/wiki/Platform-VM) [![Docker](https://github.com/padogrid/padogrid/wiki/images/padogrid-docker.drawio.svg)](https://github.com/padogrid/padogrid/wiki/Platform-Docker) [![Kubernetes](https://github.com/padogrid/padogrid/wiki/images/padogrid-kubernetes.drawio.svg)](https://github.com/padogrid/padogrid/wiki/Platform-Kubernetes)

# Hazelcast Multi-Cluster Demo

This bundle demonstrates Grafana capabilities of monitoring four (4) Hazelcast clusters.

## Installing Bundle

```bash
install_bundle -download -workspace bundle-hazelcast-5-cluster-wan-app-granfana
```

## Use Case

Hazelcast provides a wealth of monitoring metrics that can be scraped by Prometheus to create Grafana dashboards that can rival the Hazelcast Management Center. In this bundle, we use PadoGrid's own Grafana dashboards to demonstrate the ease of monitoring multi-clusters.

![Bundle Template Diagram](/images/bundle-template.jpg)

## Required Software

- PadoGrid 0.9.30+
- Hazelcast
  - Full Demo: Enterprise 5.x
  - Partial Demo: OSS 5.x (WAN not demonstrable)
- Grafana 10.x
- Prometheus 2.x

## Required Hardware

- Memory per cluster: 3 GB
  - There are a total of four (4) clusters. You can run any number of clusters.
  - 4 clusters: 12 GB
- CPUs: 4

## Bundle Contents

```console
apps
├── grafana
├── perf_test_myhz1
├── perf_test_myhz2
├── perf_test_wan1
└── perf_test_wan2

clusters
├── myhz1
├── myhz2
├── wan1
└── wan2

groups
├── myhz
└── wan
```

## Installation Steps

Install Prometheus and Grafana. Make sure you have installed PadoGrid 0.9.30 or a later version.

```bash
install_padogrid -product prometheus
install_padogrid -product grafana
update_products -product prometheus
update_products -product grafana
```

## Used Ports

The following ports are used by this demo.

- Grafana: 3000
- Prometheus: 9090
- Hazelcast
  - `myhz1`: [5601-5620], [8191-8200], [9301-9320], [12101-12120]
  - `myhz2`: [5701-5720], [8291-8300], [9401-9420], [12201-12220]
  - `wan1`: [5801-5820], [8391-8400], [9501-9520], [12301-12320]
  - `wan2`: [5901-5920], [8491-8500], [9601-9620], [12401-12420]

## Startup Sequence

### 1. Start all clusters in the workspace.

```bash
start_workspace
```

There are four (4) clusters: `myhz1`, `myhz2`, `wan1`, and `wan2`.

The `myhz1` and `myhz2` clusters are not configured with WAN. If you are running Hazelcast OSS, then you are limited to these two cluster for this demo.

The `wan1` and `wan2` clusters are configured with bi-directional WAN replication. These clusters require Hazelcast Enterprise.

### 2. Open Grafana in the browser.

Grafana URL: <http://localhost:3000>

From the browser, add the Prometheus datasource if it does not exist.

- Select *Connections/Add new connection* from the left pane.
- Search and add `Promtheus` from the *Add new connection* page.
- Enter the following

  Prometheus server URL: <http://localhost:9090>
- Select *Save & test* at the bottom

Open the **00Main** dashboard.

- Select *Dashboards* from the left pane.
- Select *Hazelcast*.
- Select **00Main**.

The **00Main** dashboard is the main (home) dashboard that provides a menu of all available dashaboards.

## Using Hazelcast Dashboards

The main dashboard is organized similar to the Management Center.

The left pane contains menu items for cluster members, WAN, storage, stream processing, computing, messaging, and CP subsystem. You can drill down to individual menu items by clicking on them.

The toolbar contains the menu for switching cluster, opening the system dashboard, and directly selecting any of the Hazelcast dashboards.

Each dashboard's toolbar caontains the *Main* menu item for quickly returning to the main dashboard.

The **System** dashboard tabulates member status and provides two rows of panels: *Aggreates* and *Per Member*. The Aggregates row contains panels for monitoring aggreated metrics. The Per Member row contains panels for monitoring individual members.

The **Member** dashboard provides two (2) rows of panels: *Resources* and *Data Structures*. The Resources row contains panels for monitoring the selected member's system resources. The Data Structures row contains panels for monitoring the data strcutures that belong to the selected member. You can switch to another member using the *Member* pulldown menu in the toolbar.

### 4. Ingest Data

There are four (4) `perf_test` apps included in the bundle. Each app targets their respective cluster for ingesting data.

To ingest data into all data structures, run the `ingest_all` script from each app's `bin_sh` directory as follows.

```bash
# myhz1
cd_app perf_test_myhz1/bin_sh
./ingest_all

# myhz2
cd_app perf_test_myhz2/bin_sh
./ingest_all

# wan1
cd_app perf_test_wan1/bin_sh
./ingest_all

# wan2
cd_app perf_test_wan2/bin_sh
```

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
