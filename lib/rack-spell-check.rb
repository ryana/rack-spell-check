require 'rack/spell_check/middleware'
require 'rack/spell_check/railtie' if defined? Rails

require 'logger'

module Rack::SpellCheck
  def self.logger= _logger
    @@logger = _logger
  end

  def self.logger
    @@logger ? (defined?(Rails) ? Rails.logger : nil)
  end

  def self.whitelist
    @@whitelist
  end

  def self.whitelist= _whitelist
    @@whitelist = _whitelist
  end
end

Rack::SpellCheck.logger = (
  if defined? Rails
    Rails.logger
  else
    Logger.new(STDOUT)
  end
)
