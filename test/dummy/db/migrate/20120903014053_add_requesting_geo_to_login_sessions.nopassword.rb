# This migration comes from nopassword (originally 20120810233403)
class AddRequestingGeoToLoginSessions < ActiveRecord::Migration
  def change
    add_column :nopassword_login_sessions, :requesting_geo, :string

  end
end
