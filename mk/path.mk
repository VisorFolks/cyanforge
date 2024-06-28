#
# MIT License
# Copyrights (c) 2024, VisorFolks Team
#
# File Name		: path.mk
# Description		: This file defines standard variables used
#			  in cyanforge build system
# Primary Author	: Akash Kollipara [akashkollipara@gmail.com]
# Organisation		: VisorFolks
#

#*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.#
#------------< Paths >-------------#
#*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.#

CF_ROOT		:= $(abspath .)
TOOLS_ROOT	?= $(abspath $(CF_ROOT))/tools

OUT_PATH	?= $(CF_ROOT)/out
OUT		?= $(OUT_PATH)/$(CORE)

GET_PATH	= $(patsubst %/,%,$(dir $(lastword $(MAKEFILE_LIST))))

$(OUT)/%/:
	mkdir -p $@
