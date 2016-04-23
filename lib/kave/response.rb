module Kave
  class Response
    attr_reader :response, :status
    def validate(response = nil)
      @response = response
      perform_validation
      return self
    end
    def valid?
      @valid
    end

    private
    def perform_validation
      raise ArgumentError, 'not a valid response' if @response.nil?
      body       = @response[:send_simple_by_apikey_response] 
      @status    = body[:status].to_i
      @status_message    = body[:statusmessage].to_i
      unless @status == 200
        @valid = false
     else
      @valid=true
      end

    end
  end
end