#
# Copyright (C) 2020 TDT AG <development@tdt.de>
#
# This is free software, licensed under the GNU General Public License v2.
# See https://www.gnu.org/licenses/gpl-2.0.txt for more information.
#

BASE_DIR=$(shell pwd)

default: help

help:
	@echo "Build perl App::Iptables2Dot"

build-init:
	git submodule init

build-deb:
	mkdir -p $(BASE_DIR)/build/deb
	cd $(BASE_DIR)/build/deb; \
		dh-make-perl --build --cpan App::Iptables2Dot
	@echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
	@echo "Debian package is located in directory $(BASE_DIR)/build/deb"
	@echo "If you want to use App::Iptables2Dot you have to install the deb package"

filter:
	$(BASE_DIR)/scripts/iptables2dot \
		filter \
		$(BASE_DIR) \
		$(REMOTE)

nat:
	$(BASE_DIR)/scripts/iptables2dot \
		nat \
		$(BASE_DIR) \
		$(REMOTE)

mangle:
	$(BASE_DIR)/scripts/iptables2dot \
		mangle \
		$(BASE_DIR) \
		$(REMOTE)

clean:
	rm -rf $(BASE_DIR)/build

.PHONY: help build-init build-deb filter nat mangle clean
