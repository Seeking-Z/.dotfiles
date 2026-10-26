# Dotfiles

此仓库集中管理个人 shell、终端、桌面环境、应用程序和系统集成配置。当前配置以 **Arch Linux、Hyprland 和 Wayland** 为中心；其他系统或桌面环境使用前，应先检查相关配置和安装脚本。

## 内容导航

| 路径 | 用途 |
| --- | --- |
| [`.bash_profile`](.bash_profile)、[`.bashrc`](.bashrc)、[`.zshenv`](.zshenv)、[`.zshrc`](.zshrc) | Bash 与 Zsh 启动配置 |
| [`.tmux.conf`](.tmux.conf)、[`.config/tmux-powerline/`](.config/tmux-powerline/) | tmux、状态栏及主题配置 |
| [`.gitconfig`](.gitconfig)、[`.ssh/config`](.ssh/config) | Git 与 SSH 客户端配置；部署前请检查其中的个人和主机相关设置 |
| [`.config/hypr/`](.config/hypr/) | Hyprland 配置，按 Lua 文件拆分为输入、快捷键、窗口规则、外观、程序和启动项等部分 |
| [`.config/waybar/`](.config/waybar/)、[`.config/swaync/`](.config/swaync/)、[`.config/rofi/`](.config/rofi/) | 状态栏、通知中心和应用启动器 |
| [`.config/kitty/`](.config/kitty/)、[`.config/nvim/`](.config/nvim/)、[`.config/zathura/`](.config/zathura/) | 终端、Neovim 和文档阅读器配置 |
| [`.config/fcitx5/`](.config/fcitx5/)、[`.config/fontconfig/`](.config/fontconfig/)、[`.config/aria2/`](.config/aria2/) | 输入法、字体和下载器配置 |
| [`.config/systemd/user/ssh-agent.service`](.config/systemd/user/ssh-agent.service) | 用户级 SSH agent 服务 |
| [`.local/bin/scripts/`](.local/bin/scripts/) | 包安装、包清单更新、翻译和电源模式脚本 |
| [`packages/`](packages/) | pacman 与 AUR 软件包清单 |
| [`system/`](system/) | pacman hook 和 PAM 等系统级配置文件 |
| [`.oh-my-zsh/custom/`](.oh-my-zsh/custom/) | Oh My Zsh 自定义目录中的示例扩展 |
| [`agents/`](agents/) 与 [`AGENTS.md`](AGENTS.md) | 本仓库配置文件的操作规范和查阅入口 |
| [`install.sh`](install.sh) | 将仓库中的配置链接或复制到用户目录及系统位置的部署脚本 |
| [`LICENSE`](LICENSE) | 仓库许可 |

[`electron-flags.conf`](.config/electron-flags.conf) 和 [`user-dirs.dirs`](.config/user-dirs.dirs) 也是用户应用配置的一部分。

## 快捷键清单

本节列出仓库中明确配置的按键，以及仓库加载的插件快捷键；不包含应用程序自带的默认键位。`Super` 表示 Windows/Meta 键，`Ctrl` 表示 Control，`Alt` 表示 Alt；Neovim 的 `<leader>` 键设为空格。Hyprland 的主修饰键是 `Alt`。

### Hyprland

来源：[快捷键配置](.config/hypr/modules/keybindings.lua)。

| 快捷键 | 作用 |
| --- | --- |
| `Alt+Enter` | 打开终端 |
| `Alt+Q` | 关闭当前窗口 |
| `Alt+Backspace` | 退出会话；有 `hyprshutdown` 时优先调用它 |
| `Alt+E` | 打开文件管理器 |
| `Alt+V` | 切换当前窗口的浮动状态 |
| `Alt+Space` | 打开应用启动器 |
| `Alt+W` | 打开窗口选择器 |
| `Alt+P` | 切换伪平铺状态 |
| `Alt+R` | 切换 dwindle 布局分割方式 |
| `Super+L` | 锁定屏幕 |
| `Alt+H/J/K/L` | 将焦点移向左/下/上/右窗口 |
| `Alt+Shift+H/J/K/L` | 与左/下/上/右方向的窗口交换位置 |
| `Alt+1`…`Alt+9`、`Alt+0` | 切换到工作区 1…9、10，同时将光标移到配置指定的位置（`corner=2`） |
| `Alt+Shift+1`…`Alt+Shift+9`、`Alt+Shift+0` | 将当前窗口移到工作区 1…9、10 |
| `Alt+Tab` | 切换名为 `magic` 的特殊工作区 |
| `Alt+Shift+Tab` | 将当前窗口移到 `magic` 特殊工作区 |
| `Alt+Up` / `Alt+Down` | 提高/降低音量 |
| `XF86AudioMute` | 切换输出静音 |
| `XF86AudioMicMute` | 切换麦克风静音 |
| `XF86AudioRaiseVolume` / `XF86AudioLowerVolume` | 调用亮度调整命令，分别增加/降低 5% |
| `XF86AudioPlay` / `XF86AudioPause` | 切换媒体播放/暂停 |
| `Alt+Left` / `Alt+Right` | 播放上一首/下一首 |
| `Print` | 截取选定区域并打开截图编辑器 |
| `Alt+Print` | 截取选定区域并复制到剪贴板 |
| `Super+R` | 重新加载 Hyprland |
| `Alt+T` / `Alt+Shift+T` | 调用普通/详细翻译脚本 |
| `Alt+N` / `Alt+Shift+N` | 执行 `swaync-client -C` / `swaync-client -t -sw` |
| `Alt+B` | 在终端打开 `bluetoothctl` |
| `Alt+Shift+B` | 切换蓝牙开关 |
| `Alt+Shift+W` | 在终端打开 `nmtui` |
| `Super+P` | 切换电源模式 |
| `Super+V` | 打开剪贴板历史选择器，并将选中内容复制到剪贴板 |

### tmux

来源：[tmux 配置](.tmux.conf)和 [Neovim 中的 vim-tmux-navigator 配置](.config/nvim/lua/plugins/vim-tmux-navigator.lua)。以下带前缀的按键需先按 `Ctrl+A`；按两次 `Ctrl+A` 会向程序发送字面上的 `Ctrl+A`。

| 快捷键 | 作用 |
| --- | --- |
| `Ctrl+h/j/k/l`（不按前缀） | 通过 `vim-tmux-navigator` 在 tmux pane 与 Neovim 窗口间切换焦点 |
| `Ctrl+A`，然后 `h/j/k/l` | 将当前 pane 向左/下/上/右调整 5 格 |
| `Ctrl+A`，然后 `H/J/K/L` | 按配置命令交换 pane：`H`、`K` 向上；`J`、`L` 向下 |
| `Ctrl+A`，然后 `|` | 将 pane 左右排列，中间为竖直分隔线（`split-window -h`） |
| `Ctrl+A`，然后 `-` | 将 pane 上下排列，中间为水平分隔线（`split-window -v`） |
| 复制模式中的 `Ctrl+h/j/k/l` | 选择左/下/上/右 pane；这是复制模式中的单独绑定 |

### Neovim

来源：[基础快捷键](.config/nvim/lua/keymaps.lua)和[插件快捷键](.config/nvim/lua/plugins/)。

| 模式或场景 | 快捷键 | 作用 |
| --- | --- | --- |
| 普通模式 | `Space+w` / `Space+q` | 保存文件 / 退出 |
| 普通模式 | `Esc` | 清除搜索高亮 |
| 普通模式 | `Ctrl+h/j/k/l` | 向左/下/上/右切换窗口；vim-tmux-navigator 插件用于跨 Neovim 窗口和 tmux pane 导航 |
| 普通模式 | `Space+e` | 切换文件树 |
| 普通模式 | `Space+f`，再按 `f` / `g` / `r` | 查找文件 / 搜索文本 / 查看最近文件 |
| 普通模式 | `Space+Shift+F` | 格式化当前文件 |
| LSP 附加后 | `gd` / `gD` / `gr` / `K` | 跳转到定义 / 声明 / 引用 / 查看悬浮文档 |
| LSP 附加后 | `Space+l`，再按 `r` / `a` / `d` | 重命名 / 代码操作 / 显示诊断 |
| 普通模式 | `Space+p`，再按 `m` | 打开 Markdown 预览 |
| 普通模式 | `F5` / `Shift+F5` (`<F17>`) | 继续调试 / 终止调试 |
| 普通模式 | `F9` / `F10` / `F11` / `Shift+F11` (`<F23>`) | 切换断点 / 单步越过 / 单步进入 / 单步跳出 |
| 普通模式 | `Space+b` / `Space+Shift+B` | 切换断点 / 设置条件断点 |
| 插入模式补全 | `Ctrl+Space` / `Enter` | 打开补全 / 确认补全项 |
| 插入模式补全 | `Tab` / `Shift+Tab` | 选择下一项 / 上一项 |

### Fcitx5

来源：[Fcitx5 快捷键配置](.config/fcitx5/config)。

| 快捷键 | 作用 |
| --- | --- |
| `Super+Space` | 输入法触发键，同时配置为输入法组向前枚举键 |
| `Shift+Super+Space` | 输入法组向后枚举 |
| `Zenkaku_Hankaku` / `Hangul` | 配置文件中列出的额外输入法触发键名（X11 KeySym） |
| `Hangul_Hanja` / `Hangul_Romaja` | 激活 / 停用输入法 |
| 左 `Shift` | 备用触发键 |
| `Up` / `Down` | 上一页 / 下一页候选项 |
| `Shift+Tab` / `Tab` | 上一个 / 下一个候选项 |
| `Ctrl+Alt+P` | 切换预编辑文本 |

配置文件当前将 `Zenkaku_Hankaku` 和 `Hangul` 列为触发键。它们是 X11 KeySym 名称：前者表示日文全角/半角切换键，后者表示 Hangul 启停/切换键。[X.Org 的 KeySym 定义](https://www.x.org/releases/X11R7.6-RC1/doc/xproto/x11protocol.pdf)只能说明名称含义；仓库文件本身无法说明这些条目何时或由谁加入，也不能证明当前键盘上有对应的实体按键。

[Bash](.bashrc) 和 [Zsh](.zshrc) 启用了 vi 命令行编辑模式，但仓库没有进一步定义这两种模式的按键表。[SwayNC](.config/swaync/config.json) 配置启用了键盘快捷操作开关，但未在仓库中指定具体按键；[Kitty](.config/kitty/kitty.conf) 和 [Zathura](.config/zathura/zathurarc) 配置也未找到显式自定义按键映射。这些应用的默认键位未列入本清单。

## 部署

部署前先阅读 [`install.sh`](install.sh)，并确认脚本中的目标路径和操作适用于当前机器。脚本会建立配置链接；遇到已有普通文件或目录时可能先备份为 `.bak`，遇到指向错误位置的符号链接时会删除并重建。脚本还会启用用户级 `ssh-agent` 服务，并可能通过 `sudo` 安装系统级配置或创建系统链接。

确认这些操作符合预期后，从仓库根目录运行：

```sh
./install.sh
```

不要在未检查目标系统和现有文件的情况下直接运行。安装前也应检查 `.ssh/config` 等可能包含个人环境设置的文件。

## 软件包清单

- [`packages/pacman.txt`](packages/pacman.txt) 和 [`packages/aur.txt`](packages/aur.txt) 分别记录官方仓库与 AUR 软件包。
- [`.local/bin/scripts/install-packages.sh`](.local/bin/scripts/install-packages.sh) 根据清单安装软件包；它可能调用 `sudo`，并在需要时下载、构建 AUR 辅助程序。
- [`.local/bin/scripts/update-packages.sh`](.local/bin/scripts/update-packages.sh) 根据当前已安装的软件包更新清单。运行后应检查清单差异，再决定是否保留。

包管理脚本与配置部署脚本彼此独立；只需要部署配置时，不必运行包安装脚本。

## 首次启动行为

部分配置会在首次启动时下载或安装其依赖：Zsh 配置可安装 Oh My Zsh，Neovim 配置会获取 lazy.nvim 及其插件，tmux 配置可安装 TPM 及插件。这些操作需要网络，并会写入用户目录。相关配置和脚本应在使用前按需检查。

## 修改规范

修改本仓库前先阅读 [`AGENTS.md`](AGENTS.md)，并按其中的流程规划、执行和审查。涉及某类配置时，继续查阅该入口指向的具体规范；提交版本变更前按 Git 规范检查差异。
