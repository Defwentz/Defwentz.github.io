module Jekyll
  class CategoryPage < Page
    def initialize(site, base, dir, category, posts)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'category.html')
      self.data['category'] = category

      # category_title_prefix = site.config['category_title_prefix'] || 'Category: '
      self.data['title'] = "#{category}" # "#{category_title_prefix}#{category}"
      
      self.data['posts'] = posts
    end
  end

  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'category'
        posts_group_by_category(site).each do |category, list|
          site.pages << CategoryPage.new(site, site.source, File.join('/', category), category, list)
        end
      end
    end
    
    def posts_group_by_category(site)
      category_map = {}
        site.posts.docs.each do |p|
          p['categories'].each do |c|
            (category_map[c] ||= []) << p
          end
        end
      category_map
    end
    
  end
end