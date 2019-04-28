#
# Be sure to run `pod lib lint RCLog.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RCLog'
  s.version          = '0.1'
  s.summary          = 'A library for clean and relevant logs'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                        A library for clean and relevant logs.
                       DESC

  s.homepage         = 'http://www.imagin.ro'
  s.license          = 'Copyright © 2019 IMAGIN Soft. All rights reserved.'
  s.author           = { 'Cristian Baluta' => 'cristi.baluta@gmail.com' }
  s.source           = { :git => 'https://github.com/ralcr/RCLog.git'}
  #, :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.source_files = 'src/*.{swift}'
  s.requires_arc = true

end
