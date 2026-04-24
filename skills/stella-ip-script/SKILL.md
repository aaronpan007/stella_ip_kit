---
name: stella-ip-script
description: |
  Script and shot-list skill for business-led personal IP content. Use when the user already has a single-episode brief and needs a concrete talking-head script, hybrid script, B-roll plan, or shot list that is ready to film. This skill should read `memory/stella-ip-director/ip-profile.md` first, use the single-episode brief as the direct input, and output a full directing package including hook, spoken lines, scene plan, shot list, and filming notes.
---

# stella-ip-script

你负责把单期 brief 变成能拍的东西。

输出必须是“编导包”，不是只有一段口播文案。

---

## 输入前提

默认先读：

- `memory/stella-ip-director/ip-profile.md`

并拿到一份明确的单期 brief。

如果 brief 还没有，先回到：

`../stella-ip-episode/SKILL.md`

---

## 输出目标

必须输出：

1. 开头 hook
2. 口播文案
3. 画面设计
4. 拍摄脚本
5. 补拍清单

---

## 工作流

### 第一步：确定表达结构

先判断这条内容最适合：

- 纯口播
- 口播 + B-roll
- 轻 vlog

默认多给“口播 + B-roll”的方案。

### 第二步：写开头

开头必须独立成立。

优先参考：

`../dbs-hook/SKILL.md`

检查：

- 不假设用户看过标题
- 3 到 5 秒内能抓人
- 没把答案说完
- 可以直接念

### 第三步：写口播文案

默认结构：

1. 开头
2. 问题抛出
3. 核心判断
4. 展开
5. 案例或细节
6. 收束

要求：

- 说人话
- 短句优先
- 允许停顿
- 不要句句像金句
- 不要均匀得像模板

### 第四步：设计画面

把画面分为：

- A-roll：主镜头
- B-roll：辅助理解的画面

先保证 A-roll，再决定 B-roll。

### 第五步：写拍摄脚本

至少列出：

- 镜头编号
- 镜头类型
- 画面内容
- 台词或字幕
- 备注

### 第六步：列补拍清单

明确有哪些画面需要额外补。

---

## 输出格式

```
# 单期编导包

## 推荐形式

## 开头 Hook

## 口播文案

## 画面设计

## 拍摄脚本
| 镜头 | 类型 | 画面 | 台词/字幕 | 备注 |

## 补拍清单
```

---

## 协同参考

- 开头：`../dbs-hook/SKILL.md`
- 长文案与内容结构：`../dbs-content/SKILL.md`
- 包装与 AI 味处理：`../stella-ip-package/SKILL.md`

---

## 规则

- 不要只给台词不给画面
- 不要让 B-roll 变成炫技
- 不要为了“自然”故意写笨
- 如果素材不够，直接指出，而不是硬编
