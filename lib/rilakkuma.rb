require "rilakkuma/version"
require "rilakkuma/routing"

module Rilakkuma
  class Application
    def call(env)
      #env['PATH_INFO'] = '/quotes/a_quote'

      if env['PATH_INFO'] == '/favicon.ico'
        return [404,
          {'Content-Type' => 'text/html'}, []]
      end

      if env['PATH_INFO'] == '/'
        env['PATH_INFO'] = '/home/index'
        # return [404,
        #   {'Content-Type' => 'text/html'}, []]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      begin
        text = controller.send(act)
      rescue Exception => e
        [500, {'Content-Type' => 'text/html'},
          [%Q(<div style="text-align: center; margin-left: auto; margin-right: auto; border: 2px solid gray; border-radius: 5px; height: 40%; width: 30%;">
            Welp it failed because #{e} :|
            <img style="display:block; margin: 0 auto;" src="http://cdn.list25.com/wp-content/uploads/2011/11/penguifall.gif"></div>)]]
      else
        [200, {'Content-Type' => 'text/html'},
          [text]]
      end
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end
