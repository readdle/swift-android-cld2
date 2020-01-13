cmake_minimum_required(VERSION 3.12.3)

project(RDCld2 LANGUAGES CXX)

set (SOURCE_FILES
    internal/cldutil.cc
    internal/cldutil_shared.cc
    internal/compact_lang_det.cc
    internal/compact_lang_det_hint_code.cc
    internal/compact_lang_det_impl.cc
    internal/debug.cc
    internal/fixunicodevalue.cc 
    internal/generated_entities.cc
    internal/generated_language.cc
    internal/generated_ulscript.cc
    internal/getonescriptspan.cc
    internal/lang_script.cc
    internal/offsetmap.cc
    internal/scoreonescriptspan.cc
    internal/tote.cc
    internal/utf8statetable.cc

    internal/generated_distinct_bi_0.cc
    internal/cld_generated_cjk_uni_prop_80.cc
    internal/cld2_generated_cjk_compatible.cc
    internal/cld_generated_cjk_delta_bi_4.cc
    internal/cld2_generated_quadchrome_2.cc
    internal/cld2_generated_deltaoctachrome.cc
    internal/cld2_generated_distinctoctachrome.cc
    internal/cld_generated_score_quad_octa_2.cc

    internal/compact_lang_det_c.cc
    )

set (PUBLIC_HEADERS
    public/compact_lang_det_c.h
    )

set (MODULE_MAP
    modules/RDCld2/module.modulemap
    )

include_directories(
    public
)

add_library(RDCld2 ${SOURCE_FILES})

install(TARGETS RDCld2
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION bin)
install(FILES ${PUBLIC_HEADERS} ${MODULE_MAP} DESTINATION include/RDCld2)
