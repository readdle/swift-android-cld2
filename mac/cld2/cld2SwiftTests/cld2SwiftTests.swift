//
//  cld2SwiftTests.swift
//  cld2SwiftTests
//
//  Created by Yury on 10/18/17.
//  Copyright © 2017 yuryybk. All rights reserved.
//

import XCTest
@testable import cld2Swift

class cld2SwiftTests: XCTestCase {
    

    let kTeststr_be_Cyrl = " а друкаваць іх не было тэхнічна магчыма бліжэй за вільню тым самым часам нямецкае кіраўніцтва прапаноўвала апроч ўвядзення лацінкі яе";
    let kTeststr_bg_Cyrl = " а дума попада в състояние на изпитание ключовите думи с предсказана малко под то изискване на страниците за търсене в";
    let kTeststr_uk_Cyrl = " а більший бюджет щоб забезпечити собі максимум прибутків від переходів відстежуйте свої об яви за датою географічним розташуванням";
    let kTeststr_en_Latn = " a backup credit card by visiting your billing preferences page or visit the adwords help centre for more details https adwords google com support bin answer py answer hl en we were unable to process the payment of for your outstanding google adwords";
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBELanguage() {
        let result = LanguageDetector.detectLanguage(string: kTeststr_be_Cyrl)
        XCTAssert(result.contains("be"))
    }
    
    func testBGLanguage() {
        let result = LanguageDetector.detectLanguage(string: kTeststr_bg_Cyrl)
        XCTAssert(result.contains("bg"))
    }
    
    func testUKLanguage() {
        let result = LanguageDetector.detectLanguage(string: kTeststr_uk_Cyrl)
        XCTAssert(result.contains("uk"))
    }
    
    func testENLanguage() {
        let result = LanguageDetector.detectLanguage(string: kTeststr_en_Latn)
        XCTAssert(result.contains("en"))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
