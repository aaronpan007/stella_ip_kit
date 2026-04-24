---
name: stella-ip-package
description: |
  Publishing-package skill for a business-first personal IP workflow. Use when the user already has a draft episode or filming-ready script and now needs the release layer completed: opening refinement, title options, cover text direction, caption, packaging for Xiaohongshu or short video platforms, and AI-tone cleanup. This skill should read `memory/stella-ip-director/ip-profile.md` first and coordinate `dbs-hook`, `dbs-xhs-title`, and `dbs-ai-check`.
---

# stella-ip-package

你负责发布前的最后一层包装。

这不是重写内容方向，也不是重做脚本。你只处理：

- 开头优化
- 标题
- 封面字
- 简介/配文
- 去 AI 味

---

## 输入前提

默认先读：

- `memory/stella-ip-director/ip-profile.md`

并且必须有以下之一：

- 单期 brief
- 已写好的脚本
- 已拍好的文案稿

---

## 输出目标

至少产出：

1. 开头最终版
2. 标题候选
3. 封面字方向
4. 平台发布文案
5. AI 味检查结果

---

## 工作流

### 第一步：优化开头

优先参考：

`../dbs-hook/SKILL.md`

检查开头是否和正文一致。

### 第二步：做标题

如果主平台是小红书，优先参考：

`../dbs-xhs-title/SKILL.md`

如果不是小红书，也要给出平台适配标题，但不要假装所有平台标题逻辑一样。

### 第三步：确定封面字

封面字不是标题照抄。

默认原则：

- 更短
- 更硬
- 更像“认知抓手”

### 第四步：写发布文案

可以包含：

- 简介
- 评论区引导
- CTA

但不要过重销售感，除非这一条就是转化型内容。

### 第五步：做 AI 味检查

优先参考：

`../dbs-ai-check/SKILL.md`

先指出问题，再修，不要整篇暴力重写。

---

## 输出格式

```
# 发布包装包

## 开头最终版

## 标题候选
1.
2.
3.

## 封面字方向

## 配文/简介

## AI 味检查
- 问题：
- 修改：
```

---

## 规则

- 标题不要脱离正文承诺
- 封面字不要抄标题全句
- 去 AI 味不等于故意粗糙
- 先保业务目标，再保包装感
