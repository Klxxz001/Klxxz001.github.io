# Yibo Liu · 刘一博

基于 [AcadHomepage](https://github.com/RayeRen/acad-homepage.github.io) 改版的个人学术主页，使用 Jekyll 构建。保留原有 GitHub 仓库与网址：<https://klxxz001.github.io/>。

## 本地目录

```text
E:\个人主页\
├── Klxxz001.github.io\       你的主页仓库，在此修改
└── acad-homepage-reference\  原始参考仓库，保留用于对照
```

改版分支为 `codex/academic-homepage-redesign`。原版页面仍保存在 `main` 的 Git 历史中。本地预览不会更新线上网站。

## 启动预览

在 PowerShell 中执行：

```powershell
cd 'E:\个人主页\Klxxz001.github.io'
.\run_server.ps1
```

打开 <http://127.0.0.1:4000/>。关闭服务时，在运行服务的终端中按 `Ctrl+C`。

脚本优先使用 Windows 的 Bundler；没有时会使用现有的 Ubuntu WSL。当前电脑已经在 WSL 中配置了 Ruby、Bundler 和本项目的依赖。WSL 本地依赖放在用户目录中，不会提交到 GitHub。

换一个端口：

```powershell
.\run_server.ps1 -Port 4001
```

只构建、不启动服务：

```powershell
.\run_server.ps1 -Build
```

如果使用 Linux 或 WSL 终端：

```bash
bash run_server.sh
```

一般内容修改会触发重新构建和浏览器刷新。修改 `_config.yml` 后需要重启服务。

## 修改内容的位置

| 内容 | 文件 |
|---|---|
| 姓名、身份、单位、联系方式、头像、更新时间 | `_config.yml` |
| 英文简介、中文简介、页面章节 | `_pages/about.md` |
| 顶部导航 | `_data/navigation.yml` |
| 研究方向 | `_data/research.yml` |
| 已发表论文、作者顺序、DOI、摘要 | `_data/publications.yml` |
| 在审稿件与工作论文 | `_data/working_papers.yml` |
| 研究项目 | `_data/projects.yml` |
| 教育经历 | `_data/education.yml` |
| 奖励与活动 | `_data/awards.yml` |
| 配色、字体、间距、手机布局 | `assets/css/main.css` |

论文的 `authors` 按真实顺序填写；与 `_config.yml` 中 `author.name` 相同的作者会自动加粗。`corresponding_author: true` 会在你的姓名后添加通讯作者标记。不要将模板样例或他人的引用数加入个人成果。

Google Scholar、ORCID 和 CV 链接只有填写后才会展示。目前未启用引用爬虫或访问统计。

### 添加头像

将照片放入 `assets/images/`，再在 `_config.yml` 中填写：

```yaml
author:
  avatar: "/assets/images/profile.jpg"
```

这是修改现有 `author` 字段中的 `avatar`，不要重复添加第二个 `author`。未填写时展示姓名缩写 YL。

### 替换论文配图

当前 SVG 是研究主题插图，不是论文中的实证结果图。可把你拥有使用权的论文图放入 `assets/images/`，再修改对应论文的 `image` 和 `image_alt`。

## 发布到 GitHub Pages

仓库包含 `.github/workflows/pages.yml`：PR 会构建检查；合并或推送到 `main` 后会构建并部署。构建产物 `_site/` 无需手动提交。

第一次采用这套发布流程时，需在 GitHub 仓库 **Settings → Pages → Build and deployment → Source** 中选择 **GitHub Actions**。

建议先在改版分支完成检查和提交，再推送该分支并通过 PR 合并到 `main`。线上网址仍然是 <https://klxxz001.github.io/>。

## 来源与授权

参考模板的 MIT 授权与版权信息保存在 `LICENSE`，改版来源记录在 `NOTICE.md`。

三篇已发表论文的题名、作者顺序、期刊和 DOI 已于 2026-10-09 核对 Crossref。其余履历和成果状态沿用原主页；后续有变化时应及时更新数据文件。
