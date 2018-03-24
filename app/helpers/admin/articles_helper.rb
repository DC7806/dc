module Admin::ArticlesHelper

  def checkbox(model)
    collection_check_boxes(:admin_article, :"#{model.name.underscore}_ids", model.all, :id, :name) do |b|
      b.label class: "btn btn-default btn-checkbox" do
      (b.check_box)+
      (content_tag :span, b.text)
      end
    end
  end

end
