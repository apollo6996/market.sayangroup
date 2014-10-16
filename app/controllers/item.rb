MarketSayangroup::App.controllers :item do
  
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  
before do
end

get :get_item, :with => :id do
  get_item_and_image
  render 'item/item'
end

#get :index do
#  slim :show_catalog
#end

end
