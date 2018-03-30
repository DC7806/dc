module ApplicationHelper

  def nav_categories (cat)
    cat.map do |c|
      if c.articles.count > 0
        content_tag :li do
          link_to c.name, category_path(c.permalink)
        end
      end
    end.reject{ |e| e.nil? }.reduce(&:+)
  end

  def page_title site_name, title
    if action_name == 'home'
      content_tag :title, site_name
    else
      content_tag :title, "#{title} | #{site_name}"
    end
  end

  def meta_desc_tag(desc)
    tag(:meta, name: 'description', content: desc) unless desc.nil?
  end

  def og_tag(hsh)
    hsh.map {|key, value| tag(:meta, property: "og:#{key}" , content: value)}.inject(&:+) if hsh.present?
  end

  def tracking_tags gtm, ga
    {'gtm': gtm,'ga': ga}.map do |key, value|
      render "tracking/#{key}" if value.present?
    end.join.html_safe
  end

end