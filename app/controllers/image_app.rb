MarketSayangroup::App.controllers :image do
  
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
  
  get :get_images do

  end

  post :new_image do
    upload_image
    redirect url(:index)
  end

  get :destroy, :with => [:id, :item_id] do
    image = Upload.get(params[:id])
    item = Item.get(params[:item_id])
    if image
      if image.destroy
        flash[:success] 
        redirect url('/admin/items/edit/'"#{item.id}")
      else
        flash[:error]
      end
    else
    end
  end

end
