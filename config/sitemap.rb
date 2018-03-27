SitemapGenerator::Sitemap.default_host = Settings.domain
SitemapGenerator::Sitemap.compress = false
SitemapGenerator::Sitemap.create_index = false

SitemapGenerator::Sitemap.create do

  add root_path, priority: 1, changefreq: 'daily'
  add articles_path, priority: 0.8, changefreq: 'daily'

  Article.find_each do |article|
    add article_path(article.permalink), :lastmod => article.updated_at, priority: 0.9
  end

  Category.find_each do |category|
    add category_path(category.permalink), :lastmod => category.updated_at
  end

end
