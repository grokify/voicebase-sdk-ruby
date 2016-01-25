require 'date'
require 'faraday'
require 'faraday_middleware'

module VoiceBase::V1
  VOICEBASE_API_VERSION = '1.1'

  class Client
    def initialize(api_key, password, transcript_type='machine-best')
      @api_key = api_key
      @password = password
      @transcript_type = transcript_type
      @conn_url_encoded = new_http_client :url_encoded
      @conn_multipart = new_http_client :multipart
    end

    def new_http_client(request = :url_encoded)
      conn = Faraday.new(:url => VoiceBase::VOICEBASE_API_BASE_PATH) do |faraday|
        faraday.request  request                  # multipart/form-data
        faraday.response :json
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
      return conn
    end

    def upload_media(params={})
      params = {
        :version        => VOICEBASE_API_VERSION,
        :apikey         => @api_key,
        :password       => @password,
        :action         => 'uploadMedia',
        :title          => DateTime.now.strftime('%Y-%m-%d %I:%M:%S %p'),
        :transcriptType => @transcript_type,
        :desc           => 'file description',
        :recordedDate   => DateTime.now.strftime('%Y-%m-%d %I:%M:%S'),
        :collection     => '',
        :public         => false,
        :sourceUrl      => '',
        :lang           => 'en',
        :imageUrl       => ''
      }.merge params

      response = nil

      if params.key?(:filePath) && params.key?(:fileContentType)
        params[:file] = Faraday::UploadIO.new(params[:filePath], params[:fileContentType])
        params.delete :filePath
        params.delete :fileContentType
        response = @conn_multipart.post '/services', params
      else
        response = @conn_url_encoded.post '/services', params
      end

      return response
    end
  end
end