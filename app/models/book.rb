class Book < ActiveRecord::Base
  has_and_belongs_to_many :authors
  belongs_to :publisher

  has_attached_file :cover_image,
    :styles => { :medium => "300x300", :thumb => "100x100"},
    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :cover_image,
    :content_type => /\Aimage\/.*\Z/

  validates_length_of :title, :in => 1..255
  validates :publisher, :presence => true
  validates :authors, :presence => true
  validates :published_at, :presence => true
  validates_numericality_of :page_count, :only_integer => true
  validates_numericality_of :price
  validates_format_of :isbn, :with => /[0-9\-xX]{13}/
  validates_uniqueness_of :isbn
  # roughly speaking sets list of model protected attributes to []
  # making all attributes accessible while mass-assignment
  attr_protected
  
  has_many :cart_items
  has_many :carts, :through => :cart_items

  def self.latest
    last(10)
  end
end
