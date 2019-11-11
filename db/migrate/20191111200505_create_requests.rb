class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer :requestee_padder_id
      t.integer :requester_padder_id
      t.timestamps
    end
  end
end
