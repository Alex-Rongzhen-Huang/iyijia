class CreateQuotationTemplates < ActiveRecord::Migration
  def change
    create_table :quotation_templates do |t|
      t.string :title
      t.timestamps
    end
  end
end
