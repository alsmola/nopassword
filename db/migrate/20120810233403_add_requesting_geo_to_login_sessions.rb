class AddRequestingGeoToLoginSessions < ActiveRecord::Migration
  def change
    add_column :login_sessions, :requesting_geo, :string

  end
end
