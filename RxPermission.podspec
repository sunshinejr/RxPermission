Pod::Spec.new do |s|
  s.name             = "RxPermission"
  s.version          = "0.1.0"
  s.summary          = "RxSwift bindings for Permissions API in iOS."
  s.description      = <<-DESC
  RxSwift binding for [Permission](https://github.com/delba/Permission) API that helps you with Permissions in iOS.
                       DESC
  s.homepage         = "https://github.com/sunshinejr/RxPermission"
  s.license          = 'MIT'
  s.author           = { "Sunshinejr" => "thesunshinejr@gmail.com" }
  s.source           = { :git => "https://github.com/sunshinejr/RxPermission.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/thesunshinejr'
  s.ios.deployment_target = '8.0'
  s.source_files = 'Source/*.swift'
  s.dependency 'Permission', '~> 1.2'
  s.dependency 'RxSwift', '~> 2.4'
end
