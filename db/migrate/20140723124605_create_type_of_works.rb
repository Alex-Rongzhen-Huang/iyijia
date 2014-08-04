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
      TypeOfWork.create!(:name => '瓦工')
      TypeOfWork.create!(:name => '电工')
      TypeOfWork.create!(:name => '木工')
      TypeOfWork.create!(:name => '水暖工')
      TypeOfWork.create!(:name => '油漆工')
      TypeOfWork.create!(:name => '其他')
    end
  end

end
