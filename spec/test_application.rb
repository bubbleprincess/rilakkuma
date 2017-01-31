require_relative "test_helper"

class TestController < Rilakkuma::Controller
  def index
    "Hiyo" #not rendering a view
  end
end

class TestApp < Rilakkuma::Application
  def get_controller_and_action(env)
    [TestController, "index"]
  end
end

class RilakkumaAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get "/example/route"

    assert last_response.ok?
    body = last_response.body
    assert body["Hiyo"]
  end
end