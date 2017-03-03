get '/meals' do
  @meals = Meal.all
  erb :'meals/index'
end

get '/meals/new' do

  erb :'meals/new'
end

get '/meals/:id' do
  @meal = Meal.find_by_id(params[:id])
  erb :'meals/show'
end

post '/meals' do

    new_meal = currentuser.meals.new(params["meal"])
    if new_meal.save

      # create new ingredients
      if params["ingredient"]
        params["ingredient"].each do |ingredient_params_array|
          item = Ingredient.find_or_initialize_by(ingredient_params_array[1])
          if !item.save
            bad_ingredients_array << item
          end
        end
      end

      # create new list items
      if params["list_item"]
        params["list_item"].count.times do |i|
          binding.pry
          item = ListItem.new(list_item_params_array[1])
            # inside here find a way to create list item through the times way, then use that i to access the list item's corresponding ingredient by the i
          if !item.save
            bad_list_item_array << item.errors_full_messages
          end
        end
      end

    else
      # this only happens if the meal has a bad name
      @errors = ["Need a name for your meal"]
    end
end





























