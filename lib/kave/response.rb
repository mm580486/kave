module Kave
  class ResponseRequestSimple
    attr_reader :response, :status,:statusmessage
    def validate(response = nil,send_simple_by)
      @response = response
      @send_simple_by=send_simple_by
      perform_validation
      return self
    end

    def valid?
      @valid
    end

    private
    def perform_validation
      raise ArgumentError, 'not a valid response' if @response.nil?

      body       = if @send_simple_by==:send_simple_by_apikey
        @response[:send_simple_by_apikey_response] 
      else
        @response[:send_simple_by_login_info_response] 
      end
      @status    = body[:status].to_i
      @statusmessage    = body[:statusmessage]
      unless @status == 200
        @valid = false
      else
        @valid=true
      end

    end
  end


  class ResponseLatestOutBox

    attr_reader :response, :select

    def validate(response = nil,send_latest_by)
      @response = response
      @send_simple_by=send_latest_by
      perform_validation
      return self
    end


    private
    def perform_validation
      body       =@response[:selectlatest_by_apikey_response] 
      @select    = body[:selectlatest_by_apikey_result][:api_select]
    end

  end
end