s.name         = "SSInject"
s.version      = "1.0.0"
s.summary      = "Dependancy injection framework"
s.description  = "SSInject is developing framework for dependancy injection in swift applications."
s.homepage     = "https://github.com/sulabh9999/SSInject/blob/master/README.md"

s.license      = "MIT"
s.platform     = :ios, "9.0"
deployment_target

s.source       = { :git => "https://github.com/sulabh9999/SSInject.git", tag => "v#{s.version.to_s}" }


s.source_files = "SSInject", "SSInject/**/*.{h,m,swift}"

s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3' }

