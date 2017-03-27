Pod::Spec.new do |s|
  s.name             = 'NSTimeZone-Coordinate'
  s.version          = '1.0.1'
  s.summary          = 'NSTimeZone category that adds coordinates.'

  s.homepage         = 'https://github.com/friedbunny/NSTimeZone-Coordinate'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = 'Jason Wray'
  s.source           = { :git => 'https://github.com/friedbunny/NSTimeZone-Coordinate.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'NSTimeZone+Coordinate/*.{h,m}'

  s.resources = ['NSTimeZone+Coordinate/timezones.plist']
end
