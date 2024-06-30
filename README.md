# Cyanforge
_An open-source utility to build simulation cores_


### Join VisorFolks Community Forum
Connect with us over VisorFolks discord server
<a href="https://discord.gg/gxUQr77MT2"> <img align="center" alt="VisorFolks Discord Server" width="30px" src="https://discord.com/assets/3437c10597c1526c3dbd98c737c2bcae.svg" /> </a>

### Getting Started
Currently, this framework support ibex core. The sources for core are fetched while performing the build.

To check the available cores to build, run:
```shell
make list
```

To fetch the ibex-core sources, run:
```shell
make get_ibex
```

To build the core of your choice, run:
```shell
make <core-name>	# core name can be obtained from above list
```

To verilate the core, run:
```shell
make <core-name> verilator VARGS=<VERILATOR ARGS>
```

To clean the build, run:
```shell
make clean
```
