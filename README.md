# Stella IP Kit

面向业务负责人、主理人、操盘手的个人 IP 编导系统。

它不是只帮你写几条文案，而是把这整条链路打包成一套可安装的 skill kit：

- 业务定向
- 账号定位
- 长期内容规划
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

### `/stella-ip-direction`

业务定向和账号定位。

### `/stella-ip-planning`

长期内容规划。

### `/stella-ip-episode`

单期策划。

### `/stella-ip-script`

脚本、分镜、拍摄执行包。

### `/stella-ip-package`

发布包装和去 AI 味。

### `/stella-ip-review`

复盘和迭代。

### `/stella-ip-director`

一站式总控。

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
|   |   |-- SKILL.md
|   |   `-- agents/openai.yaml
|   |-- stella-ip-direction/
|   |   |-- SKILL.md
|   |   `-- agents/openai.yaml
|   |-- stella-ip-director/
|   |   |-- SKILL.md
|   |   |-- agents/openai.yaml
|   |   `-- references/memory-template.md
|   |-- stella-ip-planning/
|   |   |-- SKILL.md
|   |   `-- agents/openai.yaml
|   |-- stella-ip-episode/
|   |   |-- SKILL.md
|   |   `-- agents/openai.yaml
|   |-- stella-ip-script/
|   |   |-- SKILL.md
|   |   `-- agents/openai.yaml
|   |-- stella-ip-package/
|   |   |-- SKILL.md
|   |   `-- agents/openai.yaml
|   `-- stella-ip-review/
|       |-- SKILL.md
|       `-- agents/openai.yaml
|-- install.cmd
|-- install.ps1
`-- install.sh
```

## 兼容性说明

- `SKILL.md` 才是核心能力定义
- `agents/openai.yaml` 只是可选展示元数据
- 对不识别 `openai.yaml` 的智能体，一般会直接忽略，不影响使用
- 如果你的智能体不是 Claude 风格目录，可以使用自定义路径安装