class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer :requestee_padder_id
      t.integer :requester_padder_id
      t.boolean :request_status
      t.string  :dates
      t.text  :content
      t.timestamps
    end
  end
end
