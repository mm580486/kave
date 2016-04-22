require "kave/version"
require "kave/send_request"
require "kave/response"


module Kave
  class << self
    attr_accessor :configuration
  end
  def self.configure
    self.configuration ||= Configuration.new
    yield configuration
  end

  class Configuration
    attr_accessor :api_key, :sender,:wsdl

    def initialize

    end

  end
end
