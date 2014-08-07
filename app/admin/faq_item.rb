# encoding: UTF-8
ActiveAdmin.register FaqItem do
  menu :priority => 5

  form(:html => { :multipart=>true}) do |f|
    f.inputs ShowHouse.model_name.human do
      f.input :title
      f.input :description, :as => :ckeditor
    end

    f.actions
  end
end
