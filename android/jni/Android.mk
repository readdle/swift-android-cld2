CURRENT_DIR := $(realpath $(call my-dir))
BASE_DIR := $(realpath $(CURRENT_DIR)/../..)

src_dir := $(realpath $(BASE_DIR)/internal)
h_dir := $(realpath $(BASE_DIR)/public)

include $(CLEAR_VARS)

SRC_FILES := cldutil.cc \
			 cldutil_shared.cc \
			 compact_lang_det.cc \
			 compact_lang_det_hint_code.cc \
  			 compact_lang_det_impl.cc \
             debug.cc \
             fixunicodevalue.cc \
             generated_entities.cc \
             generated_language.cc \
             generated_ulscript.cc  \
             getonescriptspan.cc \
             lang_script.cc \
             offsetmap.cc \
             scoreonescriptspan.cc \
             tote.cc utf8statetable.cc  \
             cld_generated_cjk_uni_prop_80.cc \
             cld2_generated_cjk_compatible.cc  \
             cld_generated_cjk_delta_bi_4.cc  \
             generated_distinct_bi_0.cc \
             cld2_generated_quadchrome_2.cc \
             cld2_generated_deltaoctachrome.cc \
             cld2_generated_distinctoctachrome.cc \
             cld_generated_score_quad_octa_2.cc \
             compact_lang_det_c.cc
LOCAL_MODULE     := cld2
LOCAL_C_INCLUDES += $(h_dir)
LOCAL_SRC_FILES  := $(addprefix $(src_dir)/,$(SRC_FILES))
LOCAL_CPPFLAGS := -fPIC -std=c++98
include $(BUILD_SHARED_LIBRARY)