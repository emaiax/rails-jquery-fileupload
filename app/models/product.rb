class Product < ActiveRecord::Base
  attr_accessible :title, :token
  validates :title, :token, presence: true
  has_many :pictures, :dependent => :destroy

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64
      break random_token unless Product.where(token: random_token).exists?
    end
  end
end
