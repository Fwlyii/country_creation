# PI OS 高密部署智能体沙箱引擎命题解决方案

沿用天津大学报告 LaTeX 模板，按 2026-09-18 提供的新版计划书文字与格式清单更新。

## 查看与修改

- `build/main.pdf`：编译完成的计划书。
- `main.tex`：编译入口。
- `body/chapter1.tex` 至 `body/chapter8.tex`：八章正文。
- `body/appendix.tex`：证明材料与成果边界说明。
- `修改说明.md`：本次迁移与需要补充的原始资料。
- `图片对应表.json`：正文图号、所供图片与新增示意图的对应关系。

## 编译

必须使用 XeLaTeX。字体沿用宋体与黑体、西文 Times New Roman，正文 12 pt、1.5 倍行距、首行两字缩进、A4 分章排版。

```bash
./build.sh
```

脚本优先使用环境中的 latexmk / xelatex，也支持本机 Windows MiKTeX 的 WSL 路径。手动编译时运行 2—3 次以刷新目录和交叉引用：

```bash
mkdir -p build/body build/setup
xelatex -interaction=nonstopmode -halt-on-error -file-line-error -output-directory=build main.tex
```

目录两页，按罗马数字编页；正文按阿拉伯数字分别编页。全部页面统一为 A4 纵向；长表重复表头，培训、成长与访谈表按完整记录分组。详见 `布局检查说明.md`。

正文含 29 组编号图、32 张编号表，另有一个政策依据注释块及四份证明材料。15 张所供图稿全部按内容插入；6 张缺失的新图采用 LaTeX 矢量示意图，依据正文表格整理。图 3-7 的两幅原图合并为 (a)/(b)。评分索引图中部分对应与文字表不一致，图注明确以表 1-1 为准。

日期、访谈量化数字等“待填/待核”事项如实保留，详见修改说明。
