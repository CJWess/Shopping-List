$(document).ready(function() {

  var menuItemCount = 0
$("#new-ingredient-button").on("click", function(event){
    event.preventDefault();
    menuItemCount +=1;
  $("#ingredient-inputs").prepend("<label>Ingredient: </label><input name='ingredient[" + menuItemCount.toString() + "[name]]'> <label>Unit: </label><input name='ingredient[" + menuItemCount.toString() + "[unit_type]]'><label>Quantity: </label><input name='list_item[" + menuItemCount.toString() + "[quantity]'></input><br><br>")
  console.log("HA")
})

});
