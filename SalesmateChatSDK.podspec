Pod::Spec.new do |s|
  s.name                = 'SalesmateChatSDK'
  s.version             = '1.1.4'
  s.summary             = 'The SalesmateChatSDK is an iOS SDK, for integrating SalesmateChat into your iOS application.'
  s.license             = { :type => "Apache 2.0", :file => "LICENSE" }
  s.authors             = {"VishaliOSRapidops"=>"vishal.nandoriya@rapidops.com"}
  s.homepage            = 'https://github.com/salesmate/salesmate-chat-ios'
  s.description         = 'The SalesmateChatSDK is an iOS SDK, mobile messaging framework for iOS.'
  s.requires_arc        = true
  s.source              = { :git => 'https://github.com/salesmate/salesmate-chat-ios.git', :tag => s.version.to_s }
  s.platform            = :ios, '13.0'
  s.preserve_paths      = 'SalesmateChatSDK.xcframework'
  s.vendored_frameworks = 'SalesmateChatSDK.xcframework'
end
