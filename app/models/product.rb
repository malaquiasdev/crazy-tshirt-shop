class Product < ApplicationRecord
  validates(:name, presence:true, length: { minimum: 5 })
  validates(:count, presence:true)
  validates(:price, presence:true)
end
