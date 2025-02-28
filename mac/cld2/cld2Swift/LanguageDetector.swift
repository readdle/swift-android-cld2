//
//  LanguageDetector.swift
//  cld2Swift
//
//  Created by Yury on 10/18/17.
//  Copyright © 2017 yuryybk. All rights reserved.
//

import Foundation
import libcld2

public struct LanguageDetectionResult {
    public let languages: [String]
    public let percents: [Int32]
    public let isReliable: Bool
}

public class LanguageDetector {

    public class func detectLanguage(string: String, strict: Bool = false) -> [String] {
        self.detectLanguage(string: string, strict: strict, isPlainText: false)?.languages ?? []
    }

    public class func detectLanguage(string: String, strict: Bool = false, isPlainText: Bool = false) -> LanguageDetectionResult? {
        guard let data = string.data(using: .utf8) else {
            assert(false)
            return nil
        }

        return data.withUnsafeBytes { (ptr: UnsafeRawBufferPointer) -> LanguageDetectionResult? in
            guard let dataPtr = ptr.bindMemory(to: Int8.self).baseAddress else {
                assert(false)
                return nil
            }

            let cResult = detectLanguagesV2(dataPtr, Int32(data.count), strict ? 1 : 0, isPlainText ? 1 : 0)
            defer {
                CLanguageDetectionResultRelease(cResult)
            }
            var languages = [String]()
            var percents = [Int32]()
            for i in 0 ..< 3 {
                if let ptr = cResult.language3?[i] {
                    let lang = String(cString: ptr)
                    guard lang != "un" else {
                        // skip unknown language
                        continue
                    }
                    languages.append(lang)
                    percents.append(cResult.percent3[i])
                }
            }
            return LanguageDetectionResult(languages: languages, percents: percents, isReliable: cResult.is_reliable > 0)
        }
    }
    
}
