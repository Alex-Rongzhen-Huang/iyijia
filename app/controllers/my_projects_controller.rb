class MyProjectsController < InheritedResources::Base
  def index
    @user_profile ||= session[:user_profile]

    @order = Order.where(:user_id => current_user.id).first()
    unless @order.nil?
      @my_projects = MyProject.where(:order_id => @order.id).order('created_at DESC').all()
    else
      @my_projects = []
    end
    @my_projects = Kaminari.paginate_array(@my_projects).page(params[:page]).per(2)


    respond_to do |format|
      format.html { render  :layout => 'user_admin'}# index.html.erb
      format.json { render json: @my_projects }
    end
  end
  
  def show
    @my_projects = MyProject.where(:order_id => params[:id]).all()

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @my_projects }
    end
  end
end
