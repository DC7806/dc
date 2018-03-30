['home', 'articles'].each do |page|
  Metum.create(page: page)
end

dir_name = "public/images/system"
Dir.mkdir(dir_name) unless File.exists?(dir_name)