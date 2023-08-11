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

CLanguageDetectionResult detectLanguages(const char* buffer,
        int buffer_length,
        char strict_mode,
        char is_plain_text) {
    const char** result = new const char*[3];
    CLD2::Language langs[3];
    int* percents = new int[3];
    bool is_reliable = false;
    int text_bytes = 0;
    DetectLanguageSummary(buffer,
            buffer_length,
            (bool)is_plain_text,
            (bool)strict_mode,
            langs,
            percents,
            &text_bytes,
            &is_reliable);
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
