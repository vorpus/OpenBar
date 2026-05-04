require_relative 'scripts/generate_xcodeproj'

OpenBoringBarProjectGenerator.ensure!

platform :osx, '14.0'
project 'OpenBoringBar.xcodeproj'

install! 'cocoapods',
         :deterministic_uuids => false,
         :warn_for_unused_master_specs_repo => false,
         :integrate_targets => false

target 'OpenBoringBar' do
  # Reserved spot for third-party dependencies. v1.0 uses system frameworks for core functionality.
  # pod 'KeyboardShortcuts'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['MACOSX_DEPLOYMENT_TARGET'] = '14.0'
      config.build_settings['SWIFT_VERSION'] = '5.0'
    end
  end
end
