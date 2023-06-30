#!/bin/bash

# Access Control
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-accesscontrol feeds/luci/applications/luci-app-accesscontrol
ln -sf ../../../feeds/luci/applications/luci-app-accesscontrol ./package/feeds/luci/luci-app-accesscontrol

# ADBYBY Plus +
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-adbyby-plus feeds/luci/applications/luci-app-adbyby-plus
ln -sf ../../../feeds/luci/applications/luci-app-adbyby-plus ./package/feeds/luci/luci-app-adbyby-plus
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/adbyby package/new/adbyby

# iKoolproxy
git clone https://github.com/yaof-project/luci-app-ikoolproxy.git package/new/luci-app-ikoolproxy

# turboacc
#svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-turboacc feeds/luci/applications/luci-app-turboacc
svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-turboacc feeds/luci/applications/luci-app-turboacc
ln -sf ../../../feeds/luci/applications/luci-app-turboacc ./package/feeds/luci/luci-app-turboacc

# arpbind
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-arpbind feeds/luci/applications/luci-app-arpbind
ln -sf ../../../feeds/luci/applications/luci-app-arpbind ./package/feeds/luci/luci-app-arpbind

# automount
cp -rv ../immortalwrt/package/emortal/automount package/new/automount

# cpufreq
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-cpufreq feeds/luci/applications/luci-app-cpufreq
ln -sf ../../../feeds/luci/applications/luci-app-cpufreq ./package/feeds/luci/luci-app-cpufreq

# Filetransfer
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-filetransfer feeds/luci/applications/luci-app-filetransfer
ln -sf ../../../feeds/luci/applications/luci-app-filetransfer ./package/feeds/luci/luci-app-filetransfer
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/libs/luci-lib-fs feeds/luci/libs/luci-lib-fs
ln -sf ../../../feeds/luci/libs/luci-lib-fs ./package/feeds/luci/luci-lib-fs

# FullCone
cp -rv ../immortalwrt/package/network/utils/fullconenat package/network/utils/fullconenat
cp -v ../immortalwrt/target/linux/generic/hack-5.4/952-net-conntrack-events-support-multiple-registrant.patch target/linux/generic/hack-5.4/
patch -d feeds/luci -p1 -i ../../../patches/fullconenat-luci.patch
cp -rv ../immortalwrt/package/network/config/firewall/patches package/network/config/firewall/

# Release Ram
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-ramfree feeds/luci/applications/luci-app-ramfree
ln -sf ../../../feeds/luci/applications/luci-app-ramfree ./package/feeds/luci/luci-app-ramfree

# Scheduled Reboot
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-autoreboot feeds/luci/applications/luci-app-autoreboot
ln -sf ../../../feeds/luci/applications/luci-app-autoreboot ./package/feeds/luci/luci-app-autoreboot

# Passwall
cp -rf ../luci-app-passwall feeds/luci/applications/luci-app-passwall
ln -sf ../../../feeds/luci/applications/luci-app-passwall ./package/feeds/luci/luci-app-passwall

svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/brook package/new/brook
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/chinadns-ng package/new/chinadns-ng
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/trojan-go package/new/trojan-go
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/trojan-plus package/new/trojan-plus
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/v2ray-core package/new/v2ray-core

# Shared for PassWall and ShadowsocksR Plus+
rm -rf ./feeds/packages/net/kcptun
rm -rf ./feeds/packages/net/xray-core
rm -rf ./feeds/packages/net/shadowsocks-libev
svn export https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/new/luci-app-ssr-plus
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/dns2socks package/new/dns2socks
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/ipt2socks package/new/ipt2socks
# Fix hash issue
sed -i "s/73a2498dc95934c225d358707e7f7d060b5ce81aa45260ada09cbd15207d27d1/5279eb1cb7555cf9292423cc9f672dc43e6e214b3411a6df26a6a1cfa59d88b7/g" package/new/ipt2socks/Makefile

svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/kcptun package/new/kcptun
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/microsocks package/new/microsocks
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/pdnsd-alt package/new/pdnsd-alt
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/redsocks2 package/new/redsocks2
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/shadowsocks-libev package/new/shadowsocks-libev
svn export https://github.com/fw876/helloworld/trunk/naiveproxy package/new/naiveproxy
svn export https://github.com/fw876/helloworld/trunk/shadowsocks-rust package/new/shadowsocks-rust
svn export https://github.com/fw876/helloworld/trunk/shadowsocksr-libev package/new/shadowsocksr-libev
svn export https://github.com/fw876/helloworld/trunk/simple-obfs package/new/simple-obfs
svn export https://github.com/fw876/helloworld/trunk/tcping package/new/tcping
svn export https://github.com/fw876/helloworld/trunk/trojan package/new/trojan
svn export https://github.com/fw876/helloworld/trunk/v2ray-plugin package/new/v2ray-plugin
svn export https://github.com/fw876/helloworld/trunk/xray-core package/new/xray-core
# building ssr-libev with libmbedtls
patch -d package/new -p1 -i ../../../patches/building-ssr-libev-with-libmbedtls.patch

# Traffic Usage Monitor
git clone -b master --depth 1 --single-branch https://github.com/brvphoenix/wrtbwmon package/new/wrtbwmon
git clone -b master --depth 1 --single-branch https://github.com/brvphoenix/luci-app-wrtbwmon package/new/luci-app-wrtbwmon

# UPNP
rm -rf ./feeds/luci/applications/luci-app-upnp
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-upnp feeds/luci/applications/luci-app-upnp
ln -sf ../../../feeds/luci/applications/luci-app-upnp ./package/feeds/luci/luci-app-upnp
rm -rf ./feeds/packages/net/miniupnpd
svn export https://github.com/openwrt/packages/branches/openwrt-21.02/net/miniupnpd feeds/packages/net/miniupnpd

# USB Printer
svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-usb-printer feeds/luci/applications/luci-app-usb-printer
ln -sf ../../../feeds/luci/applications/luci-app-usb-printer ./package/feeds/luci/luci-app-usb-printer

# vlmcsd
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-vlmcsd feeds/luci/applications/luci-app-vlmcsd
ln -sf ../../../feeds/luci/applications/luci-app-vlmcsd ./package/feeds/luci/luci-app-vlmcsd
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/vlmcsd package/new/vlmcsd

# xlnetacc
cp -rf ../luci-app-xlnetacc package/new/luci-app-xlnetacc

# Edge Theme
svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-theme-edge package/new/luci-theme-edge
#git clone -b master https://github.com/kiddin9/luci-theme-edge.git package/new/luci-theme-edge

# poweroff
git clone -b master https://github.com/esirplayground/luci-app-poweroff package/new/luci-app-poweroff

# Socat IPv6 to IPv4
svn export https://github.com/Lienol/openwrt-package/trunk/luci-app-socat package/new/luci-app-socat

# Add r8125 realtek network card driver
# svn export https://github.com/Lienol/openwrt/branches/19.07/package/kernel/r8125 package/new/r8125
# svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/r8125 package/new/r8125
svn export https://github.com/jinlife/unraid-r8125-r8152-driver/trunk/r8125 package/new/r8125
#cp -rf ../r8125 package/new/r8125

#svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06/package/kernel/r8152 package/new/r8152
svn export https://github.com/jinlife/unraid-r8125-r8152-driver/trunk/r8152 package/new/r8152
#cp -rf ../r8152 package/new/r8152
cp -rf package/new/r8152/patches/100-add-LED-configuration-from-OF.patch package/new/r8152/src
pushd package/new/r8152/src
git apply 100-add-LED-configuration-from-OF.patch && rm 100-add-LED-configuration-from-OF.patch
grep -rn "r8152_led_configuration" *
popd

exit 0
