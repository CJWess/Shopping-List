class MealsList < ActiveRecord::Base

  belongs_to :meal
  belongs_to :list
end
