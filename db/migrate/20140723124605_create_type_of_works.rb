# encoding: UTF-8

class CreateTypeOfWorks < ActiveRecord::Migration
  def change
    create_table :type_of_works do |t|
      t.string :name
    end
  end

  def migrate(direction)
    super
    # Create a default settings

    if direction == :up then
      TypeOfWork.create!(:name => '水电工')
      TypeOfWork.create!(:name => '砖瓦工')
      TypeOfWork.create!(:name => '木工')
      TypeOfWork.create!(:name => '油漆工')
    end
  end

end
