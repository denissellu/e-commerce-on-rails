require 'rails_helper'
products_path = '/products'
describe "Products", :type => :request do
  describe "GET /products" do
    it "display products" do
      get products_path
      expect(response.body).to include('Test product')
    end
  end
end
