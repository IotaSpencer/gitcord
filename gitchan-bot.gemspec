# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'gitcord/version'

Gem::Specification.new do |s|
  s.name          = 'gitchan-bot'
  s.version       = GitCord::VERSION
  s.authors       = ['IotaSpencer']
  s.email         = ['me@iotaspencer.me']
  s.homepage      = 'https://github.com/IotaSpencer/gitchan-bot'
  s.licenses      = ['MIT']
  s.summary       = '[summary]'
  s.description   = '[description]'
  s.require_paths = ['lib']
  s.files         = Dir.glob('{bin/*,lib/**/*,[A-Z]*}')
  s.executables   = Dir.glob('bin/*').map { |f| File.basename(f) }

  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']
end
