# Compact Language Detector 2

Fork of the [cld2](https://github.com/CLD2Owners/cld2) framework. Read about details in the original [cld2 summary](https://github.com/CLD2Owners/cld2).

## What is different?

- Added some tweaks to **not exclude detected languages with low probability rate** from the final result (see commits history). Introduced `strict_mode` parameter.  
- Added [C-wrapper](https://github.com/yuryybk/cld2/blob/master/internal/compact_lang_det_c.cc#L13) for [DetectLanguageSummary()](https://github.com/yuryybk/cld2/blob/master/public/compact_lang_det.h#L187).
- Added [Swift-wrapper](https://github.com/yuryybk/cld2/blob/master/mac/cld2/cld2Swift/LanguageDetector.swift#L14) for C-wrapper for DetectLanguageSummary().
- Added [Mac\iOS project](https://github.com/yuryybk/cld2/tree/master/mac/cld2) and set of [tests](https://github.com/yuryybk/cld2/blob/master/mac/cld2/cld2SwiftTests/cld2SwiftTests.swift).
- Added [scripts](https://github.com/yuryybk/cld2/tree/master/android) to build cld2 library for Android.
- Swift-wrapper and tests are compilable for Android with help of [swift-android-toolchain](https://github.com/readdle/swift-android-toolchain).

## License

This project is licensed under the Apache 2.0 - see the [LICENSE.md](LICENSE.md) file for details



