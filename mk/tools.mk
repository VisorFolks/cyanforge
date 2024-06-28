#
# MIT License
# Copyrights (c) 2024, VisorFolks Team
#
# File Name		: tools.mk
# Description		: This file defines variables for tools
# Primary Author	: Akash Kollipara [akashkollipara@gmail.com]
# Organisation		: VisorFolks
#

VERILATOR	:= $(shell which verilator)

ifeq ($(VERILATOR),)
$(info < ! > Verilator is not installed ...)
$(info < ! > Please install with `sudo apt install verilator`)
$(error < x > Stopping Sim Build)
endif
