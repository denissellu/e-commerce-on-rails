ActiveAdmin.register Category do

  permit_params :parent_id,:name, :status,:visible_homepage 
end
