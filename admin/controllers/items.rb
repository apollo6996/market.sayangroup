MarketSayangroup::Admin.controllers :items do
  
  helpers do

    def show_cats
      @allcats = Category.all
    end

    def related_attrs
      @attrs = {
        1 => ["material", "adjrange", "color"],
        2 => ["material", "adjrange", "weigth"],
        3 => ["material", "adjrange", "gabarits"],
        4 => ["material", "adjrange", "power"]
      }
    end

    def show_attrs
      @getattrs = @attrs[@attrs_hash]
    end

    def upload_image
      @image = @item.uploads.new(:item_id => @item.id)
      @image.file = params[:file]
      @image.save
    end

    def get_image
        @image = Upload.all(:item_id => params[:id])
      end
  end

  before do
    show_cats
    related_attrs
  end

  get :index do
    @title = "Товары"
    @items = Item.all
    render 'items/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'item')
    @item = Item.new
    render 'items/new'
  end

  post :create do
    @item = Item.new(params[:item])
    if @item.save
      upload_image
      @title = pat(:create_title, :model => "item #{@item.id}")
      flash[:success] = pat(:create_success, :model => 'Item')
      params[:save_and_continue] ? redirect(url(:items, :index)) : redirect(url(:items, :edit, :id => @item.id))
    else
      @title = pat(:create_title, :model => 'item')
      flash.now[:error] = pat(:create_error, :model => 'item')
      render 'items/new'
    end
  end

  post :show_related_attrs, :csrf_protection => false do
    @attrs_hash = params[:value]
  end

  get :show_related_attrs do
    show_attrs
    render :'items/attrs', :layout => false
  end

  get :edit, :with => :id do
    get_image
    @title = pat(:edit_title, :model => "item #{params[:id]}")
    @item = Item.get(params[:id])
    if @item
      render 'items/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'item', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    get_image
    @title = pat(:update_title, :model => "item #{params[:id]}")
    @item = Item.get(params[:id])
    if @item
      upload_image
      if @item.update(params[:item])
        flash[:success] = pat(:update_success, :model => 'Item', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:items, :index)) :
          redirect(url(:items, :edit, :id => @item.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'item')
        render 'items/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'item', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Items"
    item = Item.get(params[:id])
    if item
      if item.destroy
        flash[:success] = pat(:delete_success, :model => 'Item', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'item')
      end
      redirect url(:items, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'item', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Items"
    unless params[:item_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'item')
      redirect(url(:items, :index))
    end
    ids = params[:item_ids].split(',').map(&:strip)
    items = Item.all(:id => ids)
    
    if items.destroy
    
      flash[:success] = pat(:destroy_many_success, :model => 'Items', :ids => "#{ids.to_sentence}")
    end
    redirect url(:items, :index)
  end
end
