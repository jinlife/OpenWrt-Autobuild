#!/bin/bash

# Access Control
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-accesscontrol package/new/luci-app-accesscontrol

# AdGuard Home
svn co https://github.com/Lienol/openwrt/trunk/package/diy/luci-app-adguardhome package/new/luci-app-adguardhome

# AutoCore
cp -rf ../autocore package/new/autocore

# automount
#rm -rf ./feeds/packages/kernel/exfat-nofuse
#svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/automount package/new/automount
#svn co https://github.com/openwrt/packages/trunk/utils/antfs-mount package/utils/antfs-mount
#svn co https://github.com/openwrt/packages/trunk/kernel/antfs package/kernel/antfs
#svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-19.07/package/kernel/exfat package/kernel/exfat
# autosamba
#svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/autosamba package/new/autosamba

# arpbind
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-arpbind package/new/luci-app-arpbind

# DDNS
rm -rf ./feeds/packages/net/ddns-scripts
rm -rf ./feeds/luci/applications/luci-app-ddns
#svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ddns-scripts_aliyun package/new/ddns-scripts_aliyun
#svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ddns-scripts_dnspod package/new/ddns-scripts_dnspod
svn co https://github.com/openwrt/packages/branches/openwrt-18.06/net/ddns-scripts feeds/packages/net/ddns-scripts
svn co https://github.com/openwrt/luci/branches/openwrt-18.06/applications/luci-app-ddns feeds/luci/applications/luci-app-ddns

# Filetransfer
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-filetransfer package/new/luci-app-filetransfer
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-lib-fs package/new/luci-lib-fs

# frp
#rm -f ./feeds/luci/applications/luci-app-frps
#rm -f ./feeds/luci/applications/luci-app-frpc
#rm -rf ./feeds/packages/net/frp
#rm -f ./package/feeds/packages/frp
#git clone -b master --depth 1 --single-branch https://github.com/kuoruan/luci-app-frpc.git package/new/luci-app-frpc
#git clone -b master --depth 1 --single-branch https://github.com/lwz322/luci-app-frps.git package/new/luci-app-frps
#svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/frp package/new/frp

# FullCone
svn co https://github.com/Lienol/openwrt/trunk/package/network/fullconenat package/new/openwrt-fullconenat
wget -P target/linux/generic/hack-4.14/ https://raw.githubusercontent.com/Lienol/openwrt/19.07/target/linux/generic/hack-4.14/952-net-conntrack-events-support-multiple-registrant.patch
pushd feeds/luci
cat ../../../patches/fullconenat-luci.patch | git apply
popd
mkdir -p package/network/config/firewall/patches
wget -P package/network/config/firewall/patches/ https://raw.githubusercontent.com/Lienol/openwrt/19.07/package/network/config/firewall/patches/fullconenat.patch

# IPv6 helper
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ipv6-helper package/new/ipv6-helper

# IPSEC
#svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-ipsec-vpnd package/new/luci-app-ipsec-vpnd
# OpenAppFilter
#git clone -b master --depth 1 --single-branch https://github.com/destan19/OpenAppFilter.git package/new/OpenAppFilter
# OpenClash
#git clone -b master --depth 1 --single-branch https://github.com/vernesong/OpenClash package/new/luci-app-openclash

rm -rf feeds/packages/libs/libcap
svn co https://github.com/openwrt/packages/branches/openwrt-21.02/libs/libcap feeds/packages/libs/libcap
# Passwall
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall package/new/luci-app-passwall
rm -rf ./feeds/packages/net/kcptun
rm -rf ./feeds/packages/net/shadowsocks-libev
rm -rf ./feeds/packages/net/xray-core
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/brook package/new/brook
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/chinadns-ng package/new/chinadns-ng
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/dns2socks package/new/dns2socks
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/ipt2socks package/new/ipt2socks
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/kcptun package/new/kcptun
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/microsocks package/new/microsocks
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/naiveproxy package/new/naiveproxy
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/pdnsd-alt package/new/pdnsd
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/simple-obfs package/new/simple-obfs
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/tcping package/new/tcping
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-go package/new/trojan-go
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-plus package/new/trojan-plus
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/shadowsocks-rust package/new/shadowsocks-rust
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/shadowsocksr-libev package/new/shadowsocksr-libev
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/v2ray-plugin package/new/v2ray-plugin
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/xray-core package/new/xray-core
svn co https://github.com/coolsnowwolf/packages/trunk/net/shadowsocks-libev package/new/shadowsocks-libev

# Realtek RTL8811CU/RTL8821CU
# svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-19.07/package/ctcgfw/rtl8821cu package/new/rtl8821cu
# Realtek RTL8812AU/21AU
# svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-19.07/package/ctcgfw/rtl8812au-ac package/new/rtl8812au-ac
# Realtek 8812BU/8822BU
# svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-19.07/package/ctcgfw/rtl88x2bu package/new/rtl88x2bu
# SeverChan
#git clone -b master --depth 1 --single-branch https://github.com/tty228/luci-app-serverchan.git package/new/luci-app-serverchan

# Scheduled Reboot
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-autoreboot package/new/luci-app-autoreboot

# Traffic Usage Monitor
git clone -b master --depth 1 --single-branch https://github.com/brvphoenix/wrtbwmon package/new/wrtbwmon
git clone -b master --depth 1 --single-branch https://github.com/brvphoenix/luci-app-wrtbwmon package/new/luci-app-wrtbwmon

# UPNP
rm -rf ./feeds/packages/net/miniupnpd
svn co https://github.com/coolsnowwolf/packages/trunk/net/miniupnpd feeds/packages/net/miniupnpd

# upx & ucl
svn co https://github.com/coolsnowwolf/lede/trunk/tools/ucl tools/ucl
svn co https://github.com/coolsnowwolf/lede/trunk/tools/upx tools/upx
sed -i '/builddir dependencies/i\tools-y += ucl upx' tools/Makefile
sed -i '/builddir dependencies/a\$(curdir)/upx/compile := $(curdir)/ucl/compile' tools/Makefile

# USB Printer
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-usb-printer package/new/luci-app-usb-printer
# vlmcsd
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-19.07/package/lean/luci-app-vlmcsd package/new/luci-app-vlmcsd
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/vlmcsd package/lean/vlmcsd
# xlnetacc
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-xlnetacc package/new/luci-app-xlnetacc

# Zerotier
#svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-19.07/package/lean/luci-app-zerotier package/new/luci-app-zerotier
# zram-swap
#rm -rf package/system/zram-swap
#svn co https://github.com/openwrt/openwrt/trunk/package/system/zram-swap package/system/zram-swap

# Ram free
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-ramfree package/new/luci-app-ramfree
# Edge Theme
git clone -b master https://github.com/garypang13/luci-theme-edge.git package/new/luci-theme-edge
# poweroff
git clone -b master https://github.com/esirplayground/luci-app-poweroff package/new/luci-app-poweroff
# Socat IPv6 to IPv4
svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-socat package/new/luci-app-socat

# Add r8125 realtek network card driver
# svn co https://github.com/Lienol/openwrt/branches/19.07/package/kernel/r8125 package/new/r8125
# svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/r8125 package/new/r8125
cp -rf ../r8125 package/new/r8125

# svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/r8152 package/new/r8152
svb co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/kernel/r8152 package/new/r8152

#Default IP
sed -i 's#192.168.1.1#192.168.0.1#g' package/base-files/files/bin/config_generate
#net.netfilter.nf_conntrack_max
sed -i 's#net.netfilter.nf_conntrack_max=16384#net.netfilter.nf_conntrack_max=65535#g' package/kernel/linux/files/sysctl-nf-conntrack.conf

# default settings and translate
cp -rf ../default-settings package/new/lean-translate

ZZZ="package/new/lean-translate/files/zzz-default-settings"
# Modify machine name to OpenWrt-X86
sed -i "/uci commit system/i\uci set system.@system[0].hostname='OpenWrt-X86'" $ZZZ
# Customized name
sed -i "s/OpenWrt /Jinlife build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" $ZZZ

echo '
CONFIG_CRYPTO_CHACHA20_X86_64=y
CONFIG_CRYPTO_POLY1305_X86_64=y
' >> ./target/linux/x86/64/config-4.14

exit 0