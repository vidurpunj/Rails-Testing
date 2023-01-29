class Book < ApplicationRecord
  validates :name, presence: true
  validates :language, presence: true
end
