get '/list/:id' do
  @list = List.find(params[:id])
  @items_array = @list.generate
  erb :'lists/show'
end
