# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Innova' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'Alamofire'
  pod 'SwiftyJSON'
  pod 'Firebase/Core'
  pod 'Firebase/Messaging'
  pod 'Firebase/Crashlytics'
  pod 'SwiftMessages'
  pod 'GoogleSignIn'
  pod "TTGSnackbar"
  pod 'IQKeyboardManagerSwift'
  pod 'SwiftDate'
  pod 'Kingfisher'
  pod 'DropDown'
  pod 'UIDrawer', :git => 'https://github.com/Que20/UIDrawer.git', :tag => '1.0'

end
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
end
