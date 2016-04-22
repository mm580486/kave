require "savon"

module Kave
  # Sends a payment request to zarinpal
  # @return [Zarinpal::Response]
  class SendRequest
    attr_accessor :mobile, :message
    attr_reader   :response

    # @note A hash of parameters should be send to this class
    # @example
    #   PaymentRequest.new(amount: 10000, description: 'sth...', email: 'example@example.com')
    #
    # @param args [Hash] hash of params to send requests
    # @option args [Integer] :amount price of the request
    # @option args [Integer] :description description of transaction
    # @option args [String] :email ('') email of buyer
    # @option args [String] :mobile ('') mobile number of buyer
    def initialize(args = {})
      @mobile      = args.fetch(:mobile)
      @message     = args.fetch(:message)
      @wsdl        = Savon.client(wsdl: Zarinpal.configuration.wsdl, pretty_print_xml: true)
      @response    = Response.new
    end

    # Sends the payment request to Zarinpal
    #
    # @return [Zarinpal::Response]
    def call
      response = @wsdl.call :payment_request, message: {
        'apikey' => Zarinpal.configuration.api_key,
        'receptor'=> {string:@mobile},
        'message' => @message,
        'sender' => Zarinpal.configuration.sender
      }
      @response.validate(response.body)
    end
  end
end