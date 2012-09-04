require 'test_helper'

class Nopassword::LoginSessionTest < ActiveSupport::TestCase
  def setup
    @ls, @code = Nopassword::LoginSession.create_session("test@test.com", "127.0.0.1", "some_user_agent", "example.com")
  end

  test "create_session sends an email" do
    assert_difference("ActionMailer::Base.deliveries.size", 1) do 
      Nopassword::LoginSession.create_session("test@test.com", "127.0.0.1", "some_user_agent", "example.com")
    end 
  end

  test "create_session creates a session with a code" do
    assert @ls != nil
    assert @code != nil
    assert @ls.hashed_code != nil
  end

  test "create_session correctly stores IP and user agent" do
    assert @ls.requesting_ip == "127.0.0.1"
    assert @ls.requesting_user_agent == "some_user_agent"
  end

  test "create_session generates geo" do
    assert @ls.requesting_geo == "localhost"
  end

  test "activate_session sets the activated flag to true" do
    @ls.activate_session(@code, "127.0.0.1", "some_user_agent")
    assert @ls.activated == true
  end  

  test "activate_session stores IP and user agent" do
    @ls.activate_session(@code, "127.0.0.1", "some_user_agent")
    assert @ls.activating_ip == "127.0.0.1"
    assert @ls.activating_user_agent == "some_user_agent"
  end

  test "activate_session generates geo" do
    @ls.activate_session(@code, "127.0.0.1", "some_user_agent")
    assert @ls.activating_geo == "localhost"
  end

  test "active_sessions only contains session that are active" do
    @ls2, @code2 = Nopassword::LoginSession.create_session("test@test.com", "127.0.0.2", "some_other_user_agent", "example.com")
    assert @ls.active_sessions.count == 0
    @ls.activate_session(@code, '127.0.0.1', "some_user_agent")
    assert @ls.active_sessions.count == 1
    @ls2.activate_session(@code2, "127.0.0.2", "some_other_user_agent")
    assert @ls.active_sessions.count == 2
  end

  test "terminated_sessions only contains session that are active" do
    @ls2, @code2 = Nopassword::LoginSession.create_session("test@test.com", "127.0.0.2", "some_other_user_agent", "example.com")
    assert @ls.terminated_sessions.count == 0
    @ls.activate_session(@code, '127.0.0.1', "some_user_agent")
    @ls.revoke(@ls)
    assert @ls.terminated_sessions.count == 1
    @ls2.activate_session(@code2, "127.0.0.2", "some_other_user_agent")
    @ls2.revoke(@ls2)
    assert @ls.terminated_sessions.count == 2
  end

  test "logout sets terminated to true" do
    @ls.activate_session(@code, '127.0.0.1', "some_user_agent")
    @ls.logout
    assert @ls.terminated
  end

  test "logout sets terminated_at time" do
    @ls.activate_session(@code, '127.0.0.1', "some_user_agent")
    @ls.logout
    assert @ls.terminated_at != nil
  end

  test "expired is true when created_at is past expiry" do
    @ls.created_at = 1.week.ago
    @ls.save
    assert @ls.expired?
  end

  test "generate code returns a 32 character hex string" do
    assert @ls.generate_code =~ /^[a-f0-9]{64}$/
  end

  test "geoip returns Mountain View for 8.8.8.8" do
    assert Nopassword::LoginSession.geoip("8.8.8.8") == "Mountain View, USA"
  end
end
