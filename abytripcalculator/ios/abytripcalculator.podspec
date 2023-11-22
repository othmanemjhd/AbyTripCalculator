Pod::Spec.new do |s|
s.name             = 'abytripcalculator'
s.version          = '0.0.1'  
s.summary          = 'Custom pod creation for iOS' 
s.description      = 'Describe the use of pod file'



s.homepage         = 'https://github.com/othmanemjhd/AbyTripCalculator.git'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'username' => 'othmane.mjhd@gmail.com' }
s.source           = { :git => 'https://github.com/othmanemjhd/AbyTripCalculator.git', :tag => s.version.to_s }
s.ios.deployment_target = 11.0
end