#!/bin/bash

rm-rf ../immortalwrt

# For 1907 passwall and miniupnp
rm -rf feeds/packages/libs/libcap
rm -rf feeds/packages/libs/libcap-ng
svn export https://github.com/openwrt/packages/branches/openwrt-21.02/libs/libcap feeds/packages/libs/libcap
ln -sf ../../../feeds/packages/libs/libcap ./package/feeds/packages/libcap
svn export https://github.com/openwrt/packages/branches/openwrt-21.02/libs/libcap-ng feeds/packages/libs/libcap-ng
ln -sf ../../../feeds/packages/libs/libcap-ng ./package/feeds/packages/libcap-ng

# Edge Theme
git clone -b master https://github.com/kiddin9/luci-theme-edge.git package/new/luci-theme-edge

# poweroff
git clone -b master https://github.com/esirplayground/luci-app-poweroff package/new/luci-app-poweroff
# Socat IPv6 to IPv4
svn export https://github.com/Lienol/openwrt-package/trunk/luci-app-socat package/new/luci-app-socat

# Add r8125 realtek network card driver
# svn export https://github.com/Lienol/openwrt/branches/19.07/package/kernel/r8125 package/new/r8125
# svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/r8125 package/new/r8125
cp -rf ../r8125 package/new/r8125

#svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06/package/kernel/r8152 package/new/r8152
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/r8152 package/new/r8152

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
cp -f ../patches/201-Camellia-block-cipher.patch package/libs/mbedtls/patches/

echo '
CONFIG_CRYPTO_CHACHA20_X86_64=y
CONFIG_CRYPTO_POLY1305_X86_64=y
' >> ./target/linux/x86/64/config-4.14

exit 0
