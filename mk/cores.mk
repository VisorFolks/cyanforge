#
# MIT License
# Copyrights (c) 2024, VisorFolks Team
#
# File Name		: cores.mk
# Description		: This scipt helps the build system in searching
#			  core name from command arguments
# Primary Author	: Akash Kollipara [akashkollipara@gmail.com]
# Organisation		: VisorFolks
#

#*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*#
#------------< Core Search >-------------#
#*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*#

include mk/mk_helper.mk
include mk/core_fw_get.mk

P_TARGETS	+= default verilator
T_ALLOWLIST	+= list clean all_cores
CORE_LIST	:= $(shell ls cores/ -I *.template -I *.src)

.PHONY: aux_target

default: --cyanforge

all_cores:
	for core in $(CORE_LIST);	\
	do				\
		make $$core;		\
	done

clean:
	$(info < ! > Removing $(CORE) builds ...)
	rm -rf $(OUT)

list:
	$(info Available cores are :)
	echo $(CORE_LIST)

verilator: --verilate

ifeq ($(findstring $(MAKECMDGOALS),$(T_ALLOWLIST)),)
ifeq ($(findstring $(firstword $(MAKECMDGOALS)),$(P_TARGETS)),)
CORE		?= $(firstword $(MAKECMDGOALS))
CMD		:= $(word 2,$(MAKECMDGOALS))
ifeq ($(CMD),)
CMD		:= default
endif

$(CORE): $(CMD)

endif

ifeq ($(CORE),)
$(info < x > Core name was not specified...)
$(info < ! > Please try running `make help` for more details)
$(error < x > Build Failed!)
else ifeq ($(filter $(CORE), $(shell ls cores)),)
$(info < x > Invalid core name...)
$(info < ! > Run `make list` to get list of cores)
$(error < x > Build Failed!)
endif

$(eval $(call check_config_and_include,$(CF_ROOT)/cores/$(CORE)))
include mk/path.mk
$(eval $(call check_config_and_include,$(CF_ROOT)/mk/$(CORE_FRAMEWORK)_builder.mk))
--verilate: $(CORE)_verilator

endif

.SECONDEXPANSION:
--cyanforge: $$(IBEX_VERILATOR)
	$(info < / > Done !)

