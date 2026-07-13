# aitp-xhs-skills · 小红书 AI 工具起号工作流（衍生版）

一套面向 Codex / Claude / WorkBuddy 等 Agent 的小红书冷启动与图文生产 Skills，聚焦 **AI 工具 / 办公效率** 赛道。把"从 0 起号 → 变现倒推 → 账号档案 → 排期复盘 → 选题标题 → 去 AI 味 → 低粉爆款拆解"做成一条可复用的 Agent 工作流。

## 这是什么 / 不是什么

- **是**：一套可执行的 Agent 指令集（skill），让 AI 按固定方法论帮你做账号定位、出内容、复盘数据。
- **不是**：原仓库 `jackbauerxu/workbuddy-xhs-skills` 的复制件。本包是**实质性改写版本**——案例、措辞、赛道聚焦、表达风格均已重写为 AI 工具 / 办公效率方向，版权归改写者所有。

## 来源声明（务必保留）

本包的方法论框架受公开的小红书运营写作（含《别不信！WorkBuddy 就可以把你的小红书从0粉干到1000》一文及其同赛道系列）启发，经独立重写与赛道化改造而成。原作者的具体文字表达未被复制。如你在此基础上再次分发或售卖，请保留本段声明，并确认你所售的是"改写 + 你的实战经验"，而非他人原文。

## 品牌说明

本包已使用品牌前缀 `aitp-xhs-`（如 `aitp-xhs-topic-bank`），可直接分发使用。

如日后需再次改名，请**目录名与文件内容一起改**（含每个 SKILL.md 顶部 `name:` 字段、skill 间引用、README）：
```
# macOS / Linux
for f in $(find . -type f); do sed -i 's/aitp-xhs-/newbrand-xhs-/g' "$f"; done
for d in aitp-xhs-*; do mv "$d" "${d/aitp-xhs-/newbrand-xhs-}"; done
# Windows PowerShell
$B="newbrand"; Get-ChildItem -Recurse -File | ForEach-Object { (Get-Content $_.FullName -Raw) -replace 'aitp-xhs-',"$B-xhs-" | Set-Content $_.FullName -NoNewline }
Get-ChildItem -Directory aitp-xhs-* | Rename-Item -NewName { $_.Name -replace 'aitp-xhs-',"$B-xhs-" }
```

## 包含的 6 个 skill

| 文件名 | 作用 |
|--------|------|
| `aitp-xhs-monetization-backsolve` | 变现倒推账号定位 |
| `aitp-xhs-account-profile` | 账号档案 / 长期记忆 |
| `aitp-xhs-schedule-review` | 排期与周复盘闭环 |
| `aitp-xhs-topic-bank` | 七类选题库 + 标题公式 |
| `aitp-xhs-humanize-compliance` | 去 AI 味 + 发布前检查 |
| `aitp-xhs-low-follower-pattern` | 低粉爆款内容骨架拆解 |

## 安装方式

把对应 skill 目录复制到 Agent 的 skills 路径（任选其一）：
- WorkBuddy：`~/.workbuddy/skills/`
- Codex：`~/.codex/skills/`
- Claude：`~/.claude/skills/`

复制后直接用自然语言触发，例如："我想从 0 做小红书 AI 工具号、靠课程变现，先用 aitp-xhs-monetization-backsolve 帮我倒推定位。"

## 推荐调用顺序

```
定位(aitp-xhs-monetization-backsolve)
   → 档案(aitp-xhs-account-profile)
   → 排期(aitp-xhs-schedule-review)
   → 选题(aitp-xhs-topic-bank)
   → 去味(aitp-xhs-humanize-compliance)
   → 对标(aitp-xhs-low-follower-pattern)
```

## 合规提醒

不同平台规则、工具能力、账号增长结果都会变化。本包只提供方法论工作流，不承诺任何增长结果，使用者需结合自身实际情况与平台最新规则判断。
