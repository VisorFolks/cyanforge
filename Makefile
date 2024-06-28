# MIT License
# Copyrights (c) 2024, VisorFolks Team
#
# File Name		: Makefile
# Description		: Framework Build wrapper
# Primary Author	: Akash Kollipara [akashkollipara@gmail.com]
# Organisation		: VisorFolks
#

SHELL		:= /bin/bash
N_JOBS		?= $(shell grep -c ^processor /proc/cpuinfo)
V		?= 0

include mk/path.mk
include mk/tools.mk
include mk/cores.mk

ifneq ($(V),1)
.SILENT:
endif
