#############################################################
#
# ts7500utils
#
#############################################################
TS7500UTILS_VERSION = 1.0
TS7500UTILS_SOURCE = ts7500utils-$(TS7500UTILS_VERSION).tar.gz
TS7500UTILS_SITE = http://www.embeddedarm.com

define TS7500UTILS_BUILD_CMDS
    $(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) STRIP=$(TARGET_STRIP) -C $(@D) all
endef
define TS7500UTILS_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/ts7500ctl $(TARGET_DIR)/sbin
    $(INSTALL) -D -m 0755 $(@D)/xuartctl $(TARGET_DIR)/usr/sbin
    $(INSTALL) -D -m 0755 $(@D)/sdctl $(TARGET_DIR)/usr/sbin
    $(INSTALL) -D -m 0755 $(@D)/dio $(TARGET_DIR)/usr/sbin
    $(INSTALL) -D -m 0755 $(@D)/spiflashctl $(TARGET_DIR)/usr/sbin
endef

$(eval $(call $(eval $(generic-package)),package,ts7500utils))
