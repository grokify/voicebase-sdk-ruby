require './test/test_base.rb'

class VoiceBaseTest < Test::Unit::TestCase
  def setup
    @vbsdk = VoiceBase::V1::Client.new(
      'myApiKey',
      'myPassword'
    )
  end

  def test_main
    assert_equal 'VoiceBase::V1::Client', @vbsdk.class.name
  end
end