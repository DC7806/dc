class Admin::SystemController < AdminController
  
  before_action :find_system

  def index
    @admin_system_settings = @admin_system.fetch('settings')
    @admin_system_profile = @admin_system.fetch('profile')
    @admin_system_images = @admin_system.fetch('images')  
  end

  def update_system

    data = params[:system].except('images')
      data.each do |k1, v1|
        v1.each do |k2, v2|
        @admin_system[k1][k2] = v2
      end
    end

    File.write("#{Rails.root}/config/system.yml", @admin_system.to_yaml)

    @admin_system.fetch('images').keys.each do |image|
      upload_image(:system, image)
    end 

    redirect_back(fallback_location: request.referrer)
    flash[:notice] = 'System Settings Updated'
  end

  private

  def find_system
    @admin_system = YAML::load_file("#{Rails.root}/config/system.yml")
  end

  def upload_image dir, image
    if params[dir][:images] && params[dir][:images][image] != nil
      uploaded_io = params[dir][:images][image]
      images_dir = "public/images/#{dir}"
      File.open(Rails.root.join(images_dir, uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
        File.rename(file, "#{images_dir}/#{image}.jpg")
      end
    end
  end

end