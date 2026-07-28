# Seeking-Z 个人配置文件

用于管理个人 Linux 环境配置，包括 Shell、桌面环境、编辑器、系统服务以及常用软件包列表。

## 功能

目前包含：

- Shell 配置

  - `.bashrc`
  - `.bash_profile`

- Git 配置

  - `.gitconfig`

- 终端配置

  - Kitty
  - tmux

- 编辑器配置

  - Neovim

- 桌面环境配置

  - Hyprland
  - Waybar
  - SwayNC
  - fcitx5
  - fontconfig

- 用户服务

  - systemd user units
  - ssh-agent

- 系统配置

  - pacman hooks

- 软件包安装

  - pacman 官方仓库包
  - AUR 包

## 使用

### 1. 克隆仓库

```bash
git clone https://github.com/Seeking-Z/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

### 2. 安装配置

运行：

```bash
./install.sh
```

安装脚本会：

- 备份已有配置文件
- 创建必要的软链接
- 部署 systemd user units
- 配置 SSH
- 安装 pacman hooks
- 从packages目录中的包列表安装包

## 更新配置

修改配置文件后：

```bash
git status
git add .
git commit -m "Update configuration"
```

推送到远程：

```bash
git push
```

## 更新软件包列表

当安装或删除软件包后：  
`hook`会自动更新包列表，包括以下文件:

```text
packages/
├── pacman.txt
└── aur.txt
```

但不会自动提交Git

## 目录结构

```text
.dotfiles
├── .config
│   ├── fcitx5
│   ├── fontconfig
│   ├── hypr
│   ├── kitty
│   ├── nvim
│   ├── swaync
│   └── waybar
├── .local
│   └── bin
│       └── scripts
├── packages
│   ├── aur.txt
│   └── pacman.txt
├── system
│   └── pacman.d
│       └── hooks
├── install.sh
└── README.md
```

## 注意事项

- 请不要以 root 身份运行 `install.sh`
- SSH 私钥需要手动迁移。
- 安装脚本会备份已有配置文件，例如：

```text
~/.bashrc -> ~/.bashrc.bak
```

- 本配置主要针对 Arch Linux 环境
