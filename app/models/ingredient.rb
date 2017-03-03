class Ingredient < ActiveRecord::Base

  has_many :list_items
  has_many :meals, through: :list_items
  # Remember to create a migration!
  validates_presence_of :name, :unit_type

end
