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

  delete :destroy, :with => :id do
    image = Upload.get(params[:id])
    if image
      if image.destroy
        flash[:success] = pat(:delete_success, :model => 'Upload', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'upload')
      end
      redirect url(:items, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'upload', :id => "#{params[:id]}")
      halt 404
    end
  end

end
