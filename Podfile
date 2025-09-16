# Uncomment the next line to define a global platform for your project
 platform :ios, '15.6'

target 'LivenessSDK2Sample' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for LivenessSDK2Sample
    pod 'IDentityLivenessSDK2.0'
    pod 'IDentityLivenessModels'
    pod 'TensorFlowLiteSwift', '~> 2.7.0'
    pod 'GoogleMLKit/FaceDetection'
    pod 'GZIP'

end

post_install do |installer|
    installer.aggregate_targets.each do |aggregate_target|
        if aggregate_target.name == 'Pods-LivenessSDK2Sample'
            aggregate_target.xcconfigs.each do |config_name, config_file|
                aggregate_target.pod_targets.each do |pod_target|
                    pod_target.specs.each do |spec|
                        if spec.attributes_hash['vendored_frameworks'] != nil or (spec.attributes_hash['ios'] != nil and spec.attributes_hash['ios']['vendored_frameworks'] != nil)
                            puts "Removing #{spec.name}"
                            config_file.frameworks.delete(spec.name)
                        end
                    end
                end
                xcconfig_path = aggregate_target.xcconfig_path(config_name)
                config_file.save_as(xcconfig_path)
            end
        end
    end
end

# install! 'cocoapods',
#   :git => {
#     :shallow_clone => false
#   }

# platform :ios, '12.0'
# use_frameworks!

# target 'YourAppTargetName' do
#   # Example of your private pod
#   pod 'IDentityLivenessSDK2.0', :git => 'https://gitlab.idmission.com/apps/sdk2.0/ios/cocoapods/IDentityLivenessSDK2.0.git', :tag => '10.1.16.2.2'
#   pod 'IDentityLiteModels', :git => 'https://gitlab.idmission.com/apps/sdk2.0/ios/cocoapods/IDentityLivenessSDK2.0.git', :tag => '10.1.16.2.2'
#   # Add other dependencies here
# end
