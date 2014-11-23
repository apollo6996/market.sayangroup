MarketSayangroup::Admin.controllers :features do

    helpers do

    def show_groups
      @allgroups = Group.all
    end
    
  end

  before do
    show_groups
  end

  get :index do
    @title = "Features"
    @features = Feature.all
    render 'features/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'feature')
    @feature = Feature.new
    render 'features/new'
  end

  post :create do
    @feature = Feature.new(params[:feature])
    if @feature.save
      @title = pat(:create_title, :model => "feature #{@feature.id}")
      flash[:success] = pat(:create_success, :model => 'Feature')
      params[:save_and_continue] ? redirect(url(:features, :index)) : redirect(url(:features, :edit, :id => @feature.id))
    else
      @title = pat(:create_title, :model => 'feature')
      flash.now[:error] = pat(:create_error, :model => 'feature')
      render 'features/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "feature #{params[:id]}")
    @feature = Feature.get(params[:id])
    if @feature
      render 'features/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'feature', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "feature #{params[:id]}")
    @feature = Feature.get(params[:id])
    if @feature
      if @feature.update(params[:feature])
        flash[:success] = pat(:update_success, :model => 'Feature', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:features, :index)) :
          redirect(url(:features, :edit, :id => @feature.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'feature')
        render 'features/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'feature', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Features"
    feature = Feature.get(params[:id])
    if feature
      if feature.destroy
        flash[:success] = pat(:delete_success, :model => 'Feature', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'feature')
      end
      redirect url(:features, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'feature', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Features"
    unless params[:feature_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'feature')
      redirect(url(:features, :index))
    end
    ids = params[:feature_ids].split(',').map(&:strip)
    features = Feature.all(:id => ids)
    
    if features.destroy
    
      flash[:success] = pat(:destroy_many_success, :model => 'Features', :ids => "#{ids.to_sentence}")
    end
    redirect url(:features, :index)
  end
end
