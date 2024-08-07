# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xlsx_writer_wrapper/version'

Gem::Specification.new do |spec|
  spec.name          = "xlsx_writer_wrapper"
  spec.version       = XlsxWriterWrapper::VERSION
  spec.authors       = ["Bebanjo Devs"]
  spec.email         = ["alfonso@bebanjo.com"]

  spec.summary       = %q{Wrapper in ruby for C libxlsxwriter lib}
  spec.homepage      = "https://github.com/AlfonsoUceda/xlsx_writer_wrapper"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'ffi', '~> 1.14'

  spec.add_development_dependency "bundler", "> 2.3"
  spec.add_development_dependency "rake", "~> 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
end
