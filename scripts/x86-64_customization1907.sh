#!/bin/bash

# AutoCore
# Commits on Feb 19, 2022 https://github.com/immortalwrt/immortalwrt/tree/1572743ad6e3c60cb088e47c769c17269caf2b38/package/emortal/autocore
cp -rf ../autocore package/new/autocore

# For 1907 passwall and miniupnp
rm -rf feeds/packages/libs/libcap
rm -rf feeds/packages/libs/libcap-ng
svn export https://github.com/openwrt/packages/branches/openwrt-21.02/libs/libcap feeds/packages/libs/libcap
ln -sf ../../../feeds/packages/libs/libcap ./package/feeds/packages/libcap
svn export https://github.com/openwrt/packages/branches/openwrt-21.02/libs/libcap-ng feeds/packages/libs/libcap-ng
ln -sf ../../../feeds/packages/libs/libcap-ng ./package/feeds/packages/libcap-ng

# Openwrt 19.07
#pushd target/linux/generic/hack-4.14
#wget https://github.com/immortalwrt/immortalwrt/raw/openwrt-18.06/target/linux/generic/hack-4.14/953-net-patch-linux-kernel-to-support-shortcut-fe.patch
#popd

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
