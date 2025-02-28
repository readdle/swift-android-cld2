//
//  compact_lang_det_c.h
//  cld2
//
//  Created by Yury on 10/18/17.
//  Copyright © 2017 yuryybk. All rights reserved.
//

#include "compact_lang_det.h"
#include "compact_lang_det_c.h"
#include "encodings.h"

char** detectLanguages(const char* buffer,
                       int buffer_length,
                       char strict_mode) {
    
    char** result = new char*[3];
    bool is_plain_text = false;
    CLD2::Language langs[3];
    int percents[3];
    bool is_reliable = false;
    int text_bytes = 0;
    DetectLanguageSummary(buffer,
                          buffer_length,
                          is_plain_text,
                          (bool)strict_mode,
                          langs,
                          percents,
                          &text_bytes,
                          &is_reliable);
    
    for (int i = 0; i < 3; i++) {
        const char* langCode = LanguageCode(langs[i]);
        result[i] = const_cast<char*>(langCode);
    }
    return result;
}

void releaseLanguages(char** langs) {
    delete langs;
}

CLanguageDetectionResult detectLanguagesV2(const char* buffer,
        int buffer_length,
        char strict_mode,
        char is_plain_text) {
    const char** result = new const char*[3];

    // based on detect(PyObject *self, PyObject *args, PyObject *kwArgs)
    // see: https://github.com/aboSamoor/pycld2/blob/c71aa20a5cb04c93ac434abafea53bd570c9c1dc/bindings/pycldmodule.cc#L60

    // cld2 also suggest this function for use
    // see: https://github.com/CLD2Owners/cld2/blob/b56fa78a2fe44ac2851bae5bf4f4693a0644da7b/public/compact_lang_det.h#L274

    CLD2::CLDHints cldHints;
    cldHints.tld_hint = 0;
    cldHints.content_language_hint = 0;
    cldHints.encoding_hint = CLD2::UNKNOWN_ENCODING;

    int flags = 0;

    CLD2::Language langs[3];
    int* percents = new int[3];
    double normalized_scores[3];

    int text_bytes = 0;
    bool is_reliable = false;
    int validPrefixBytes;

    CLD2::ExtDetectLanguageSummaryCheckUTF8(buffer,
                                            buffer_length,
                                            (bool)is_plain_text,
                                            &cldHints,
                                            flags,
                                            langs,
                                            percents,
                                            normalized_scores,
                                            0,
                                            &text_bytes,
                                            &is_reliable,
                                            &validPrefixBytes);

    if (is_reliable == false) {
        CLD2::DetectLanguageSummary(buffer,
                buffer_length,
                (bool)is_plain_text,
                (bool)strict_mode,
                langs,
                percents,
                &text_bytes,
                &is_reliable);
    }

    for (int i = 0; i < 3; i++) {
        result[i] = LanguageCode(langs[i]);
    }

    struct CLanguageDetectionResult r = {
            result,
            percents,
            text_bytes,
            static_cast<char>(is_reliable ? 1 : 0)
    };
    return r;
}

void CLanguageDetectionResultRelease(CLanguageDetectionResult result) {
    delete result.language3;
    delete result.percent3;
}
