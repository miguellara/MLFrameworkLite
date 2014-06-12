Pod::Spec.new do |s|
  s.name             = "MLFrameworkLite"
  s.version          = "0.0.3"
  s.summary          = "Lite framework with some helpful macros and helpers."
  s.homepage         = "https://bitbucket.org/miguellara/mlframeworklite.git"
  s.license          = 'MIT'
  s.author           = { "Miguel Lara" => "miguel@mac.com" }
  s.source           = { :git => "https://bitbucket.org/miguellara/mlframeworklite.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/bigbrowntheory'

  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'
  s.requires_arc = true

  s.source_files = 'MLFrameworkLite/**/*.{h,m}'
  s.frameworks = 'QuartzCore'
  s.dependency 'libextobjc', '~> 0.4'
end
