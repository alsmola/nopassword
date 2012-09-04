class AddRequestingGeoToLoginSessions < ActiveRecord::Migration
  def change
    add_column :nopassword_login_sessions, :requesting_geo, :string

  end
end
