---
layout: archive
title: "Portfolio"
permalink: /portfolio/
---

<div class="tiles">
{% for post in site.projects %}
	{% include post-grid.html %}
{% endfor %}
</div><!-- /.tiles -->
