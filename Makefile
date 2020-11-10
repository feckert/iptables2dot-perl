#
# Copyright (C) 2020 TDT AG <development@tdt.de>
#
# This is free software, licensed under the GNU General Public License v2.
# See https://www.gnu.org/licenses/gpl-2.0.txt for more information.
#

BASE_DIR=$(shell pwd)

default: help

help:
	@echo "This is a help"

build-init:
	git submodule init

build-deb:


filter:
	$(BASE_DIR)/scripts/iptables2dot \
		filter \
		$(BASE_DIR)

nat:
	$(BASE_DIR)/scripts/iptables2dot \
		nat \
		$(BASE_DIR)

mangle:
	$(BASE_DIR)/scripts/iptables2dot \
		mangle \
		$(BASE_DIR)

clean:
	rm -rf $(BASE_DIR)/build

.PHONY: help build-init build-deb filter nat mangle clean
