ActiveAdmin.register Goldencobra::Upload, :as => "Upload"  do
  
  menu :parent => "Content-Management", :label => "Medienverwaltung", :if => proc{can?(:read, Goldencobra::Upload)}
  
  controller.authorize_resource :class => Goldencobra::Upload
  
  form :html => { :enctype => "multipart/form-data" }  do |f|
    f.inputs class: "buttons inputs" do
      f.actions
    end
    f.inputs "File" do
      f.input :image, :as => :file
    end
    f.inputs "Allgemein" do
      f.input :source
      f.input :rights
      f.input :tag_list, :hint => "Tags sind komma-getrennte Werte, mit denen sich ein Artikel verschlagworten l&auml;sst", :label => "Liste von Tags"
      f.input :description, :input_html => { :class =>"tinymce", :rows => 3}
    end
    f.inputs class: "buttons inputs" do
      f.actions
    end
  end
  
  index do
    selectable_column
    column "url" do |upload|
      result = ""
      result << truncate(upload.image.url)
    end
#     column :image_file_name
#     column :image_content_type
#     column :image_file_size
    column :source do |upload|
    	truncate(upload.source, length: 20)
    end
    column :created_at do |upload|
    	l(upload.created_at, format: :short)
	end
    default_actions
  end
  
  sidebar :image_formates do
    ul do
      li "original => AxB>"
      li "large => 900x900>"
      li "big => 600x600>"
      li "medium => 300x300>"
      li "thumb => 100x100>"
      li "mini => 50x50>"
    end
  end
  
  batch_action :destroy, false
  
end