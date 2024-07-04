<h1>
  <div align="center">
    <a href="https://github.com/VisorFolks/cyanforge">
      <img align="top" src="https://github.com/VisorFolks/vf_artifacts/blob/stable/cyanforge/icons/cyanforge.png"
           alt="Cyanforge"/>
    </a>
  </div>
</h1>
<body>
  <div align="center">
    <i>An open-source utility to build and simulate cores ...</i><br>
    </div>
</body>

[![Discord](https://img.shields.io/discord/859140196498014238?style=flat&logo=discord&logoSize=auto&label=VF%20Server)](https://discord.gg/gxUQr77MT2)

### Getting Started
Currently, this framework support ibex core. The sources for core are fetched while performing the build.

Install pre-requisites [OS: Ubuntu]:
```shell
sudo apt install verilator gtkwave build-essential python3 python3-pip python3-venv libelf-dev srecord
```

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
