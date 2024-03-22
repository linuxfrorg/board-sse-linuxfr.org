# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require './lib/board-sse-linuxfr.org/version'

Gem::Specification.new do |s|
  s.name         = "board-sse-linuxfr.org"
  s.version      = BoardSseLinuxfrOrg::VERSION
  s.licenses     = ["AGPL-3.0-only"]
  s.authors      = ["Bruno Michel", "Adrien Dorsaz"]
  s.email        = "adrien@adorsaz.ch"
  s.homepage     = "https://github.com/linuxfrorg/board-sse-linuxfr.org"
  s.summary      = "Board for LinuxFr.org"
  s.description  = <<~EOD
    Users of the LinuxFr.org website can chat on a space called the board (« la tribune » in french).
    This Ruby daemon notifies the users when something is said with Server-Sent Event / EventSource.
  EOD

  s.files        = Dir['lib/**/*.rb'] + Dir['bin/*']
  s.platform     = Gem::Platform::RUBY
  s.executables  = ["board-sse-linuxfr.org"]
  s.require_path = 'lib'

  s.add_runtime_dependency "goliath",   "~>1.0", ">= 1.0.7"
  s.add_runtime_dependency "hiredis",   "~>0.4"
  s.add_runtime_dependency "redis",     "~>3.0"
  s.add_runtime_dependency "yajl-ruby", "~>1.2"

  s.add_development_dependency "minitest", "~>2.3"
end
