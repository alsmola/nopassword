# This migration comes from nopassword (originally 20120810233403)
class AddRequestingGeoToLoginSessions < ActiveRecord::Migration[4.2]
  def change
    add_column :nopassword_login_sessions, :requesting_geo, :string

  end
end
