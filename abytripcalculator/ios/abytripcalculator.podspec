Pod::Spec.new do |s|
s.name             = 'abytripcalculator'
s.version          = '1.0.0'
s.summary          = 'Custom pod creation for iOS' 
s.description      = 'Describe the use of pod file'



s.homepage         = 'https://github.com/othmanemjhd/AbyTripCalculator.git'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'username' => 'othmane.mjhd@gmail.com' }
s.source           = { :git => 'https://github.com/othmanemjhd/AbyTripCalculator.git', :tag => s.version.to_s }
s.ios.deployment_target = 11.0
s.source_files = 'abytripcalculator/**/*.{h,m,swift}'
end