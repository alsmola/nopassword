class AddActivatingGeoToLoginSessions < ActiveRecord::Migration
  def change
    add_column :login_sessions, :activating_geo, :string

  end
end
