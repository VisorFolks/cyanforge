#
# MIT License
# Copyrights (c) 2024, VisorFolks Team
#
# File Name		: ibex_builder.mk
# Description		: This file provides receipes for building
#			  ibex core verilator
# Primary Author	: Akash Kollipara [akashkollipara@gmail.com]
# Organisation		: VisorFolks
#

IBEX_MAKE	:= $(OUT)/sim-verilator/Makefile
IBEX_VERILATOR	:= $(dir $(IBEX_MAKE))/V$(IBEX_SYSTEM)

ACT_PYENV	:= source $(CF_ROOT)/tools/pyenv/bin/activate

FUSESOC_FLAGS	:= --cores-root $(CF_ROOT)/core-framework/ibex
FUSESOC_FLAGS	+= run --target=$(TARGET) --setup
FUSESOC_FLAGS	+= --build-root $(OUT)
FUSESOC_FLAGS	+= lowrisc:ibex:$(IBEX_SYSTEM)

.SECONDEXPANSION:
$(IBEX_MAKE): get_ibex | $$(@D)/
	$(ACT_PYENV) && fusesoc $(FUSESOC_FLAGS) $(shell ./core-framework/ibex/util/ibex_config.py --config_filename ./core-framework/ibex/ibex_configs.yaml $(IBEX_CONFIG) fusesoc_opts)

$(IBEX_VERILATOR): $(IBEX_MAKE)
	make -C $(@D) -j $(N_JOBS)

$(CORE)_verilator:
ifeq ($(realpath $(IBEX_VERILATOR)),)
	$(error < x > Please Build system first.)
endif
	mkdir -p $(CF_ROOT)/logs/
	cd $(CF_ROOT)/logs/ &&		\
	$(IBEX_VERILATOR) $(VARGS)

