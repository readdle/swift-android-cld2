//
//  LanguageDetector.swift
//  cld2Swift
//
//  Created by Yury on 10/18/17.
//  Copyright © 2017 yuryybk. All rights reserved.
//

import Foundation
import libcld2

public class LanguageDetector {
    
    public class func detectLanguage(string: String) -> [String] {
        var result = [String]()
        
        let data = string.data(using: String.Encoding.utf8)
        var dataPtr: UnsafePointer<Int8>!
        data?.withUnsafeBytes({ (body: UnsafePointer<Int8>)  in
            dataPtr = body
        })
        
        let langPtrs = detectLanguages(dataPtr, Int32(data?.count ?? 0), 0)
        for i in 0 ..< 3 {
            if let ptr = langPtrs?[i] {
                let lang = String(cString: ptr)
                result.append(lang)
            }
        }
        releaseLanguages(langPtrs)
        return result
    }
}
