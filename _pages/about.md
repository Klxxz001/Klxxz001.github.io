---
permalink: /
title: "Yibo Liu"
description: "Yibo Liu is a Ph.D. student at the School of Data Science, Fudan University, researching spatial intelligence, agentic AI, and urban science."
author_profile: true
redirect_from:
  - /about/
  - /about.html
---

<span class='anchor' id='about-me'></span>

I am a **Ph.D. student in Electronic Information at the School of Data Science, Fudan University**, in a joint training program with **Beijing Zhongguancun Academy**. I am co-supervised by Prof. [Jie Feng](https://vonfeng.github.io/) (Beijing Zhongguancun Academy) and Prof. [Siming Chen](http://simingchen.me/) (School of Data Science, Fudan University). Previously, I received my M.A. in Public Policy from Lanzhou University and my B.A. in Land Resource Management from Renmin University of China.

My current research focuses on **spatial intelligence, agentic AI, and urban science**. I am interested in systems that understand, simulate, and act in open real-world environments, especially cities. My interests include multimodal spatial reasoning, world models and embodied intelligence, multi-agent collaboration, and social simulation, with applications in urban governance and public services.

Previously, I worked on **computational social science and environmental finance**, focusing on climate and financial risks, spatial spillovers, and policy evaluation.

<p lang="zh-CN">目前，我的研究聚焦空间智能、智能体与城市科学，探索能够理解、模拟并在真实环境中行动的智能系统，重点关注多模态空间推理、世界模型与具身智能、多智能体协作和社会模拟，服务于城市治理与公共服务。此前主要从事计算社会科学、环境金融、气候与金融风险、空间溢出及政策效应评估研究。</p>

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

**Working papers**

{% for paper in site.data.working_papers %}- {{ paper.title }}.
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
