require "rilakkuma/version"
require "rilakkuma/array"

module Rilakkuma
  class Application
    def call(env)
      `echo debug > debug.txt`;
      [200, {'Content-Type' => 'text/html'},
        ["Hello from Ruby on Rilakkuma!!"]]
    end
  end
end
