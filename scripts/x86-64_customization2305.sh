#!/bin/bash

# AutoCore
cp -rf ../immortalwrt/package/emortal/autocore package/new/
# grant getCPUUsage access
sed -i 's|"getTempInfo"|"getTempInfo", "getCPUBench", "getCPUUsage"|g' package/new/autocore/files/generic/luci-mod-status-autocore.json

# UPNP
rm -rf ./feeds/luci/applications/luci-app-upnp
cp -rfv ../openwrt-luci/applications/luci-app-upnp feeds/luci/applications/luci-app-upnp
ln -sf ../../../feeds/luci/applications/luci-app-upnp ./package/feeds/luci/luci-app-upnp
rm -rf ./feeds/packages/net/miniupnpd
cp -rfv ../openwrt-packages/net/miniupnpd feeds/packages/net/miniupnpd

#Default IP
sed -i 's#192.168.1.1#192.168.0.1#g' package/base-files/files/bin/config_generate
#net.netfilter.nf_conntrack_max from 16384 to 65535
sed -i 's#net.netfilter.nf_conntrack_max=16384#net.netfilter.nf_conntrack_max=65535#g' package/kernel/linux/files/sysctl-nf-conntrack.conf

# default settings and translate
cp -rf ../default-settings package/new/lean-translate
mv -f package/new/lean-translate/Makefile2305 package/new/lean-translate/Makefile

ZZZ="package/new/lean-translate/files/zzz-default-settings"
# Modify machine name to OpenWrt-X86
sed -i "/uci commit system/i\uci set system.@system[0].hostname='OpenWrt-X86'" $ZZZ
# Customized name
sed -i "s/OpenWrt /Jinlife build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" $ZZZ

echo '
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_CHACHA20_X86_64=y
CONFIG_CRYPTO_POLY1305_X86_64=y
' >> ./target/linux/x86/64/config-5.15

exit 0
