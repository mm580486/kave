require "savon"

module Kave
 


  class SendRequest
    attr_accessor :mobile, :message
    attr_reader   :response



    def initialize(args = {})
      @mobile      = args.fetch(:mobile)
      @message     = args.fetch(:message)
      @wsdl        = Savon.client(wsdl: Kave.configuration.wsdl, pretty_print_xml: true)
      @response    = Response.new
    end

   

    def call
      response = @wsdl.call :send_simple_by_apikey, message: {
        'apikey' => Kave.configuration.api_key,
        'receptor'=> {string:@mobile},
        'message' => @message,
        'sender' => Kave.configuration.sender
      }
      @response.validate(response.body)
    end
  end
end