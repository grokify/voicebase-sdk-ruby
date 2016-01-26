VoiceBase Ruby SDK
==================

[![Gem Version][gem-version-svg]][gem-version-link]
[![Build Status][build-status-svg]][build-status-link]
[![Dependency Status][dependency-status-svg]][dependency-status-link]
[![Code Climate][codeclimate-status-svg]][codeclimate-status-link]
[![Scrutinizer Code Quality][scrutinizer-status-svg]][scrutinizer-status-link]
[![Downloads][downloads-svg]][downloads-link]
[![Docs][docs-rubydoc-svg]][docs-rubydoc-link]
[![License][license-svg]][license-link]

## Overview

Ruby SDK for VoiceBase.com audio transcription service.

## Installation

### Via Bundler

Add 'voicebase' to Gemfile and then run `bundle`:

```sh
$ echo "gem 'voicebase'" >> Gemfile
$ bundle
```

### Via RubyGems

```sh
$ gem install voicebase
```

## Usage

### Upload Media

The `upload_media` method will accept a hash of parameters to send to the VoiceBase API. All supported parameters can be passed in.

#### From Filepath

Using SDK helper the `:filePath` and `:fileContentType` parameters will be auto-converted to a `:file` parameter supported by the VoiceBase API. It is also possible to directly include a `:file` parameter using `Faraday::UploadIO`.

```ruby
voicebase = VoiceBase::V1::Client.new('myApiKey', 'myPassword')

# Using SDK Helpers
voicebase.upload_media(
  :filePath => '/path/to/myFile.mp3'
  :fileContentType => 'audio/mpeg'
)

# Using Faraday::UploadIO directly
voicebase.upload_media(
  :file => Faraday::UploadIO.new('/path/to/myFile.mp3', 'audio/mpeg')
)
```

#### From URL

```ruby
voicebase = VoiceBase::V1::Client.new('myApiKey', 'myPassword')

voicebase.upload_media(
  :mediaUrl => 'http://example.com/path/to/myFile.mp3'
)
```

## Change Log

See [CHANGELOG.md](CHANGELOG.md)

## Links

Project Repo

* https://github.com/grokify/voicebase-sdk-ruby

## Contributions

Any reports of problems, comments or suggestions are most welcome.

Please report these on [Github](https://github.com/grokify/voicebase-sdk-ruby)

## License

VoiceBase Ruby SDK is available under an MIT-style license. See [LICENSE.txt](LICENSE.txt) for details.

VoiceBase Ruby SDK &copy; 2016 by John Wang

 [gem-version-svg]: https://badge.fury.io/rb/voicebase.svg
 [gem-version-link]: http://badge.fury.io/rb/voicebase
 [downloads-svg]: http://ruby-gem-downloads-badge.herokuapp.com/voicebase
 [downloads-link]: https://rubygems.org/gems/voicebase
 [build-status-svg]: https://api.travis-ci.org/grokify/voicebase-sdk-ruby.svg?branch=master
 [build-status-link]: https://travis-ci.org/grokify/voicebase-sdk-ruby
 [dependency-status-svg]: https://gemnasium.com/grokify/voicebase-sdk-ruby.svg
 [dependency-status-link]: https://gemnasium.com/grokify/voicebase-sdk-ruby
 [codeclimate-status-svg]: https://codeclimate.com/github/grokify/voicebase-sdk-ruby/badges/gpa.svg
 [codeclimate-status-link]: https://codeclimate.com/github/grokify/voicebase-sdk-ruby
 [scrutinizer-status-svg]: https://scrutinizer-ci.com/g/grokify/voicebase-sdk-ruby/badges/quality-score.png?b=master
 [scrutinizer-status-link]: https://scrutinizer-ci.com/g/grokify/voicebase-sdk-ruby/?branch=master
 [docs-rubydoc-svg]: https://img.shields.io/badge/docs-rubydoc-blue.svg
 [docs-rubydoc-link]: http://www.rubydoc.info/gems/voicebase/
 [license-svg]: https://img.shields.io/badge/license-MIT-blue.svg
 [license-link]: https://github.com/grokify/voicebase-sdk-ruby/blob/master/LICENSE.txt
