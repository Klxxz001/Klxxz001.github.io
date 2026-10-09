---
permalink: /
title: "Yibo Liu"
description: "Yibo Liu is a Ph.D. student at Fudan University working on computational social science, spatial intelligence, environmental finance, and risk transmission."
author_profile: true
redirect_from:
  - /about/
  - /about.html
---

<span class='anchor' id='about-me'></span>

I am a **Ph.D. student in Intelligent Science and Technology at Fudan University**, in a joint training program with **Beijing Zhongguancun Academy**. Previously, I received my M.A. in Public Policy from Lanzhou University and my B.A. in Land Resource Management from Renmin University of China.

My research interests include **computational social science, spatial intelligence, urban computing, and environmental finance**. I study spatial interactions, risk transmission, and policy effects in complex socio-economic systems. I combine econometrics, machine learning, GIS, and network-based risk models to examine nonlinear relationships and spillovers across cities, regions, and financial markets.

<p lang="zh-CN">我的研究关注复杂社会经济系统中的空间交互、风险传导与政策效应评估，结合空间计量经济学、机器学习、GIS 空间分析与 CoVaR 风险网络，研究环境风险、碳排放政策、能源市场、城市系统与金融市场之间的非线性关系和空间溢出机制。</p>

# 🔥 News
{: #news}

{% for item in site.data.news %}- *{{ item.date }}*: &nbsp;{{ item.text }}
{% endfor %}

# 📝 Publications
{: #publications}

\* Corresponding author.

{% for paper in site.data.publications %}
{% include publication.html paper=paper %}
{% endfor %}

**Under review**

{% assign under_review = site.data.working_papers | where: 'status', 'Under review' %}
{% for paper in under_review %}- {{ paper.title }}. *{{ paper.target_journal }}*. {{ paper.role }}.
{% endfor %}

**Working papers**

{% assign working_papers = site.data.working_papers | where: 'status', 'Working paper' %}
{% for paper in working_papers %}- {{ paper.title }}.
{% endfor %}

# 🎖 Honors and Awards
{: #honors}

{% for award in site.data.awards %}- *{{ award.year }}*, {{ award.title }}, {{ award.organization }}.
{% endfor %}

# 📖 Educations
{: #education}

{% for education in site.data.education %}- *{{ education.period }}*, {{ education.institution }}, {{ education.degree }}. {{ education.detail }}
{% endfor %}

# 💻 Research Projects
{: #projects}

{% for project in site.data.projects %}- *{{ project.period }}*, {{ project.full_title | default: project.title }}. **{{ project.role }}**. {{ project.description }}
{% endfor %}

# 🛠 Skills
{: #skills}

{% for skill in site.data.skills %}- **{{ skill.title }}**: {{ skill.description }}
{% endfor %}

# ✉️ Contact
{: #contact}

Email: [{{ site.author.email }}](mailto:{{ site.author.email }})<br>
GitHub: [{{ site.author.github }}](https://github.com/{{ site.author.github }})
