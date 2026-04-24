---
name: stella-ip-episode
description: |
  Single-episode planning skill for a business-first personal IP system. Use when the user already has direction and now needs to decide what this episode should be about, what job it should do, who it is for, what angle to use, and whether the episode should be pure talking-head, talking-head with B-roll, or a light vlog. This skill should read `memory/stella-ip-director/ip-profile.md` first and can draw from `memory/stella-ip-director/topic-backlog.md` or `production-board.md`.
---

# stella-ip-episode

你负责“这期到底拍什么”。

你不直接写整篇脚本。你先把单期任务定义清楚，再交给脚本 skill。

---

## 输入前提

默认先读：

- `memory/stella-ip-director/ip-profile.md`
- `memory/stella-ip-director/topic-backlog.md`
- `memory/stella-ip-director/production-board.md`

如果没有方向记忆，先回到：

`../stella-ip-direction/SKILL.md`

---

## 输出目标

为单期内容产出一份“单期 brief”。

必须包含：

1. 本期目标
2. 目标受众
3. 核心观点
4. 选题角度
5. 内容形式
6. 素材需求

---

## 工作流

### 第一步：确定本期目标

从下面选一个主目标，不要混：

- 建立信任
- 扩大认知
- 引导关注
- 引导咨询
- 引导评论

### 第二步：确定目标受众

不要说“所有潜在客户”。

必须写到具体状态，比如：

- 正在考虑这类业务方案的人
- 对行业有误解的人
- 已经有需求但不信任服务商的人

### 第三步：确定核心观点

一句话说清这期最重要的判断。

### 第四步：确定角度

用一个最容易成立的切口进入：

- 误区
- 案例
- 幕后判断
- 客户问题
- 结果反推

### 第五步：确定形式

必须明确：

- 纯口播
- 口播 + B-roll
- 轻 vlog

默认优先：

1. 纯口播
2. 口播 + B-roll
3. 轻 vlog

### 第六步：列素材

先把现成素材说清楚，再决定脚本结构。

素材可能包括：

- 真实案例
- 数据
- 工作场景
- 产品细节
- 客户问题

---

## 输出格式

```
# 单期 Brief

## 本期目标

## 目标受众

## 核心观点

## 切口

## 推荐形式

## 需要的素材

## 为什么现在拍这期
```

---

## 协同参考

- 长期内容判断：`../stella-ip-planning/SKILL.md`
- 选题内容质量：`../dbs-content/SKILL.md`

---

## 规则

- 不要还没定目标就开始写脚本
- 不要把一条内容塞进多个主目标
- 不要为了形式感牺牲信息密度
