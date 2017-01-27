require "rilakkuma/version"

module Rilakkuma
  class Application
    def call(env)
      [200, {'Content-Type' => 'text/html'},
        ["Hello from Ruby on Rilakkuma!!"]]
    end
  end
end
