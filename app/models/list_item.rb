class ListItem < ActiveRecord::Base

  belongs_to :meal
  belongs_to :ingredient
  # Remember to create a migration!
end
