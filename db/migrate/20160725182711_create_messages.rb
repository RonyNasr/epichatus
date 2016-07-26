class CreateMessages < ActiveRecord::Migration
  def change
    create_table(:messages) do |t|
      t.column(:conversation_id, :int)
      t.column(:user_id, :int)
      t.column(:body, :text)

      t.timestamps()
    end
  end
end
