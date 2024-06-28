# MIT License
# Copyrights (c) 2024, VisorFolks Team
#
# File Name		: core_fw_get.mk
# Description		: Fetches various core framework
# Primary Author	: Akash Kollipara [akashkollipara@gmail.com]
# Organisation		: VisorFolks
#

IBEX_REPO	:= https://github.com/lowRISC/ibex.git
IBEX_PATH	:= $(CF_ROOT)/core-framework/ibex/
IBEX_PYENV	:= $(TOOLS_ROOT)/pyenv/
ACT_PYENV	:= source $(CF_ROOT)/tools/pyenv/bin/activate

T_ALLOWLIST	+= get_ibex


get_ibex: $(IBEX_PATH) $(IBEX_PYENV)

$(IBEX_PATH):
	$(info < ! > Fetching ibex ...)
	$(info < ? > Please be patient as this might take a while ...)
	mkdir -p $@
	cd $(CF_ROOT)/core-framework && git clone $(IBEX_REPO)
	@echo "< / > Done !"

$(IBEX_PYENV):
	@echo "< ! > Preparing environment ..."
	mkdir -p tools
	cd tools && python3 -m venv pyenv
	$(ACT_PYENV) && pip3 install -r $(CF_ROOT)/core-framework/ibex/python-requirements.txt > /dev/null
	@echo "< ! > Done!"
