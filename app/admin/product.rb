ActiveAdmin.register Product do

  permit_params :category_id,:name, :description,:image,:price, :availability, :status

  form do |f|
    f.inputs do
      f.input :name, :label => "Product Name"
      f.input :description, :label => "Description"
      f.input :image, :label => "Product Image"
      f.input :price, :label => "Price £"
      # f.input :availability, :label => "Active / Inactive"
      f.input :availability, as: :datepicker
      f.input :status, :label => "Active / Inactive"
      f.input :category
    end

    f.actions
  end
end
