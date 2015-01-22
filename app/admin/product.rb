ActiveAdmin.register Product do

  permit_params :category_id,:name, :description,:image,:image_file_name,:price, :availability, :status

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :name, :label => "Product Name"
      f.input :description, :label => "Description"
      f.input :image, :label => "Product Image", :as => :file, :required => false,  :hint => image_tag(f.object.image.url(:medium))
      f.input :price, :label => "Price £"
      # f.input :availability, :label => "Active / Inactive"
      f.input :availability, as: :datepicker
      f.input :status, :label => "Active / Inactive"
      f.input :category
    end

    f.actions
  end

  show do |ad|
    attributes_table do
      row :name
      row :image do
        image_tag(ad.image.url(:medium))
      end
      # Will display the image on show object page
    end
  end

  index :as => :grid do |product|
    div do
      a :href => admin_product_path(product) do
        image_tag(product.image)
      end
    end
    a truncate(product.name), :href => admin_product_path(product)
  end
end
