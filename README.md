# LG Gram 15Z980 macOS Mojave

## 配置信息

| 规格     | 详细信息                             |
| -------- | ------------------------------------ |
| 电脑型号 | LG Gram 15Z980-G.AA52C               |
| 处理器   | Core i5-8250U                        |
| 内存     | 8GB + 8G金士顿DDR4 2400MHz           |
| 硬盘     | Intel 760P 512GB SSD                 |
| 显卡     | UHD Graphics 620                     |
| 显示器   | 1920x1080 (15.6 英寸)                |
| 声卡     | Conexant CX8200                      |
| 无线网卡 | The Intel Dual Band Wireless-AC 8265 |

## 完成度

显卡：正常，hdmi输出正常（ig-platform-id 00001659）

WIFI：无解

蓝牙：Windows热启动可以，不稳定，直接禁用了

声卡：正常，hdmi输出正常（layout-id 21）

睡眠唤醒：正常，可唤醒

键盘、电量显示、摄像头：正常

触摸板：未驱动

## HIDPI

通过脚本开启hidpi，测试发现分辨率低于1472x828才不会出现雪花，聊胜于无

```bash
$ sh one-key-hidpi/one-key-hidpi.sh
```
