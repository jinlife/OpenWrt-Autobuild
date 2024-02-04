#!/bin/bash

# AutoCore
cp -rfv ../immortalwrt/package/emortal/autocore package/new/
# grant getCPUUsage access
sed -i 's|"getTempInfo"|"getTempInfo", "getCPUBench", "getCPUUsage"|g' package/new/autocore/files/generic/luci-mod-status-autocore.json

#Default IP
sed -i 's#192.168.1.1#192.168.0.1#g' package/base-files/files/bin/config_generate
#net.netfilter.nf_conntrack_max from 16384 to 65535
sed -i 's#net.netfilter.nf_conntrack_max=16384#net.netfilter.nf_conntrack_max=65535#g' package/kernel/linux/files/sysctl-nf-conntrack.conf

# default settings and translate
cp -rf ../default-settings package/new/lean-translate

ZZZ="package/new/lean-translate/files/zzz-default-settings"
# Modify machine name to OpenWrt-X86
sed -i "/uci commit system/i\uci set system.@system[0].hostname='OpenWrt-X86'" $ZZZ
# Customized name
sed -i "s/OpenWrt /Jinlife build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" $ZZZ

# mbedtls
cp -v ../patches/201-Camellia-block-cipher.patch package/libs/mbedtls/patches/

echo '
CONFIG_CRYPTO_CHACHA20_X86_64=y
CONFIG_CRYPTO_POLY1305_X86_64=y
' >> ./target/linux/x86/64/config-5.4

exit 0
