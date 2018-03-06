Pod::Spec.new do |s|
  s.name         = "APIRequest"
  s.version      = "0.3.1"
  s.summary      = "This is the interface for constructing API request."
  s.description  = "This is the interface for constructing API request. This framework will not include networking layer but will produce the outcome as URLRequest to be injected in networking layer."
  s.homepage     = "https://github.com/tpeodndyy/APIRequest"
  s.license      = "MIT"
  s.author       = 'Peera Kerdkokaew'
  s.swift_version = '4.0'
  s.platform     = :ios, '9.0'
  s.source       = { :git => 'https://github.com/tpeodndyy/APIRequest.git', :tag => s.version }

  s.source_files  = 'APIRequest/*.swift'
end
