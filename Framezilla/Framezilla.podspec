Pod::Spec.new do |spec|
    spec.name           = "Framezilla"
    spec.version        = "1.0"
    spec.summary        = "Comfortable syntax for working with frames."

    spec.homepage       = "https://github.com/Otbivnoe/Framezilla"
    spec.license        = { type: 'MIT', file: 'LICENSE' }
    spec.authors        = { "Nikita Ermolenko" => 'gnod94@gmail.com' }
    spec.platform       = :ios
    spec.requires_arc   = true

    spec.ios.deployment_target  = '10.0'
    spec.source                 = { git: "https://github.com/Otbivnoe/Framezilla.git", tag: "#{spec.version}"}
    spec.source_files           = "Framezilla/**/*.{h,swift}"
end
