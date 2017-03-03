class List < ActiveRecord::Base

  belongs_to :user
  has_many :ingredients, through: :list_items
  has_many :meals_lists
  has_many :meals, through: :meals_lists
  has_many :list_items, through: :meals

  def generate
    uniq_ingred = self.get_unique_ingredients
    quantities_hash = self.get_quantities
    list = []
    uniq_ingred.each do |ingredient|
      list << [ingredient.name, ingredient.unit_type, quantities_hash[ingredient.name]]
    end
    list
  end

  def get_quantities
    quantities_hash = {}
    self.meals.each do |meal|
      meal.list_items.each do |list_item|
        if quantities_hash.has_key?(list_item.ingredient.name)
          quantities_hash[list_item.ingredient.name] += list_item.quantity
        else
          quantities_hash[list_item.ingredient.name] = list_item.quantity
        end
      end
    end
    quantities_hash
  end

  def get_unique_ingredients
    unique_ingredients = []
    self.meals.each do |meal|
      meal.ingredients.each do |ingredient|
        unique_ingredients << ingredient
      end
    end
    unique_ingredients = unique_ingredients.uniq

  end

end
