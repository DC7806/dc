module PortfoliosHelper
  
  def repo_link obj
    if obj.present?
      link_to "https://github.com/DC7806/#{obj}", target: '_blank', class: 'btn btn-default mb-xs-5 ml-sm-10' do
        content_tag :i, class: 'fa fa-github fa-2x fa-fw'
      end
    end
  end

end