//
//  compact_lang_det_c.h
//  cld2
//
//  Created by Yury on 10/18/17.
//  Copyright © 2017 yuryybk. All rights reserved.
//

#ifndef compact_lang_det_c_h
#define compact_lang_det_c_h


#ifdef __cplusplus
extern "C" {
#endif

    char** detectLanguages(const char* buffer,
                           int buffer_length,
                           char strict_mode);
    
    void releaseLanguages(char** langs);
    
    struct CLanguageDetectionResult {
        const char** language3;
        int* percent3;
        int text_bytes;
        char is_reliable;
    };
    typedef struct CLanguageDetectionResult CLanguageDetectionResult;

    CLanguageDetectionResult detectLanguagesV2(const char* buffer,
            int buffer_length,
            char strict_mode,
            char is_plain_text);

    void CLanguageDetectionResultRelease(CLanguageDetectionResult result);
    
#ifdef __cplusplus
}
#endif



#endif /* compact_lang_det_c_h */
