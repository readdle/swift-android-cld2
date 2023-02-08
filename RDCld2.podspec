Pod::Spec.new do |s|
  s.name         = "RDCld2"
  s.version      = "1.0.0"
  s.summary      = "Compact Language Detector 2"
  s.homepage     = "https://github.com/readdle/swift-android-cld2"
  s.license      = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
  s.author       = { "Dick Sites" => "dsites@google.com" }
  s.source       = { :git => "https://github.com/readdle/swift-android-cld2.git", :tag => "v#{s.version}" }

  s.platforms    = { :ios => '11.0', :osx => '10.13' }

  s.source_files = 
    'internal/integral_types.h',
    'internal/lang_script.h',
    'internal/cldutil.cc',
    'internal/cldutil_shared.cc',
    'internal/compact_lang_det.cc',
    'internal/compact_lang_det_hint_code.cc',
    'internal/compact_lang_det_impl.cc',
    'internal/debug.cc',
    'internal/fixunicodevalue.cc',
    'internal/generated_entities.cc',
    'internal/generated_language.cc',
    'internal/generated_ulscript.cc',
    'internal/getonescriptspan.cc',
    'internal/lang_script.cc',
    'internal/offsetmap.cc',
    'internal/scoreonescriptspan.cc',
    'internal/tote.cc',
    'internal/utf8statetable.cc',
    'internal/generated_distinct_bi_0.cc',
    'internal/cld_generated_cjk_uni_prop_80.cc',
    'internal/cld2_generated_cjk_compatible.cc',
    'internal/cld_generated_cjk_delta_bi_4.cc',
    'internal/cld2_generated_quadchrome_2.cc',
    'internal/cld2_generated_deltaoctachrome.cc',
    'internal/cld2_generated_distinctoctachrome.cc',
    'internal/cld_generated_score_quad_octa_2.cc',
    'internal/compact_lang_det_c.cc',
    'public/*.h'

  s.public_header_files = 'public/compact_lang_det_c.h'

  s.compiler_flags = '-std=c++98'
end
