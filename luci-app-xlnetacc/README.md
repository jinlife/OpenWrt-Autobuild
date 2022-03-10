# luci-app-xlnetacc
适用于 OpenWRT/LEDE 纯Shell实现的迅雷快鸟客户端

迅雷快鸟别的没升级，防止重试倒是改得很坑。以目前只等待3s就不停重试的设置，很容易被迅雷快鸟封了。这个版本延长了所有等待的时间到2分钟，模拟真实官方客户端等待的时间，用起来比较稳定一点了。

基于 [原作者](https://github.com/sensec/luci-app-xlnetacc) 文件目录重新架构

依赖: wget openssl-util


更新到支持快鸟新协议 300

详情见恩山论坛介绍帖 [依然是改良作品，这次的目标是 -- 迅雷快鸟](http://www.right.com.cn/forum/thread-267641-1-1.html)
