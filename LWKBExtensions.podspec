#
# Be sure to run `pod lib lint LWKBExtensions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LWKBExtensions'
  s.version          = '1.0.0'
  s.summary          = '万能输入法的键盘使用到的类的扩展.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
LWKBExtensions，万能输入法的键盘使用到的类的扩展.
                       DESC

  s.homepage         = 'https://github.com/luowei/LWKBExtensions'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'luowei' => 'luowei@wodedata.com' }
  s.source           = { :git => 'https://github.com/luowei/LWKBExtensions.git' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LWKBExtensions/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LWKBExtensions' => ['LWKBExtensions/Assets/*.png']
  # }

  s.public_header_files = 'LWKBExtensions/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
