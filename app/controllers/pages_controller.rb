class PagesController < ApplicationController
  before_action :page_meta, only: :home
  def home
    profile = YAML::load_file("#{Rails.root}/config/system.yml")
    @name = profile['profile']['name']
    @email = profile['profile']['email']
    @summary = profile['profile']['summary'].html_safe
    @picture = profile['images']['profile']
    @github_handle = profile['profile']['github']
    @articles = Article.order(created_at: :desc).first(6)
    @portfolios = Portfolio.order(sort: :asc).first(4)
  end


  def resume
    @title = 'Resume'
  end

  def resume_en
    @title = 'Resume EN'
  end

  def resume_zh
    @title = '工作經驗'
  end

end
