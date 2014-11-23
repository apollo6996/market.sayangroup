MarketSayangroup::Admin.controllers :groups do

  helpers do

    def show_cats
      @allcats = Category.all
    end
    
  end

  before do
    show_cats
  end

  get :index do
    @title = "Groups"
    @groups = Group.all
    render 'groups/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'group')
    @group = Group.new
    render 'groups/new'
  end

  post :create do
    @group = Group.new(params[:group])
    if @group.save
      @title = pat(:create_title, :model => "group #{@group.id}")
      flash[:success] = pat(:create_success, :model => 'Group')
      params[:save_and_continue] ? redirect(url(:groups, :index)) : redirect(url(:groups, :edit, :id => @group.id))
    else
      @title = pat(:create_title, :model => 'group')
      flash.now[:error] = pat(:create_error, :model => 'group')
      render 'groups/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "group #{params[:id]}")
    @group = Group.get(params[:id])
    if @group
      render 'groups/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'group', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "group #{params[:id]}")
    @group = Group.get(params[:id])
    if @group
      if @group.update(params[:group])
        flash[:success] = pat(:update_success, :model => 'Group', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:groups, :index)) :
          redirect(url(:groups, :edit, :id => @group.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'group')
        render 'groups/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'group', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Groups"
    group = Group.get(params[:id])
    if group
      if group.destroy
        flash[:success] = pat(:delete_success, :model => 'Group', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'group')
      end
      redirect url(:groups, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'group', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Groups"
    unless params[:group_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'group')
      redirect(url(:groups, :index))
    end
    ids = params[:group_ids].split(',').map(&:strip)
    groups = Group.all(:id => ids)
    
    if groups.destroy
    
      flash[:success] = pat(:destroy_many_success, :model => 'Groups', :ids => "#{ids.to_sentence}")
    end
    redirect url(:groups, :index)
  end
end
