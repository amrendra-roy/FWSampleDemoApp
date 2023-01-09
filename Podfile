# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

# below source and pod version is usefull when are creating pod space in git, but i am facing the issue for other version which is creatd on top of old to fix new changes other commit. So ignore this approach as of now. Instead use direct git path and version number
#source 'https://github.com/amrendra-roy/DemoPodSpacesAtGit.git' #pod FWAmarFramewokrFromGitOnly availble here
#pod 'FWAmarFramewokrFromGitOnly', '~> 0.1.1'



target 'FWSampleDemoApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for FWSampleDemoApp
  # Amar: using framework without sending on Git, just add the local path for sdk project if sdk have PODspace file
   pod 'FWAmarRechargeSDK', :path => '../FWAmarRechargeSDK'
   
   # pod 'FWAmarInvestmentSDK', :path => '../FWAmarInvestmentSDK' # if project don't have podspace file, we can not use like this, instead drag and drop, and add in Generel setting and Add using + symbol

  pod 'FWAmarFramewokrFromGitOnly', :git => 'https://github.com/amrendra-roy/FWAmarFramewokrFromGitOnly.git', :tag => '0.1.1'
  pod 'MBProgressHUD'

end
