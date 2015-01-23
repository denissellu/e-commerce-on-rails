class Basket < ApplicationMailer

  def order_complete_mail(order)
    @order = order
    mail(to: "hingasellu@gmail.com", subject: 'New order')
  end
end
