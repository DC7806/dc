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

  def meta_desc_tag(desc)
    tag(:meta, name: 'description', content: desc) unless desc.nil?
  end

  def og_tag(hsh)
    hsh.map {|key, value| tag(:meta, property: "og:#{key}" , content: value)}.inject(&:+) if hsh.present?
  end

end