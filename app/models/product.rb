class Product < ActiveRecord::Base
  belongs_to :category

  scope :active, lambda {where(:status => true)}
  scope :inactive, lambda {where(:status => false)}
  scope :available?, lambda{ where("availability < ?", Date.today) }
  # scope :find_available, lambda {|id| {}}

  validates :name, :presence => true,
    :length => { :maximum => 50 }
  validates_presence_of :price
  attr_accessor :image_file_name, :image_content_type, :image_file_size, :image_updated_at


  has_attached_file :image, styles: {
    thumb: '100x100>',
    medium: '350x260>'
  },
    :default_url => "http://placehold.it/350x261"

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => ["image/jpeg", "image/gif", "image/png"]

end
