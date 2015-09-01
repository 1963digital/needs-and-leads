class CreateNeed < ActiveRecord::Migration
  def change
  	create_table :needs do |t|
      t.string :title
      t.string :description
    end
  end
end
