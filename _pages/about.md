---
permalink: /
title: "Yibo Liu"
redirect_from:
  - /about/
  - /about.html
---

<section id="about" class="content-section about-section" aria-labelledby="about-title">
  <p class="section-eyebrow">About me</p>
  <h1 id="about-title">Understanding space,<br class="desktop-break"> policy, and risk.</h1>
  <p class="intro-lead">I study spatial interactions, risk transmission, and policy effects in complex socio-economic systems.</p>
  <div class="about-copy">
    <p>I am a <strong>Ph.D. student in Intelligent Science and Technology at Fudan University</strong>, in a joint training program with <strong>Beijing Zhongguancun Academy</strong>. Previously, I received my M.A. in Public Policy from Lanzhou University and my B.A. in Land Resource Management from Renmin University of China.</p>
    <p>My research connects computational social science, spatial intelligence, and environmental finance. I combine econometrics, machine learning, GIS, and network-based risk models to examine nonlinear relationships and spillovers across cities, regions, and financial markets.</p>
  </div>
  <details class="chinese-intro">
    <summary><span lang="zh-CN">中文简介</span><span class="details-indicator" aria-hidden="true">+</span></summary>
    <div lang="zh-CN">
      <p>我是复旦大学智能科学与技术专业博士生，参与北京中关村学院联合培养项目。此前获得兰州大学公共政策硕士学位与中国人民大学土地资源管理学士学位。</p>
      <p>我的研究关注复杂社会经济系统中的空间交互、风险传导与政策效应评估，结合空间计量经济学、机器学习、GIS 空间分析与 CoVaR 风险网络，研究环境风险、碳排放政策、能源市场、城市系统与金融市场之间的非线性关系和空间溢出机制。</p>
    </div>
  </details>
</section>

<section id="research" class="content-section" aria-labelledby="research-title">
  <div class="section-heading"><h2 id="research-title">Research interests</h2><span class="section-index">01</span></div>
  <div class="research-grid">
    {% for area in site.data.research %}
    <article class="research-area">
      <span class="research-number">{{ area.number }}</span>
      <h3>{{ area.title }}</h3>
      <p class="research-subtitle">{{ area.subtitle }}</p>
      <p class="research-description">{{ area.description }}</p>
      <p class="research-methods">{{ area.methods | join: ' · ' }}</p>
    </article>
    {% endfor %}
  </div>
</section>

<section id="publications" class="content-section" aria-labelledby="publications-title">
  <div class="section-heading"><h2 id="publications-title">Selected publications</h2><span class="section-index">02</span></div>
  <p class="section-note">Journal articles on environmental risks, financial networks, and spatial policy effects. <span class="corresponding-note">* Corresponding author.</span></p>
  <div class="publication-list">
    {% for paper in site.data.publications %}
    {% include publication.html paper=paper %}
    {% endfor %}
  </div>
  <div class="work-in-progress">
    <h3>Work in progress</h3>
    <ul class="working-paper-list">
      {% for paper in site.data.working_papers %}
      <li>
        <span class="status-badge{% if paper.status == 'Working paper' %} working{% endif %}">{{ paper.status }}</span>
        <div><p>{{ paper.title }}</p>{% if paper.role %}<span class="working-paper-role">{{ paper.role }}</span>{% endif %}</div>
      </li>
      {% endfor %}
    </ul>
  </div>
</section>

<section id="projects" class="content-section" aria-labelledby="projects-title">
  <div class="section-heading"><h2 id="projects-title">Research projects</h2><span class="section-index">03</span></div>
  <div class="project-list">
    {% for project in site.data.projects %}
    <article class="project-item">
      <div class="project-meta"><span>{{ project.period }}</span><span>{{ project.role }}</span></div>
      <h3>{{ project.title }}</h3>
      <p>{{ project.description }}</p>
      <div class="project-tags">{% for tag in project.tags %}<span>{{ tag }}</span>{% endfor %}</div>
    </article>
    {% endfor %}
  </div>
</section>

<section id="education" class="content-section" aria-labelledby="education-title">
  <div class="section-heading"><h2 id="education-title">Education</h2><span class="section-index">04</span></div>
  <ol class="education-timeline">
    {% for education in site.data.education %}
    <li{% if education.current %} class="current"{% endif %}>
      <span class="timeline-dot" aria-hidden="true"></span>
      <div class="education-header"><h3>{{ education.institution }}</h3><span>{{ education.period }}</span></div>
      <p class="education-degree">{{ education.degree }}</p>
      <p class="education-detail">{{ education.detail }}</p>
    </li>
    {% endfor %}
  </ol>
</section>

<section id="honors" class="content-section" aria-labelledby="honors-title">
  <div class="section-heading"><h2 id="honors-title">Honors &amp; activities</h2><span class="section-index">05</span></div>
  <ul class="awards-list">
    {% for award in site.data.awards %}
    <li><span class="award-year">{{ award.year }}</span><div><h3>{{ award.title }}</h3><p>{{ award.organization }}</p></div></li>
    {% endfor %}
  </ul>
</section>

<section id="contact" class="contact-section" aria-labelledby="contact-title">
  <div><p class="section-eyebrow">Get in touch</p><h2 id="contact-title">Research, ideas, and collaboration.</h2><p>I welcome conversations about shared research interests.</p></div>
  <a href="mailto:{{ site.author.email }}">{{ site.author.email }} <span aria-hidden="true">↗</span></a>
</section>
