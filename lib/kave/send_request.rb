require "savon"

module Kave
  class SendRequestSimple
    attr_accessor :mobile, :message,:unixdate,:msgmode
    attr_reader   :response

    def initialize(args = {})
      args[:unixdate] ||= nil
      args[:msgmode] ||= nil
      @mobile      = args.fetch(:mobile)
      @message     = args.fetch(:message)
      @unixdate    = args.fetch(:unixdate) || 0
      @wsdl        = Savon.client(wsdl: Kave.configuration.wsdl, pretty_print_xml: true)
      @response    = ResponseRequestSimple.new
      @msgmode     = args.fetch(:msgmode) || 1
      @username    = Kave.configuration.username || ''
      @password    = Kave.configuration.password || ''
    end

    def call
      @send_simple_by= unless Kave.configuration.api_key.nil?
        :send_simple_by_apikey
      else
        :send_simple_by_login_info
      end
      response = @wsdl.call @send_simple_by, message: {
        'apikey' =>Kave.configuration.api_key,
        'username'=>@username,
        'password'=>@password,
        'receptor'=> {string:@mobile},
        'message' => @message,
        'sender' => Kave.configuration.sender,
        'unixdate'=>@unixdate,
        'msgmode'=>@msgmode
      }
      @response.validate(response.body,@send_simple_by)
    end

  end

  class LatestOutBox
    attr_accessor :pagesize
    attr_reader   :response

    def initialize(args = {})
      @pagesize    = args.fetch(:pagesize) 
      @wsdl        = Savon.client(wsdl: Kave.configuration.wsdl, pretty_print_xml: true)
      @response    = ResponseLatestOutBox.new
      @username    = Kave.configuration.username || ''
      @password    = Kave.configuration.password || ''
    end

    def call
      @send_latest_by=unless Kave.configuration.api_key.nil?
:selectlatest_by_apikey
else
:selectlatest_by_login_info
end
      @pagesize=if @pagesize.to_i < 2;2;else;@pagesize;end
      response = @wsdl.call @send_latest_by, message: {
        'apikey' =>Kave.configuration.api_key,
        'pagesize'=>@pagesize.to_i,
        'sender' => Kave.configuration.sender
      }
      @response.validate(response.body,@send_latest_by )
    end

  end






end