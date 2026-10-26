# Dotfiles 操作规范

本文件是本仓库自动化与协作操作的入口索引。具体规范按主题放在 [`agents/`](agents/) 中；该目录中的普通 Markdown 文件不保证由工具自动载入，必须先遵守工作流程，再按任务查阅适用模块及其链接的子规范。

## 必须遵守的工作流程

1. 开始任何仓库任务前，先把工作拆成最小的、可独立执行和验收的步骤，再向用户汇报；标明步骤顺序和依赖，不合并仍可独立执行的工作。
2. 等待用户审查并明确确认计划。确认前不执行任务步骤，包括读取仓库文件、检查系统、运行命令或修改文件。
3. 获准后按计划执行。若范围、风险或操作步骤发生实质变化，先提交更新后的计划并再次等待确认。
4. 完成后汇报改动、检查结果及未完成事项。

详见 [`agents/workflow.md`](agents/workflow.md)。

## 按任务查阅规范

先阅读与任务相关的模块入口；若入口链接到子规范，继续查阅其中适用于当前任务的内容，并沿适用子规范的链接递归查阅更深层规范。

- 定位配置来源、判断链接或任务范围：[`agents/repository-and-scope.md`](agents/repository-and-scope.md)
- 检查与任务有关的系统环境：[`agents/system-context.md`](agents/system-context.md)
- 检查改动、建立或审查提交、恢复文件：[`agents/git-workflow.md`](agents/git-workflow.md)
- 编辑配置文件：[`agents/file-editing.md`](agents/file-editing.md)
- 运行命令、安装依赖或处理系统级副作用：[`agents/commands-and-side-effects.md`](agents/commands-and-side-effects.md)
- 应用配置、创建链接或启用服务：[`agents/deployment-and-activation.md`](agents/deployment-and-activation.md)
- 检查结果、排查故障或回滚：[`agents/validation-and-recovery.md`](agents/validation-and-recovery.md)
- 接触凭据、个人信息或主机专属数据：[`agents/secrets-and-privacy.md`](agents/secrets-and-privacy.md)
- 维护规范模块文件或模块内规则：[`agents/module-maintenance.md`](agents/module-maintenance.md)

本仓库主要面向 Arch Linux，但不得仅凭仓库默认目标推断当前运行环境。与任务相关时，先按系统环境规范检查实际环境。
