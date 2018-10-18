class Dog < ApplicationRecord
  validates :breed, presence: true
  belongs_to :owner
end
