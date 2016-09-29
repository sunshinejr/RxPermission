Pod::Spec.new do |s|
  s.name             = "RxPermission"
  s.version          = "1.0.0-beta.2"
  s.summary          = "RxSwift bindings for Permissions API in iOS."
  s.description      = <<-EOS
  RxSwift binding for [Permission](https://github.com/delba/Permission) API that helps you with Permissions in iOS.
  EOS
  s.homepage         = "https://github.com/sunshinejr/RxPermission"
  s.license          = 'MIT'
  s.author           = { "Łukasz Mróz" => "thesunshinejr@gmail.com" }
  s.source           = { :git => "https://github.com/sunshinejr/RxPermission.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/thesunshinejr'
  s.platform     = :ios, '8.0'
  s.ios.deployment_target = '8.0'
  s.source_files = 'Source/*.swift'
  s.dependency 'Permission'
  s.dependency 'RxSwift'
end
