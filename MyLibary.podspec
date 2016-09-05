#
# Be sure to run `pod lib lint MyLibary.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MyLibary'
  s.version          = '0.1.0'
  s.summary          = '画线文件.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
画线测试，这是一个长的描述，画线测试，这是一个长的描述，画线测试，这是一个长的描述，
                       DESC

  s.homepage         = 'https://github.com/luohaiquan/cocoapodTest'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '罗浩' => '9789488182@qq.com' }
  s.source           = { :git => 'https://github.com/luohaiquan/cocoapodTest.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MyLibary/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MyLibary' => ['MyLibary/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
