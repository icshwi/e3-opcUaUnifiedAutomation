#
#  Copyright (c) 2017 - Present  European Spallation Source ERIC
#
#  The program is free software: you can redistribute
#  it and/or modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation, either version 2 of the
#  License, or any newer version.
#
#  This program is distributed in the hope that it will be useful, but WITHOUT
#  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
#  more details.
#
#  You should have received a copy of the GNU General Public License along with
#  this program. If not, see https://www.gnu.org/licenses/gpl-2.0.txt
#
# Author  : Jeong Han Lee
# email   : han.lee@esss.se
# Date    : Monday, December  4 17:10:28 CET 2017
# version : 0.0.1

where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

include $(REQUIRE_TOOLS)/driver.makefile

APP:=opcUaDevSupApp
APPSRC:=$(APP)

USR_CFLAGS   += -fno-strict-aliasing
USR_CPPFLAGS += -fno-strict-aliasing


UASDK_INCS += uabase
UASDK_INCS += uaclient
UASDK_INCS += uamodels
UASDK_INCS += uapki
UASDK_INCS += uastack
UASDK_INCS += xmlparser

USR_INCLUDES += $(foreach mod, $(UASDK_INCS),  -I$(UASDK)/include/$(mod))


UASDK_LIBS += coremodule
UASDK_LIBS += uaclient
UASDK_LIBS += uabase
UASDK_LIBS += uapki
UASDK_LIBS += uastack
UASDK_LIBS += xmlparser

ifeq ($(UASDK_DEPLOY_MODE),PROVIDED)
define UA_template
  USR_LIBS += $(1)
  $(1)_DIR = $(UASDK_DIR)
endef
$(foreach lib, $(UASDK_LIBS), $(eval $(call UA_template,$(lib))))
endif

USR_LIBS += boost_regex
USR_LIBS += readline
USR_LIBS += xml2

DBDS      += $(APPSRC)/opcUa.dbd

HEADERS   += $(APPSRC)/devOpcUa.h
HEADERS   += $(APPSRC)/drvOpcUa.h


SOURCES   += $(APPSRC)/devUaSubscription.cpp
SOURCES   += $(APPSRC)/drvOpcUa.cpp
SOURCES   += $(APPSRC)/devOpcUa.c


