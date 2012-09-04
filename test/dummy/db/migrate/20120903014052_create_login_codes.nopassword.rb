# This migration comes from nopassword (originally 20120412041547)
class CreateLoginCodes < ActiveRecord::Migration
  def change
    create_table :nopassword_login_sessions do |t|
      t.string :email
      t.string :hashed_code
      t.string :requesting_ip
      t.string :requesting_user_agent
      t.string :activating_ip
      t.string :activating_user_agent
      t.boolean :activated, :default => false
      t.timestamp :activated_at
      t.boolean :terminated, :default => false
      t.timestamp :terminated_at

      t.timestamps
    end
  end
end
