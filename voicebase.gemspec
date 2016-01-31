lib = 'voicebase'
lib_file = File.expand_path("../lib/#{lib}.rb", __FILE__)
File.read(lib_file) =~ /\bVERSION\s*=\s*["'](.+?)["']/
version = $1

Gem::Specification.new do |s|
  s.name        = lib
  s.version     = version
  s.date        = '2016-01-30'
  s.summary     = 'VoiceBase is a Ruby SDK for the VoiceBase API'
  s.description = 'Helper library to transcribe audio'
  s.authors     = ['John Wang']
  s.email       = 'johncwang@gmail.com'
  s.homepage    = 'https://github.com/grokify/'
  s.licenses    = ['MIT']
  s.files       = Dir['lib/**/**/*'] + Dir['[A-Z]*'] + Dir['test/**/*']
  # s.files.reject! { |fn| fn.include? "CVS" }
  # s.required_ruby_version = '>= 1.8.7' # 1.8.7+ is tested  s.add_dependency 'faraday', '~> 0.9', '>= 0.9'
  s.add_dependency 'faraday_middleware', '~> 0', '>= 0'
end
