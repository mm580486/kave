require "kave/version"

module Kave
  class << self
    attr_accessor :configuration
  end
  def self.configure
    self.configuration ||= Configuration.new
    yield configuration
  end

  # Configures the gem
  #
  # @example
  #   Zarinpal.configure do |config|
  #     config.merchant_id  = 'XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX'
  #     config.callback_url = 'http://example.com/call_back'
  #     config.client       = 'https://de.zarinpal.com/pg/services/WebGate/wsdl'
  #   end
  class Configuration
    attr_accessor :api_key, :sender,:wsdl

    def initialize

    end

  end
end
