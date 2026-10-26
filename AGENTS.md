# Dotfiles 操作规范

本文件是本仓库自动化与协作操作的入口索引。具体规范按主题放在 [`agents/`](agents/) 中；该目录中的普通 Markdown 文件不保证由工具自动载入，必须按下文时机主动打开并读取。

## 工作流程

本仓库所有任务的计划、确认、执行、审查和汇报，统一遵循 [`agents/workflow.md`](agents/workflow.md)。每项任务拟定计划前，必须通过只读文件读取方式主动打开并完整读取该工作流；不得假设链接会使文件自动载入。这是计划阶段唯一允许读取的其他仓库文件，不视为执行任务命令或检查系统状态。随后只依据用户请求、本入口和完整工作流拟定计划。计划获用户明确确认前，不得读取任务目标文件或其他模块、检查系统状态、运行任务命令、联网或修改文件。获批后，读取适用模块；读取任务目标文件或写入前，按 [`agents/git-workflow.md`](agents/git-workflow.md) 检查全工作区 Git 状态。若计划缺少详细规范要求的必填内容，先提交完整修订计划并再次等待确认。

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
