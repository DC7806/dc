class PagesController < ApplicationController
  before_action :page_meta
  def home
    profile = YAML::load_file("#{Rails.root}/config/system.yml")
    @name = profile['profile']['name']
    @email = profile['profile']['email']
    @summary = profile['profile']['summary'].html_safe
    @picture = profile['images']['profile']
    @github_handle = profile['profile']['github']
    @articles = Article.order(created_at: :desc).last(6)
    @portfolios = Portfolio.order(created_at: :desc).last(2)
  end
end
