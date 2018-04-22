class Product < ApplicationRecord
  belongs_to :department

  validates(:name, presence:true, length: { minimum: 5 })
  validates(:count, presence:true)
  validates(:price, presence:true)
end
