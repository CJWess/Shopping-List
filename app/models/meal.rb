class Meal < ActiveRecord::Base

 belongs_to :user
 has_many :list_items
 has_many :ingredients, through: :list_items

 validates_presence_of :name, message:"Meal needs a name"
end
