---
layout: article
title:  "Using Github Pages and Jekyll to build website"
date:   2018-02-17 14:52:52 -0400
categories: web-development
tags: cn
permalink: /:categories/:title
comments: true

image:
  teaser: logo-jekyll-teaser.png
  feature: logo-jekyll.png
---

Why am I writing this?
-
There is a lot of tutorials out there, but I feel like I still took a lot of wrong turns when doing my own websites. So I would like to write these down, at the very least to keep myself from taking those wrong turns again.

Basics
-
Github Pages is a static site hosting service.[^1] 
All you have is what's in the repo, you can't dynamically store or change stuff. But you could still have a lot of features with the help from third party services, for example, I use disqus for comments feature in my website.

Jekyll is an open-source static site generator.[^2] Github Pages are powered by Jekyll, so to do anything with it, you need to use Jekyll. However, there is an option to bypass Jekyll, you can build your site locally, and then push it to the repo.

Steps to using your own plugins
-
There is lot of nice things you can do if you can write code, you can generate category index pages, for example. Jekyll has a plugin system that allows you to create custom genereated content. The Jekyll documents is pretty clear with how you do things.[^3]

Because your own plugin will be considered unsafe, Github won't run your code. But you could build your site locally and then push it to your repo.[^4]

1. build your site with Jekyll
2. take out the content in _site folder
3. update your publishing branch with content in your _site folder
4. add a file called ".noJekyll", this will let you bypass Github Pages' Jekyll build.
5. push it to github

Some Problems I ran into
-

Q: Jekyll isn't running my code.

A: Check your Gemfile and see if you're using github-pages gem. If you are, Jekyll will not be running your code, because they're not considered safe.

Q: Jekyll is overriding my "site.url" with "localhost".

A: You need to add addition stuff in your build command, `bundle exec Jekyll build Jekyll_ENV=production`.

Reference
-
[^1]: [What is Github Pages?](https://help.github.com/articles/what-is-github-pages/)
[^2]: [Jekyll's Github repo](https://github.com/Jekyll/Jekyll)
[^3]: [Jekyll Plugins](https://Jekyllrb.com/docs/plugins/)
[^4]: [Adding Jekyll plugins to a GitHub Pages site](https://help.github.com/articles/adding-Jekyll-plugins-to-a-github-pages-site/)