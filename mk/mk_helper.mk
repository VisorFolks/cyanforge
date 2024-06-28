#
# MIT License
# Copyrights (c) 2024, VisorFolks Team
#
# File Name		: mk_helper.mk
# Description		: This file defines make helper utilities
# Primary Author	: Akash Kollipara [akashkollipara@gmail.com]
# Organisation		: VisorFolks
#

#*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.#
#-----------< Helpers >------------#
#*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.#

define check_config_and_include
ifeq ($(realpath $(1)),)
$$(info < ! > Invalid $(2) ...)
$$(error < x > Stopping Build !)
endif
include $(realpath $(1))
endef
