#!/usr/bin/env bash
# aitp-xhs-skills 一键推送 + 发布脚本
# 用法：
#   1) 在 GitHub 网页先建一个「空」仓库（不要勾 README/License），名字建议 aitp-xhs-skills
#   2) 准备一个有 repo 权限的 Personal Access Token(PAT)
#   3) 在本目录执行：
#        GH_USER=你的用户名  GH_TOKEN=你的PAT  REPO=aitp-xhs-skills  bash push-to-github.sh
set -e

: "${GH_USER:?请设置 GH_USER=你的GitHub用户名}"
: "${GH_TOKEN:?请设置 GH_TOKEN=你的PAT}"
: "${REPO:=aitp-xhs-skills}"

REMOTE="https://${GH_USER}:${GH_TOKEN}@github.com/${GH_USER}/${REPO}.git"

echo "==> 绑定远程并推送 main + 标签"
git remote remove origin 2>/dev/null || true
git remote add origin "$REMOTE"
git push -u origin main
git push origin --tags

echo "==> 尝试用 GitHub API 创建 Release v1.0.0"
API="https://api.github.com/repos/${GH_USER}/${REPO}/releases"
curl -s -X POST "$API" \
  -H "Authorization: token ${GH_TOKEN}" \
  -H "Accept: application/vnd.github+json" \
  -d '{"tag_name":"v1.0.0","name":"aitp-xhs-skills v1.0.0","body":"首个可分发版本：6 个小红书起号技能包（定位/档案/选题库/去AI味/爆款拆解/排期复盘）。解压即用。","draft":false,"prerelease":false}' \
  >/dev/null && echo "Release 已创建 ✅" || echo "Release 创建失败，可到网页 Releases 手动 New release，选 tag v1.0.0"

echo "==> 完成：https://github.com/${GH_USER}/${REPO}"
