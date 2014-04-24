# encoding: utf-8
require './lib/board-linuxfr'

Gem::Specification.new do |s|
  s.name         = "board-linuxfr"
  s.version      = BoardLinuxfr::VERSION
  s.authors      = ["Bruno Michel"]
  s.email        = "nono@linuxfr.org"
  s.homepage     = "https://github.com/linuxfrorg/board-sse-linuxfr.org"
  s.summary      = "Push notifications for the board of LinuxFr.org via Server-Sent Events"
  s.description  = "Push notifications for the board of LinuxFr.org via Server-Sent Events"

  s.files        = `git ls-files bin lib`.split("\n")
  s.platform     = Gem::Platform::RUBY
  s.executables  = ["board-linuxfr"]
  s.require_path = 'lib'

  s.add_dependency "goliath",   "~>1.0"
  s.add_dependency "hiredis",   "~>0.4"
  s.add_dependency "redis",     "~>3.0"
  s.add_dependency "yajl-ruby", "~>1.2"

  s.add_development_dependency "minitest", "~>2.3"
end
