class CreateLeads < ActiveRecord::Migration
  def change
  	create_table :leads do |t|
      t.string :message
      t.integer :need_id
    end
  end
end
