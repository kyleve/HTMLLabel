
Pod::Spec.new do |s|
  s.name         = 'HTMLLabel'
  s.version      = '0.0.1'
  s.summary      = 'Create rich UILabels from HTML'
  s.homepage     = 'https://github.com/kyleve/HTMLLabel'
  s.license      = 'Apache License, Version 2.0'
  s.author       = { 'Kyle' => 'k@squareup.com' }
  s.source       = { git: 'https://github.com/kyleve/HTMLLabel.git', tag: "#{s.version}" }

  s.ios.deployment_target = '11.0'

  s.swift_versions = ['5.0']

  s.source_files = 'HTMLLabel/Sources/**/*.{swift,h,m}'

  s.weak_framework = 'SwiftUI'

  unless ENV['HTMLLabel_PUBLISHING']

    # These tests can only be run locally, because they depend on local pods.

    s.test_spec 'Tests' do |test_spec|
      test_spec.source_files = 'HTMLLabel/Tests/**/*.{swift}'
      test_spec.ios.resource_bundle = { 'HTMLLabelTestsResources' => 'HTMLLabel/Tests/Resources/**/*.*' }

      test_spec.framework = 'XCTest'

      test_spec.requires_app_host = true
    end
  end
end
