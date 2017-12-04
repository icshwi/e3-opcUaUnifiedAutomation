

where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

include $(REQUIRE_TOOLS)/driver.makefile

APP:=opcUaDevSupApp
APPSRC:=$(APP)

#USR_CFLAGS   += -fno-strict-aliasing
#USR_CPPFLAGS += -fno-strict-aliasing
USR_CFLAGS += -fPIC

UASDK_LIBS = uabase uaclient uapki uastack xmlparser

USR_INCLUDES += -I$(where_am_I)$(APPSRC)

USR_INCLUDES += $(foreach module, $(UASDK_LIBS), -I$(UASDK)/include/$(module))

USR_LDFLAGS += -L $(UASDK_DIR)
USR_LDFLAGS += -luastack
#USR_LDFLAGS += -luastackd
#USR_LDFLAGS  += $(foreach module, $(UASDK_LIBS), -l$(module) -l$(module)d)
USR_LDFLAGS += -Wl,-rpath=$(UASDK_DIR)


#TEMPLATES += $(wildcard $(APPDB)/*.template)

DBDS      += $(APPSRC)/opcUa.dbd

HEADERS   += $(APPSRC)/devOpcUa.h
HEADERS   += $(APPSRC)/drvOpcUa.h
HEADERS   += $(APPSRC)/devUaSubscription.h 

SOURCES   += $(APPSRC)/devOpcUa.c
SOURCES   += $(APPSRC)/drvOpcUa.cpp
SOURCES   += $(APPSRC)/devUaSubscription.cpp


