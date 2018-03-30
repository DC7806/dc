class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :global_settings


  protected
  # devise
  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  # seo
  def page_meta page = nil
    if action_name == 'show'
      @title = page.metum.title
      @meta_desc = page.metum.meta_description
      @og = { site_name:   @site_name,
              type:        page.class.name.downcase,
              title:       page.metum.title,
              url:         request.url,
              description: page.metum.meta_description,
              image:       (root_url + page.metum.og_image.url if page.metum.og_image.url.present?)}
    elsif action_name == 'index'
      @title = Metum.find_page(controller_name).title
      @meta_desc = Metum.find_page(controller_name).meta_description
      @og = { site_name:   @site_name,
              type:        controller_name,
              title:       Metum.find_page(controller_name).og_title,
              url:         request.url,
              description: Metum.find_page(controller_name).og_description,
              image:       (root_url + Metum.find_page(controller_name).og_image.url if Metum.find_page(controller_name).og_image.url.present?)}              
    elsif controller_name == 'pages'
      @title = Metum.find_page(action_name).title
      @meta_desc = Metum.find_page(action_name).meta_description
      @og = { site_name:   @site_name,
              type:        action_name,
              title:       Metum.find_page(action_name).og_title,
              url:         request.url,
              description: Metum.find_page(action_name).og_description,
              image:       (root_url+Metum.find_page(action_name).og_image.url if Metum.find_page(action_name).og_image.url.present?)}
    end
  end

  private

  def global_settings
    @categories = Category.all
    settings = YAML::load_file("#{Rails.root}/config/system.yml")
    @site_name = settings['settings']['site_name']
    @gtm_id = settings['settings']['gtm_id']
    @ga_id = settings['settings']['ga_id']
    @favicon = settings['images']['favicon']
  end

end
