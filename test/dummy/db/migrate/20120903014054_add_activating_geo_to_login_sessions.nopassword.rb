# This migration comes from nopassword (originally 20120810233418)
class AddActivatingGeoToLoginSessions < ActiveRecord::Migration[4.2]
  def change
    add_column :nopassword_login_sessions, :activating_geo, :string

  end
end
