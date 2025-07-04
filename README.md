# nfc-app-lib-sync

> 一个 Zsh 插件，用于从 nfc-app-lib* 开头的 Downloads 文件夹中同步 JNI 库文件。

## 安装方法

将该仓库克隆到你的 .oh-my-zsh/custom/plugins 目录下：

```bash
git clone https://github.com/aoGma/nfc-app-lib-sync.git ~/.oh-my-zsh/custom/plugins/nfc-app-lib-sync
```

## 开启插件

编辑 `~/.zshrc` 文件
把 `nfc-app-lib-sync` 添加到 `plugins` 中 然后执行 `source ~/.zshrc` 重新加载你的 `Zsh` 配置文件 `.zshrc` 即可。

## 使用方法

`cpios` : 同步文件到 `ToolBox iOS` 解析库

`cpandroid`: 同步文件到 `ToolBox Android` 解析库

`syncnfc`: 同步 `iOS` 和 `Android`，相当于执行 `cpios` 和 `cpandroid`

![demo](https://github.com/aoGma/nfc-app-lib-sync/Kapture%202025-07-04%20at%2010.13.40.gif)
