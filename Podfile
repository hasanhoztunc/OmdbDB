# platform :ios, '9.0'

def firebase_pods
  pod 'Firebase/Core'
	pod 'Firebase/RemoteConfig'
end

$alamofire_version = "~> 5.5"
$Kingfisher_version = '~> 6.0'

def networking_pods
  pod 'Alamofire', $alamofire_version
end

def ui_pods
  pod 'Kingfisher', $Kingfisher_version
end

target 'OmdbDB' do
  use_frameworks!

  firebase_pods
  networking_pods
  ui_pods
  
end
