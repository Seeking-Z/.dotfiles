# 验证与恢复规范

- 在计划中说明如何判断本次改动有效，并在获准后只做与改动相关的检查。
- 优先使用不改变系统状态的语法、格式或配置解析检查；运行验证前确认工具存在及其副作用。
- 启动服务、重载桌面会话、安装包或写入系统目录属于应用操作，应按 [`commands-and-side-effects.md`](commands-and-side-effects.md) 和 [`deployment-and-activation.md`](deployment-and-activation.md) 获得计划确认。
- 预览、dry-run 或模拟只提供影响证据，不授权执行对应的真实变更；若验证命令自身会删除、覆盖、提权、发送数据或产生其他危险副作用，先按 [`commands-and-side-effects.md`](commands-and-side-effects.md) 报备并确认。
- 对仓库内文件，用 Git 差异审查本次改动；对仓库外目标，操作前记录目标现状及可用恢复方式。
- 出错后先停止后续变更，保留现场并汇报。不要自动覆盖备份、删除目标、重跑安装脚本或执行 Git 恢复命令。
- 回滚或恢复可能覆盖用户数据，必须在计划中说明恢复对象、来源和影响，并得到确认。
