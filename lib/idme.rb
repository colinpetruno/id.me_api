require "idme/version"
require 'httparty'

module IdMe

  class API

    attr_accessor :client_id, :client_secret

    def initialize(client_id = nil, client_secret = nil, extra_params = {})
      @client_id = client_id || ENV['IDME_CLIENT_ID'] || self.class.client_id
      @client_secret = client_secret || ENV['IDME_CLIENT_SECRET'] || self.class.client_secret

      @default_params = {client_id: @client_id, client_secret: @client_secret }.merge!(extra_params)
    end

    def client_id=(value)
      @client_id = value
      @default_params = @default_params.merge({:client_id => @client_id})
    end

    def base_api_url
      development ? "https://api.sandbox.id.me/v2/" :  "https://api.sandbox.id.me/v2/"
    end

    def development
      @default_params[:development]
    end

    def development=(val)
      @default_params[:development] = val
    end


    protected

    def call(method, params = {})
      request_body =  {client_id: client_id, client_secret: client_secret}.merge!(params)
      result = HTTParty.post(base_api_url + method, :body => request_body)
      return result
    end

    def method_missing(method, *args)
      method = method.to_s.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase } #Thanks for the gsub, Rails
      method = method[0].chr.downcase + method[1..-1].gsub(/aim$/i, 'AIM')
      call(method, *args)
    end
  end

end
