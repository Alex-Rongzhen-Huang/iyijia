class AddWeightToFaqItem < ActiveRecord::Migration
  def change
    add_column :faq_items, :weight, :integer, :default => 1
  end
end
