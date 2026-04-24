# Stella IP Kit

面向业务负责人、主理人、操盘手的个人 IP 编导系统。

它不是单独帮你写几条文案，而是把这整条链路打包成可安装的 skill kit：

- 业务定向
- 账号定位
- 长期选题规划
- 单期策划
- 口播文案
- 分镜与拍摄脚本
- 标题、封面字、配文、去 AI 味
- 发布后复盘

## 安装

### Claude Code

```bash
claude plugin marketplace add aaronpan007/stella_ip_kit
claude plugin install stella-ip-kit
```

### 通用安装方式（适用于 Codex / Claude Code）

```bash
npx skills add aaronpan007/stella_ip_kit
```

### 备用安装方式

macOS / Linux：

```bash
curl -fsSL https://raw.githubusercontent.com/aaronpan007/stella_ip_kit/main/install.sh | bash
```

安装到指定项目：

```bash
curl -fsSL https://raw.githubusercontent.com/aaronpan007/stella_ip_kit/main/install.sh | bash -s /path/to/your/project
```

Windows PowerShell：

```powershell
irm https://raw.githubusercontent.com/aaronpan007/stella_ip_kit/main/install.ps1 | iex
```

安装到指定项目：

```powershell
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/aaronpan007/stella_ip_kit/main/install.ps1))) -Target "D:\path\to\your\project"
```

Windows CMD：

```bat
powershell -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/aaronpan007/stella_ip_kit/main/install.ps1 | iex"
```

安装到指定项目：

```bat
powershell -ExecutionPolicy Bypass -Command "& ([scriptblock]::Create((irm https://raw.githubusercontent.com/aaronpan007/stella_ip_kit/main/install.ps1))) -Target 'D:\path\to\your\project'"
```

### 本地 clone 后安装

Windows PowerShell：

```powershell
git clone https://github.com/aaronpan007/stella_ip_kit.git
cd stella_ip_kit
.\install.ps1
```

Windows CMD：

```bat
git clone https://github.com/aaronpan007/stella_ip_kit.git
cd stella_ip_kit
install.cmd
```

macOS / Linux：

```bash
git clone https://github.com/aaronpan007/stella_ip_kit.git
cd stella_ip_kit
./install.sh
```

安装完成后，直接输入：

```text
/stella
```

## 这套系统能解决什么

这不是“给你几个选题灵感”的工具，而是一整套从业务到内容的个人 IP 生产系统。

它主要解决 6 类问题：

1. 不知道个人 IP 到底该为业务承担什么任务
2. 不知道账号应该怎么定位，讲什么，不讲什么
3. 不知道接下来一个月或前 10 期该拍什么
4. 确定选题后，不知道怎么写成能拍的口播和脚本
5. 不知道怎么做开头、标题、封面字、配文和去 AI 味
6. 发完之后，不知道哪些内容该继续，哪些该停掉

## Skill 列表

### `/stella`

入口和引导路由。

解决：

- 第一次来，不知道从哪里开始
- 不知道该用哪个 skill
- 想先看这套系统怎么用

### `/stella-ip-direction`

业务定向和账号定位。

解决：

- 你的业务是什么
- 你的产品是什么
- 谁是客户
- 个人 IP 要承担什么任务
- 账号应该怎么定位

### `/stella-ip-planning`

长期内容规划。

解决：

- 接下来一个月拍什么
- 前 10 期拍什么
- 内容支柱怎么搭
- 选题优先级怎么排

### `/stella-ip-episode`

单期策划。

解决：

- 这期到底拍什么
- 这期服务谁
- 这期主要目标是什么
- 这期更适合口播、口播加 B-roll，还是轻 vlog

### `/stella-ip-script`

脚本、分镜、拍摄执行包。

解决：

- 口播文案怎么写
- 开头怎么抓人
- 画面怎么配
- 分镜和拍摄脚本怎么落地

### `/stella-ip-package`

发布包装和去 AI 味。

解决：

- 标题怎么起
- 封面字怎么写
- 配文怎么补
- 哪些地方 AI 味太重

### `/stella-ip-review`

复盘和迭代。

解决：

- 什么内容有效
- 什么内容无效
- 下一批该怎么调整

### `/stella-ip-director`

一站式总控。

解决：

- 不想自己判断流程
- 希望系统按阶段带着走

## Quick Start

第一次使用，直接输入：

```text
/stella
```

Stella 会先带你完成第一轮初始化：

- 业务定向
- 账号定位

然后把结果沉淀进：

```text
memory/stella-ip-director/ip-profile.md
```

后续再继续做：

1. `/stella-ip-planning`
2. `/stella-ip-episode`
3. `/stella-ip-script`
4. `/stella-ip-package`
5. `/stella-ip-review`

## 目录结构

```text
.
|-- .codex-plugin/
|   `-- plugin.json
|-- memory/
|   `-- stella-ip-director/
|       |-- ip-profile.md
|       |-- topic-backlog.md
|       |-- production-board.md
|       `-- publishing-log.md
|-- skills/
|   |-- stella/
|   |   |-- skill.md
|   |   `-- agents/openai.yaml
|   |-- stella-ip-direction/
|   |   |-- skill.md
|   |   `-- agents/openai.yaml
|   |-- stella-ip-director/
|   |   |-- skill.md
|   |   |-- agents/openai.yaml
|   |   `-- references/memory-template.md
|   |-- stella-ip-planning/
|   |   |-- skill.md
|   |   `-- agents/openai.yaml
|   |-- stella-ip-episode/
|   |   |-- skill.md
|   |   `-- agents/openai.yaml
|   |-- stella-ip-script/
|   |   |-- skill.md
|   |   `-- agents/openai.yaml
|   |-- stella-ip-package/
|   |   |-- skill.md
|   |   `-- agents/openai.yaml
|   `-- stella-ip-review/
|       |-- skill.md
|       `-- agents/openai.yaml
|-- install.cmd
|-- install.ps1
`-- install.sh
```

## 兼容性说明

- `skill.md` 才是核心能力定义
- `agents/openai.yaml` 只是可选展示元数据
- 对不识别 `openai.yaml` 的智能体，一般会直接忽略，不影响使用
- 如果你的智能体不是 Claude 风格目录，可以使用自定义路径安装

例如：

```powershell
.\install.ps1 `
  -Target D:\path\to\project `
  -SkillsRoot ".agents/skills" `
  -InstructionsFile "AGENTS.md" `
  -SkipOpenAIMetadata `
  -SkipInstructionsBlock
```
