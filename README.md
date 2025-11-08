# 文学家集 — 静态站点

这是一个本地静态网站，包含若干 HTML 页面和图片。以下说明帮助你将本站点发布到 GitHub Pages 并在搜索引擎中被索引。

## 已添加
- `.github/workflows/deploy-pages.yml` — GitHub Actions 工作流：推送到 `main` 时会把仓库内容发布到 GitHub Pages。
- `03.html` 已加入 favicon 引用（`img/小图标.svg`）。

## 快速部署到 GitHub
1. 在 GitHub 上创建一个新的仓库（例如 `your-username/your-repo`）。不要初始化 README 或 .gitignore（可选）。
2. 在本地仓库根目录执行：

```powershell
# 进入项目目录
Set-Location -Path 'D:\vscode\homework\Let us study!'
# 关联远程仓库（替换为你的仓库 URL）
git remote add origin https://github.com/your-username/your-repo.git
# 推送到 main
git push -u origin main
```

3. 推送后，GitHub Actions 会触发工作流并把站点内容部署到 GitHub Pages。你可以在仓库的 "Settings > Pages" 页面查看站点 URL（通常为 `https://<your-username>.github.io/<repo>/` 或 `https://<your-username>.github.io/`，取决于仓库类型）。

## 提交 sitemap 到搜索引擎
1. 在部署并访问到你的 Pages URL 后，将 `sitemap.xml` 的完整 URL（例如 `https://<your-username>.github.io/<repo>/sitemap.xml`）提交到 Google Search Console 和 Bing Webmaster Tools。

## 可选改进
- 为更广泛的兼容性生成 `favicon.ico` 或 PNG 后备图标并放在项目根。
- 在每个 HTML 页面添加相同的 favicon 引用（我可以帮你批量添加）。

---

如果你需要我代为把文件推到远程（需要你提供仓库 URL 或生成一个新的仓库），我也可以继续操作并验证 GitHub Pages 已部署。