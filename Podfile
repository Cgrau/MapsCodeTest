# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def testing_pods
 use_frameworks!
 pod 'SnapKit', '~> 5.0.0'
 pod 'RxBlocking', '5.0'
 pod 'OHHTTPStubs/Swift'
end

def app_pods
  use_frameworks!
  pod 'Sourcery'
  pod 'RxSwift',    '5.0'
  pod 'RxCocoa',    '5.0'
  pod 'Moya', '14.0.0'
  pod 'Moya/RxSwift', '14.0.0'
  pod 'SwiftLint'
end

target 'MapsCodeTest' do
  app_pods
end

target 'MapsCodeTestTests' do
  testing_pods
end

target 'MapsCodeTestUITests' do
  # Pods for testing
end
