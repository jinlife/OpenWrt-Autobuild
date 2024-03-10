#!/bin/bash

# Access Control
cp -rfv ../immortalwrt-luci/applications/luci-app-accesscontrol feeds/luci/applications/luci-app-accesscontrol
ln -sf ../../../feeds/luci/applications/luci-app-accesscontrol ./package/feeds/luci/luci-app-accesscontrol

# ADBYBY Plus +
cp -rfv ../immortalwrt-luci/applications/luci-app-adbyby-plus feeds/luci/applications/luci-app-adbyby-plus
ln -sf ../../../feeds/luci/applications/luci-app-adbyby-plus ./package/feeds/luci/luci-app-adbyby-plus
cp -rfv ../immortalwrt-packages/net/adbyby package/new/adbyby

# iKoolproxy
git clone https://github.com/yaof-project/luci-app-ikoolproxy.git package/new/luci-app-ikoolproxy

# turboacc
cp -rfv ../coolsnowwolf-luci/applications/luci-app-turboacc feeds/luci/applications/luci-app-turboacc
ln -sf ../../../feeds/luci/applications/luci-app-turboacc ./package/feeds/luci/luci-app-turboacc

# arpbind
cp -rfv ../immortalwrt-luci/applications/luci-app-arpbind feeds/luci/applications/luci-app-arpbind
ln -sf ../../../feeds/luci/applications/luci-app-arpbind ./package/feeds/luci/luci-app-arpbind

# automount
cp -rfv ../immortalwrt/package/emortal/automount package/new/automount

# cpufreq
cp -rfv ../immortalwrt-luci/applications/luci-app-cpufreq feeds/luci/applications/luci-app-cpufreq
ln -sf ../../../feeds/luci/applications/luci-app-cpufreq ./package/feeds/luci/luci-app-cpufreq

# Filetransfer
cp -rfv ../immortalwrt-luci/applications/luci-app-filetransfer feeds/luci/applications/luci-app-filetransfer
ln -sf ../../../feeds/luci/applications/luci-app-filetransfer ./package/feeds/luci/luci-app-filetransfer
cp -rfv ../immortalwrt-luci/libs/luci-lib-fs feeds/luci/libs/luci-lib-fs
ln -sf ../../../feeds/luci/libs/luci-lib-fs ./package/feeds/luci/luci-lib-fs

# FullCone
cp -rfv ../immortalwrt/package/network/utils/fullconenat package/network/utils/fullconenat
#cp -v ../immortalwrt/target/linux/generic/hack-5.4/952-net-conntrack-events-support-multiple-registrant.patch target/linux/generic/hack-5.4/
patch -d feeds/luci -p1 -i ../../../patches/fullconenat-luci.patch
cp -rfv ../immortalwrt/package/network/config/firewall/patches package/network/config/firewall/

# Release Ram
cp -rfv ../immortalwrt-luci/applications/luci-app-ramfree feeds/luci/applications/luci-app-ramfree
ln -sf ../../../feeds/luci/applications/luci-app-ramfree ./package/feeds/luci/luci-app-ramfree

# Scheduled Reboot
cp -rfv ../immortalwrt-luci/applications/luci-app-autoreboot feeds/luci/applications/luci-app-autoreboot
ln -sf ../../../feeds/luci/applications/luci-app-autoreboot ./package/feeds/luci/luci-app-autoreboot

# Passwall
cp -rfv ../luci-app-passwall feeds/luci/applications/luci-app-passwall
ln -sf ../../../feeds/luci/applications/luci-app-passwall ./package/feeds/luci/luci-app-passwall

cp -rfv ../immortalwrt-packages/net/brook package/new/brook
cp -rfv ../immortalwrt-packages/net/chinadns-ng package/new/chinadns-ng
cp -rfv ../immortalwrt-packages/net/trojan-go package/new/trojan-go
cp -rfv ../immortalwrt-packages/net/trojan-plus package/new/trojan-plus
cp -rfv ../immortalwrt-packages/net/v2ray-core package/new/v2ray-core

# Shared for PassWall and ShadowsocksR Plus+
rm -rf ./feeds/packages/net/kcptun
rm -rf ./feeds/packages/net/xray-core
rm -rf ./feeds/packages/net/shadowsocks-libev
cp -rfv ../helloworld/luci-app-ssr-plus package/new/luci-app-ssr-plus
cp -rfv ../immortalwrt-packages/net/dns2socks package/new/dns2socks
cp -rfv ../immortalwrt-packages/net/ipt2socks package/new/ipt2socks

# Fix hash issue
sed -i "s/73a2498dc95934c225d358707e7f7d060b5ce81aa45260ada09cbd15207d27d1/5279eb1cb7555cf9292423cc9f672dc43e6e214b3411a6df26a6a1cfa59d88b7/g" package/new/ipt2socks/Makefile

cp -rfv ../immortalwrt-packages/net/kcptun package/new/kcptun
cp -rfv ../immortalwrt-packages/net/microsocks package/new/microsocks
cp -rfv ../immortalwrt-packages/net/pdnsd-alt package/new/pdnsd-alt
cp -rfv ../immortalwrt-packages/net/redsocks2 package/new/redsocks2
cp -rfv ../immortalwrt-packages/net/shadowsocks-libev package/new/shadowsocks-libev

cp -rfv ../helloworld/naiveproxy package/new/naiveproxy
cp -rfv ../helloworld/shadowsocks-rust package/new/shadowsocks-rust
cp -rfv ../helloworld/shadowsocksr-libev package/new/shadowsocksr-libev
cp -rfv ../helloworld/simple-obfs package/new/simple-obfs
cp -rfv ../helloworld/tcping package/new/tcping
cp -rfv ../helloworld/trojan package/new/trojan
cp -rfv ../helloworld/v2ray-plugin package/new/v2ray-plugin
cp -rfv ../helloworld/xray-core package/new/xray-core

#https://github.com/fw876/helloworld/issues/1394
sed -i 's/ +libopenssl-legacy//g' package/new/shadowsocksr-libev/Makefile

# mbedtls
rm -rf ./package/libs/mbedtls
cp -rfv ../immortalwrt/package/libs/mbedtls package/libs/

# Traffic Usage Monitor
git clone -b master --depth 1 --single-branch https://github.com/brvphoenix/wrtbwmon package/new/wrtbwmon
git clone -b master --depth 1 --single-branch https://github.com/brvphoenix/luci-app-wrtbwmon package/new/luci-app-wrtbwmon

# UPNP
rm -rf ./feeds/luci/applications/luci-app-upnp
cp -rfv ../immortalwrt-luci/applications/luci-app-upnp feeds/luci/applications/luci-app-upnp
ln -sf ../../../feeds/luci/applications/luci-app-upnp ./package/feeds/luci/luci-app-upnp
rm -rf ./feeds/packages/net/miniupnpd
cp -rfv ../openwrt-packages/net/miniupnpd feeds/packages/net/miniupnpd

# USB Printer
cp -rfv ../coolsnowwolf-luci/applications/luci-app-usb-printer feeds/luci/applications/luci-app-usb-printer
ln -sf ../../../feeds/luci/applications/luci-app-usb-printer ./package/feeds/luci/luci-app-usb-printer

# vlmcsd
cp -rfv ../immortalwrt-luci/applications/luci-app-vlmcsd feeds/luci/applications/luci-app-vlmcsd
ln -sf ../../../feeds/luci/applications/luci-app-vlmcsd ./package/feeds/luci/luci-app-vlmcsd
cp -rfv ../immortalwrt-packages/net/vlmcsd package/new/vlmcsd

# xlnetacc
cp -rf ../luci-app-xlnetacc package/new/luci-app-xlnetacc

# Edge Theme
cp -rfv ../kiddin9-openwrt-packages/luci-theme-edge package/new/luci-theme-edge
#git clone -b master https://github.com/kiddin9/luci-theme-edge.git package/new/luci-theme-edge

# poweroff
git clone -b master https://github.com/esirplayground/luci-app-poweroff package/new/luci-app-poweroff

# eqosplus 
git clone -b main https://github.com/sirpdboy/luci-app-eqosplus package/new/luci-app-eqosplus

# Socat IPv6 to IPv4
cp -rfv ../Lienol-openwrt-packages/luci-app-socat package/new/luci-app-socat

# Add r8125 realtek network card driver
cp -rfv ../unraid-r8125-r8152-driver/r8125 package/new/r8125

cp -rfv ../unraid-r8125-r8152-driver/r8152 package/new/r8152
cp -rf package/new/r8152/patches/100-add-LED-configuration-from-OF.patch package/new/r8152/src
pushd package/new/r8152/src
git apply 100-add-LED-configuration-from-OF.patch && rm 100-add-LED-configuration-from-OF.patch
grep -rn "r8152_led_configuration" *
popd

exit 0
