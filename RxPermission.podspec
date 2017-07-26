Pod::Spec.new do |s|
  s.name             = "RxPermission"
  s.version          = "1.0.0"
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

  s.subspec 'Core' do |ss|
    ss.source_files = 'Source/*.swift'    
    ss.dependency 'Permission/Core'
    ss.dependency 'RxSwift'
  end

  s.subspec 'AddressBook' do |ss|
    ss.dependency 'RxPermission/Core'
    ss.dependency 'Permission/AddressBook'
  end

  s.subspec 'Bluetooth' do |ss|
    ss.dependency 'RxPermission/Core'
    ss.dependency 'Permission/Bluetooth'
  end

  s.subspec 'Camera' do |ss|
    ss.dependency 'RxPermission/Core'
    ss.dependency 'Permission/Camera'
  end

  s.subspec 'Contacts' do |ss|
    ss.dependency 'RxPermission/Core'
    ss.dependency 'Permission/Contacts'
  end

  s.subspec 'Events' do |ss|
    ss.dependency 'RxPermission/Core'
    ss.dependency 'Permission/Events'
  end

  s.subspec 'Location' do |ss|
    ss.dependency 'RxPermission/Core'
    ss.dependency 'Permission/Location'
  end

  s.subspec 'MediaLibrary' do |ss|
    ss.dependency 'RxPermission/Core'
    ss.dependency 'Permission/MediaLibrary'
  end

  s.subspec 'Microphone' do |ss|
    ss.dependency 'RxPermission/Core'
    ss.dependency 'Permission/Microphone'
  end

  s.subspec 'Motion' do |ss|
    ss.dependency 'RxPermission/Core'
    ss.dependency 'Permission/Motion'
  end

  s.subspec 'Notifications' do |ss|
    ss.dependency 'RxPermission/Core'
    ss.dependency 'Permission/Notifications'
  end

  s.subspec 'Photos' do |ss|
    ss.dependency 'RxPermission/Core'
    ss.dependency 'Permission/Photos'
  end

  s.subspec 'Reminders' do |ss|
    ss.dependency 'RxPermission/Core'
    ss.dependency 'Permission/Reminders'
  end

  s.subspec 'Siri' do |ss|
   ss.dependency 'RxPermission/Core'
   ss.dependency 'Permission/Siri'
  end

  s.subspec 'SpeechRecognizer' do |ss|
    ss.dependency 'RxPermission/Core'
    ss.dependency 'Permission/SpeechRecognizer'
  end
end
