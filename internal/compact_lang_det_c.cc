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
