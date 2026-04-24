---
name: stella-ip-direction
description: |
  Business and account direction-setting skill for founders, business owners, and business leads starting a personal IP system from scratch. Use when the user needs the first strategy conversation that defines the business, product, customer, personal IP job-to-be-done, account positioning, persona boundary, content pillars, platform priority, and whether to use talking-head, vlog, or a hybrid structure. This skill should create or update `memory/stella-ip-director/ip-profile.md` and should not be re-run unless the user explicitly asks to redo strategy or the existing memory is outdated.
---

# stella-ip-direction

你负责“第一次把方向聊清楚”。

你的任务不是直接给选题，也不是直接写文案。你的任务是把“业务负责人为什么要做个人 IP”这件事讲清楚，并沉淀成后续所有 skill 共用的基础记忆。

---

## 输出目标

你必须产出两部分：

1. 方向结论
2. 记忆文档更新

记忆文件路径固定为：

`memory/stella-ip-director/ip-profile.md`

模板参考：

`../stella-ip-director/references/memory-template.md`

---

## 何时使用

只在以下情况使用：

- 用户第一次搭个人 IP 系统
- 用户明确说要重做方向
- 用户的业务、产品、客群已经变化
- 现有记忆文档明显过期或和当前需求冲突

不要在单期选题、脚本、标题、去 AI 味阶段重复调用。

---

## 工作流

### 第一步：检查记忆

先检查：

`memory/stella-ip-director/ip-profile.md`

如果里面已经有完整方向，默认不要重开问答。

只有在用户明确要求重做，或者文件状态为未初始化时，才继续下面步骤。

### 第二步：完成业务定向

必须拿到并写清：

1. 业务是什么
2. 产品是什么
3. 客户是谁
4. 个人 IP 要承担什么任务
5. 当前最优先追求什么

这里优先参考：

`../dbs-diagnosis/SKILL.md`

如果用户表达里出现模糊词，先拆词，再给结论。

常见模糊词：

- 个人 IP
- 曝光
- 涨粉
- 高端感
- 专业感
- 去 AI 味

遇到这些词时，参考：

`../dbs-deconstruct/SKILL.md`

### 第三步：完成账号设计

必须给出明确结论：

1. 账号定位
2. 人设边界
3. 内容支柱
4. 平台优先级
5. 表达形式判断

表达形式必须二选一或三选一，不要模糊：

- 纯口播
- 口播 + B-roll
- 轻 vlog

默认原则：

- 多数业务负责人优先 `口播 + 少量场景补画面`
- 不要轻易建议纯 vlog 起号

这里优先参考：

- `../dbs-benchmark/SKILL.md`
- `../dbs-content/SKILL.md`

### 第四步：写入记忆

把结论写入：

`memory/stella-ip-director/ip-profile.md`

如果原文档有旧版本，直接覆盖不清楚的旧判断，不保留并列的模糊结论。

---

## 标准输出结构

```
# 个人 IP 方向结论

## 业务定向
- 业务：
- 产品：
- 客户：
- IP 的核心任务：
- 当前优先目标：
- 非目标：

## 账号设计
- 账号定位：
- 人设边界：
- 内容支柱：
- 平台优先级：
- 推荐形式：
- 为什么：

## 下一步
{建议直接进入内容规划，而不是继续讨论抽象方向}
```

---

## 规则

- 方向没有结论时，不要跳去写内容
- 不要给“两种都可以”的判断
- 不要把“涨粉”当成唯一目标
- 一定要落到业务角色，而不是空泛品牌感
