Pod::Spec.new do |s|
    s.name         = "SQJSRequestTool"
    s.version      = "0.0.1"
    s.ios.deployment_target = '7.0'
    s.summary      = "janesi network request tool"
    s.homepage     = "https://github.com/shuangquanH/SQJSRequestTool"
    s.license              = { :type => "MIT", :file => "LICENSE" }
    s.author             = { "shuangquanH" => "butrys@163.com" }
    s.social_media_url   = "http://flysblog.lofter.com"
    s.source       = { :git => "https://github.com/shuangquanH/SQJSRequestTool.git", :tag => s.version }
    s.requires_arc = true
    s.ios.dependency 'AFNetworking'
    s.ios.dependency 'SVProgressHUD'

    s.source_files = 'SQRequestTool/*.{h,m}'
end