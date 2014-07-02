ActiveAdmin.register MainMaterial do
  menu :priority => 2, :parent =>  I18n.t('admin.menu.quotation_management')

  filter :type
  scope :all, default: true

# assumes the model has a scope called ':active'
#  scope :active

# Dynamic scope name
#  scope ->{ Date.today.strftime '%A' }, :published_today

# custom scope not defined on the model
#  scope("Inactive") { |scope| scope.where(active: false) }
  scope("price > 10") { |scope| scope.where('price > 10') }

# conditionally show a custom controller scope
#  scope "Published", :if => proc { current_admin_user.can? :manage, Posts } do |posts|
#    posts.published
#  end

end
