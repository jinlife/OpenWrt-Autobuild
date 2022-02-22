#### 支持机型

[![X86-64_1907](https://github.com/jinlife/OpenWrt-Autobuild/actions/workflows/x86_64_1907.yml/badge.svg)](https://github.com/jinlife/OpenWrt-Autobuild/actions/workflows/x86_64_1907.yml)

[![X86-64_2102](https://github.com/jinlife/OpenWrt-Autobuild/actions/workflows/x86_64.yml/badge.svg)](https://github.com/jinlife/OpenWrt-Autobuild/actions/workflows/x86_64.yml)

#### 部分应用来源

[![Official](https://img.shields.io/badge/Openwrt-Openwrt-orange.svg?style=flat&logo=appveyor)](https://github.com/openwrt/openwrt)
[![coolsnowwolf](https://img.shields.io/badge/Lede-Lean-orange.svg?style=flat&logo=appveyor)](https://github.com/coolsnowwolf/lede)
[![Lienol](https://img.shields.io/badge/OpenWrt-Lienol-orange.svg?style=flat&logo=appveyor)](https://github.com/Lienol/openwrt)
[![CTCGFW](https://img.shields.io/badge/OpenWrt-CTCGFW-orange.svg?style=flat&logo=appveyor)](https://github.com/immortalwrt/immortalwrt)

#### 特色及功能

- 主要基于官方Openwrt稳定分支库，添加常用的插件编译而成的精简版镜像。
- Dropbear 关闭， 本人是Unraid建立Docker的Xray代理服务器，远程客户端SSL接入局域网功能。 Unraid可以在虚拟机界面输入SSH命令，更安全。
- 默认密码: 无
- 只维护X86，Openwrt 19.07和21.02版本. （19.07版耗更少的CPU，21.02版更稳定）
- 支持 r8125 的螃蟹2.5G网卡
- 支持 r8152(r8156,r8156B) 的USB3.0螃蟹2.5G网卡
- 只使用必要的路由相关功能，共享文件功能由Unraid宿主机实现。
- 精简版本，大小只有180MB，可以在Unraid虚拟机直接挂载使用。 efi镜像用OMVF，普通镜像用SeaBIOS。

#### 分支

| 版本            |x86-64 |
|:--------------:|:-----:|
| 19.07.8|&check;|
| 21.02.1|&check;|

#### 第三方应用列表

| 应用        |x86-64 |简介 |
|-------------|:-----:|:-----:|
|iKoolproxy |&check;|用于过滤广告|
| AutoCore    |&check;|显示CPU信息|
| cpufreq     |       |X86用不着，CPU频率|
| DDNS        |&check;|动态域名|
|FullCone NAT |&check;|NAT转发|
| frpc        |       |局域网穿透客户端|
| frps        |       |局域网穿透服务器|
|IPv6 兼容助手|&check;|IPV6|
| IPSEC       |       |IPSec VPN服务器(iOS 和Andriod 原生客户端支持连接)|
| MiniUPnP    |&check;|UPnP自动端口映射|
| OpenClash   |       |科学上网|
| PassWall    |&check;|科学上网|
| Server 酱   |       |微信通知|
| usb 打印    |&check;| USB打印|
| vlmcsd 服务（KMS） |&check;| KMS激活Windows和Office|
| Zerotier    |       |局域网穿透|
| 定时重启    |&check;|定时重启Openwrt|
| 流量监控    |&check;|客户端实时流量监控|
|上网时间控制 |&check;|上网客户端时间控制|
| 网络共享    |       |Samba共享目录|
| 文件传输    |&check;|上传文件至Openwrt|
| 迅雷快鸟    |&check;|迅雷快鸟可15元升级宽带速度|
| 应用过滤    |       |手机应用过滤|
| 自动挂载    |       |自动挂载USB硬盘|
