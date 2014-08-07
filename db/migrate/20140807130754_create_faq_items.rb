# encoding: UTF-8
class CreateFaqItems < ActiveRecord::Migration
  def change
    create_table :faq_items do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def migrate(direction)
    super
    # Create a default settings

    if direction == :up then
      FaqItem.create!(:title => '何为一口价', :description => '待维护')
      FaqItem.create!(:title => '一口价施工包含项目', :description => '待维护 ')
      FaqItem.create!(:title => '一口价主材包含项目', :description => '待维护 ')
      FaqItem.create!(:title => '一口价不包含的项目', :description => '待维护 ')
      FaqItem.create!(:title => '不包含项目收费标准', :description => '待维护 ')
      FaqItem.create!(:title => '如何在线选择主材', :description => '待维护 ')
      FaqItem.create!(:title => '如何预约实体看主材', :description => '待维护 ')
      FaqItem.create!(:title => '签约付款方式', :description => '待维护')
    end
  end
end
