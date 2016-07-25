class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table(:users)do |t|
      t.column(:email, :string)
      t.column(:password, :string)
      t.column(:username, :string)

      t.timestamps()
    end
  end
end
