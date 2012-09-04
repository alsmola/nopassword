class AddActivatingGeoToLoginSessions < ActiveRecord::Migration
  def change
    add_column :nopassword_login_sessions, :activating_geo, :string

  end
end
