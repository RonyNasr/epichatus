class CreateConversations < ActiveRecord::Migration
  def change
    create_table(:conversations) do |t|
      t.column(:message_id, :int)
      t.column(:sender_id, :int)
      t.column(:recipient_id, :int)

      t.timestamps()
    end
    add_index :conversations, :sender_id
    add_index :conversations, :recipient_id
  end
end
