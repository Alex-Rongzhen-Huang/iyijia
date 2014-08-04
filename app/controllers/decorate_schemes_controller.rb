class DecorateSchemesController < InheritedResources::Base
  def index
    @user_profile ||= session[:user_profile]
    @order = Order.where(:user_id => current_user.id).first()
    unless @order.nil?
      @decorate_schemes = DecorateScheme.where(:order_id => @order.id).order('created_at DESC').all()
    else
      @decorate_schemes = []
    end
    @decorate_schemes = Kaminari.paginate_array(@decorate_schemes).page(params[:page]).per(2)

    respond_to do |format|
      format.html { render  :layout => 'user_admin'}# index.html.erb
      format.json { render json: @decorate_schemes }
    end
  end
  
  def show
    @decorate_schemes = DecorateScheme.where(:order_id => params[:id]).all()

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @decorate_schemes }
    end
  end

end
