require 'date'
require 'faraday'
require 'faraday_middleware'

module VoiceBase::V1
  VOICEBASE_API_VERSION = '1.1'

  attr_accessor :conn_url_encoded
  attr_accessor :conn_multipart

  class Client
    def initialize(api_key, password, transcript_type = 'machine-best')
      @api_key = api_key
      @password = password
      @transcript_type = transcript_type
      @conn_url_encoded = new_http_client :url_encoded
      @conn_multipart = new_http_client :multipart
    end

    def new_http_client(request = :url_encoded)
      Faraday.new(url: VoiceBase::VOICEBASE_API_BASE_PATH) \
      do |faraday|
        faraday.request request
        faraday.response :json
        faraday.response :logger                # log requests to STDOUT
        faraday.adapter Faraday.default_adapter # make requests with Net::HTTP
      end
    end

    def upload_media(params = {})
      params = {
        version: VOICEBASE_API_VERSION,
        apikey: @api_key,
        password: @password,
        action: 'uploadMedia',
        title: DateTime.now.strftime('%Y-%m-%d %I:%M:%S %p'),
        transcriptType: @transcript_type,
        desc: 'file description',
        recordedDate: DateTime.now.strftime('%Y-%m-%d %I:%M:%S'),
        collection: '',
        public: false,
        sourceUrl: '',
        lang: 'en',
        imageUrl: ''
      }.merge params

      if params.key?(:filePath) && params.key?(:fileContentType)
        params[:file] = Faraday::UploadIO.new(
          params[:filePath],
          params[:fileContentType]
        )
        params.delete :filePath
        params.delete :fileContentType
        return @conn_multipart.post '/services', params
      else
        return @conn_url_encoded.post '/services', params
      end
    end
  end
end
