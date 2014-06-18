ActiveAdmin.register QuotationTemplateItem do
  # 嵌套式的url结构，顶层菜单将没有样板房图片
  #belongs_to :quotation_template
  menu :priority => 2, :parent =>  I18n.t('admin.menu.quotation_management')
end
