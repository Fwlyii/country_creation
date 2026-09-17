# tju_course_design_report_template

#### 项目介绍
天津大学软件学院专业课程设计2结课报告模板

#### 环境配置

推荐使用 VS Code + Latex Workshop（VsCode插件） + Texlive进行撰写。

#### 使用说明

tjumain.tex                     主模板文件

body/                           在此文件夹下编写论文各章节内容

body文件夹下的文件需要在tjumain.tex的相应位置添加引用
```
	\include{body/intros}
	\include{body/figures}
	\include{body/tables}
	\include{body/equations}
	\include{body/others}
	\include{body/conclusion}
```

figure/*                        文中所使用的图片

setup/info.tex                  封面和页眉的基本信息

---

## 《高密部署智能体沙箱引擎技术解决方案》迁移版

本目录已用于承载由 `../docs`（原报告工程）迁移而来的完整报告：
正文全部内容保留，并按原文的排版风格（封面、标题、字体、页眉页脚、目录）重排。

### 目录结构

```
main.tex               编译入口（\input{tjumain}）
latexmkrc              latexmk 配置：xelatex + 输出到 build/
tjumain.tex            主模板文件（ctexbook + xeCJK，章节引用，载入 setup/*）
setup/info.tex         报告标题与页眉文字（+ 天大封面字段，暂未使用）
setup/format.tex       版式定义：字体、标题、目录、页眉页脚、封面
setup/report.tex       迁移来的表格配色、图表题注、列表版式
setup/toc.tex          目录
body/chapter1..8.tex   正文八章
body/appendix.tex      证明材料（不编号章，含 4 页扫描证明）
body/template-samples/ 模板自带示例章节（不再被引用，保留备查）
figures/               报告全部插图 + 模板自带示例插图
```

### 编译方式（必须使用 xelatex）

模板基于 xeCJK，字体设置为与原报告相同的 **Aptos + 微软雅黑**，因此必须用 xelatex：

```bash
latexmk                                        # 已由 latexmkrc 配置好
# 或手动（重复 2–3 次以生成目录与“共 N 页”）
xelatex -output-directory=build main.tex
```

生成结果：`build/main.pdf`（封面 1 页 + 目录 4 页 + 正文 61 页，共 66 页）。

### 与原报告 PDF 保持一致的部分

| 项目 | 说明 |
|---|---|
| 封面 | 直接使用原报告第一页整页图像 `figures/cover-word.png`（`\makecover` + eso-pic） |
| 字体 | 西文 Aptos、中文微软雅黑，与原报告完全相同 |
| 标题 | 一级 18 pt / 二级 14 pt / 三级 11.5 pt，加粗、左对齐，编号仍为「第一章 / 1.1 / 3.1.1」 |
| 正文 | 10.5 pt 字号、15.225 pt 行距（1.45 倍）、首行缩进 2 字符 |
| 页眉页脚 | 灰色（#556B7A）小字：「PI OS 高密部署智能体沙箱引擎技术解决方案 中国国际大学生创新大赛 2026 产业赛道」／「第 X 页 共 Y 页」 |
| 目录 | 一级蓝色（#143D59）加粗 11 pt，二三级黑色 9.5 pt，三级目录 |
| 页码 | 封面不编号，目录与正文连续编号（与原报告相同） |
| 图表 | 图题在下 9.5 pt 常规、表题在上 9.5 pt 加粗，编号为「图 3-1 / 表 6-1」 |

### 迁移说明

- 原报告的 `第X章`、`X.Y`、`X.Y.Z` 编号在源文件中已去掉，改由 LaTeX 自动编号，
  渲染结果与原文完全一致（`setup/format.tex` 中的 `\chaptername` 负责「第X章」）。
- 图片由 `center + \WordFigureCaption` 改为 `figure[H] + \caption`；
  超出版心的图片按比例缩小（宽 ≤ 5.6in、高 ≤ 8.6in）。
- 表格题注由 `\caption*{表 6-1 ...}` 改为 `\caption{...}`，表号自动生成。
- 附录“证明材料”为不编号章，题注用 `\caption*` 保持不编号。
- 章节一律另起一页（天大模板惯例）；若需像原报告那样连续排版，可对 `\chapter` 去掉分页。

### 换回天大模板封面

`setup/info.tex` 中的 `\caffil \csubject \cgrade \cauthor \cstuid` 仍是占位符。
如需使用天大封面，把 `setup/format.tex` 里的 `\makecover` 换回天大版本（见 git 历史），
并填写上述字段即可。

#### 如何参与贡献

1. Fork 本项目
2. 新建分支
3. 提交代码
4. 创建 Pull Request