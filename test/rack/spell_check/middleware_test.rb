# require File.join(File.dirname(__FILE__), *%w[.. test_helper])
require 'test_helper'

describe Rack::SpellCheck::Middleware do

  before do
    @app = Rack::MockRequest.new(
      Rack::Builder.new {
        map '/' do
          use Rack::SpellCheck::Middleware
          run lambda {|env| [200, {'Content-Type' => 'text/html'}, 'Speling']}
        end
      }
    )
  end

  it "should log a misspelling" do
    Rack::SpellCheck::Middleware.any_instance.expects(:log_misspelling).with('Speling', ['Speling DAMNIT RYAN'])
    @app.get '/'
  end

end
