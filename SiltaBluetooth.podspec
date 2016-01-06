Pod::Spec.new do |s|
  s.name         = "SiltaBluetooth"
  s.version      = "0.1.0"
  s.summary      = "SiltaBluetooth for easy to use BLE."
  s.homepage     = "https://github.com/Giiixx/SiltaBluetooth"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Cliff" => "cliffchem@aengin.com" }
  s.platform     = :ios
  s.ios.deployment_target = '8.0'
  s.source       = { :git => "https://github.com/Giiixx/SiltaBluetooth.git", :tag => "#{s.version}" }

  s.source_files = 'SiltaBluetooth/Framework/*'
  s.requires_arc = true

end
