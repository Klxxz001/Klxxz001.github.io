# Yibo Liu · 刘一博

使用 [AcadHomepage](https://github.com/RayeRen/acad-homepage.github.io) 原版模板的个人学术主页，参考页面为 <https://rayeren.github.io/acad-homepage.github.io/>。沿用原有仓库与网址 <https://klxxz001.github.io/>。

直接复用上游的 SCSS、字体资源、布局和导航脚本，保留白色背景、Trebuchet MS 字体、圆形头像、章节分隔线、论文框和普通列表。内容已替换为个人资料；未提供的报告、实习、引用数与 Scholar 链接不展示。

## 本地目录

- `E:\个人主页\Klxxz001.github.io`：你的主页仓库。
- `E:\个人主页\acad-homepage-reference`：原始模板，保留用于对照。
- `E:\个人主页\预览截图`：本地预览截图。

分支：`codex/academic-homepage-redesign`。原始主页保存在 `main` 的 Git 历史中。本地修改与提交不会更新线上网站。

## 本地预览

在 PowerShell 中执行：

```powershell
cd 'E:\个人主页\Klxxz001.github.io'
.\run_server.ps1
```

打开 <http://127.0.0.1:4000/>。关闭服务时在运行服务的终端中按 Ctrl+C。

脚本优先使用 Windows 的 Bundler；没有时使用 Ubuntu WSL。本机 WSL 已配置 Ruby、Bundler 和依赖，依赖位于 WSL 用户目录。

其他常用命令：

```powershell
.\run_server.ps1 -Port 4001
.\run_server.ps1 -Build
```

Linux 或 WSL 终端使用 `bash run_server.sh`。内容修改会自动重新构建；修改 `_config.yml` 或 `Gemfile` 后重启服务。

## 修改内容

| 内容 | 文件 |
|---|---|
| 姓名、侧栏身份与单位、联系方式、头像 | `_config.yml` 中的 `author` |
| 英文与中文简介、章节结构 | `_pages/about.md` |
| 顶部导航 | `_data/navigation.yml` |
| 最新动态 | `_data/news.yml` |
| 已发表论文、作者、期刊、年份、DOI、图片 | `_data/publications.yml` |
| 工作论文（只展示题名） | `_data/working_papers.yml` |
| 研究项目 | `_data/projects.yml` |
| 教育经历 | `_data/education.yml` |
| 奖励 | `_data/awards.yml` |
| 技能 | `_data/skills.yml` |
| 原版字体、颜色和断点 | `_sass/_variables.scss` |
| 原版侧栏、导航、正文布局 | `_sass/_sidebar.scss`、`_sass/_navigation.scss`、`_sass/_page.scss` |
| 原版样式入口、论文框样式 | `assets/css/main.scss` |

`_data/research.yml` 保留详细研究方向资料，可用于继续扩写简介。

### 身份、头像与联系方式

当前身份为复旦大学大数据学院电子信息专业 **Ph.D. Student**，由北京中关村学院联合培养，导师为 Jie Feng（冯杰）与 Siming Chen（陈思明）。`author.bio` 是侧栏显示的身份与单位；正文简介及导师链接在 `_pages/about.md` 中维护。

当前头像是与模板相同圆形格式的 YL 占位图。将照片放入 `assets/images/`，再修改现有 `author.avatar`：

```yaml
avatar: "/assets/images/profile.jpg"
```

`author.github` 填用户名 `Klxxz001`，不要填整个 URL。Google Scholar、ORCID、CV 填完整链接或站内路径，留空时不展示。引用爬虫与访问统计目前未启用。

### 论文

`authors` 按真实顺序填写；与你的 `author.name` 相同的作者自动加粗。`corresponding_author: true` 添加通讯作者标记。`badge` 是图片上方的期刊简称，例如 JFM；年份读取 `year`。

当前配图使用本人提供的论文框架图，原文件位于 `E:\个人主页\论文概览图\`，对应 JFM、JEM、FRL 三篇论文。用于网站的副本保存在 `assets/images/publications/`，保留原始比例与分辨率，点击图片可查看大图。更换时更新 `image` 和 `image_alt`，避免裁剪框架图中的内容。

## 构建兼容性

Gemfile 固定 Sass Embedded 1.77.8，使原模板的 SCSS 按其原有声明顺序编译。较新 Sass 改变了嵌套声明顺序，会影响模板的桌面头像、侧栏和导航。因此升级 Sass 前需重新对照原版预览。Jekyll 使用 4.4，依赖版本保存在 Gemfile.lock。

生成的 `_site/` 无需修改或提交；样式入口是 `main.scss`，不要另建同路径的 `main.css`。

## 发布

`.github/workflows/pages.yml` 会检查 PR；推送或合并到 `main` 后构建并部署。首次使用时，在 GitHub 仓库 Settings → Pages → Build and deployment → Source 选择 GitHub Actions。

在本地预览确认效果后，推送改版分支并通过 PR 合并到 `main` 即可。网址继续为 <https://klxxz001.github.io/>。

## 来源与授权

上游版本为 `2cc1577`，MIT 授权保存在 `LICENSE`，来源与改动记录在 `NOTICE.md`。

三篇已发表论文的题名、作者顺序、期刊和 DOI 已于 2026-10-09 核对 Crossref。其余履历与成果状态沿用原主页；博士入学状态由本人确认。
