#
# Be sure to run `pod lib lint StylableNavigationBar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'StylableNavigationBar'
  s.version          = '1.0.1'
  s.swift_version    = '5.0'
  s.summary          = 'StylableNavigationBar allows you to easaly manage your navigation and status bar appearance'
  s.description      = <<-DESC
StylableNavigationController is a UINavigationController subclass and with an ability to apply smooth color transitions between child view controllers. You can easaly create your own navigation bar styles and the StylableNavigationBar will handle status bar appearance and all the transitions for you. The only thing you have to do is to replace a standard UINavigationController with the StylableNavigationController and provide a style info for child controllers
                       DESC

  s.homepage         = 'https://github.com/pchernovolenko/StylableNavigationBar'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Pavlo Chernovolenko' => 'paul.chernovolenko@gmail.com' }
  s.source           = { :git => 'https://github.com/pchernovolenko/StylableNavigationBar.git', :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'
  s.source_files = 'StylableNavigationBar/Classes/**/*'
  s.frameworks = 'UIKit'
end
