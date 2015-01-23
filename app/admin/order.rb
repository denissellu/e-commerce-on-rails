ActiveAdmin.register Order do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  actions :index, :show

  scope :basket, :default => true
  scope :address
  scope :complete
  BASKET = "basket"
  COMPLETE = "complete"
  ADDRESS = "address"
  index do

    column("Order", :sortable => :id) {|order| link_to "##{order.id} ", admin_order_path(order) }
    column("Status")  {|order| 
    if order.status == 1
      status = BASKET
    elsif order.status == 2
      status =  ADDRESS
    elsif order.status == 3
      status =  COMPLETE
    end
      status_tag(status) }
    column("Date", :checked_out_at)
    column("User", :user, :sortable => :user_id)
    column("Total") {|order| number_to_currency order.total_price }
  end

  show do
    panel "Invoice" do
      table_for(order.orders_products) do |t|
        t.column("Product") {|item| auto_link item.product        }
        t.column("Price")   {|item| number_to_currency item.price }
        tr :class => "odd" do
          td "Total:", :style => "text-align: right;"
          td number_to_currency(order.total_price)
        end
      end
    end
  end

  sidebar :customer_information, :only => :show do
    attributes_table_for order.user do
      row("User") { auto_link order.user }
      row :email
    end
  end

end
