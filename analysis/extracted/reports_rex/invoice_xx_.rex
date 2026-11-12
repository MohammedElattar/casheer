/*


#ROS Script Version 12.2.1.4.0 - Production

Copyright (c) 1992, 2022, Oracle and/or its affiliates. All rights reserved.
*/

DESCRIBE  SRW2_DISPLAY_TAG
BEGIN
  UB4       ITEMID
  TEXT      CM_TEXT
  TEXT      CM_FILL
  TEXT      CM_BORD
  SB4       PENWID
  UB4       ADD_FLAGS
  UB2       TEXTPAT
  UB2       TEXTFORE
  UB2       TEXTBACK
  UB2       LINEPAT
  UB2       LINEFORE
  UB2       LINEBACK
  UB2       FILLPAT
  UB2       FILLFORE
  UB2       FILLBACK
  UB2       FONTFACE
  UB2       FONTSIZE
  UB2       FONTSTYLE
  UB2       FONTWEIGHT
  UB2       CHARSET
  UB2       CHARWIDTH
  UB2       BASELINE
  UB2       KERNING
  UB2       DASHSTYLE
  UB2       CAPSTYLE
  UB2       JOINSTYLE
  UB2       BORDSTYLE
  UB1       PERS_FLAGS
  UB4       NULL_FLAGS
END

DESCRIBE  TOOL_COMMENT
BEGIN
  UB4       ITEMID
  UB4       OBJECT_ID
  TLONG     CMTLFID_T
END

DESCRIBE  TOOL_PLSQL
BEGIN
  UB4       ITEMID
  TEXT      NAME
  BLONG     PLSLFID_EP
  UB4       OBJECT_ID
  UB1       TYPE
  TLONG     PLSLFID_ST
  UB4       STATE
END

DESCRIBE  SRW2_ELEMENT
BEGIN
  UB4       ITEMID
  TEXT      ALIAS
  TEXT      EXPR
  TEXT      DESC_EXPR
  UB2       SEL_ORDER
  UB2       DATA_TYPE
  UB4       WIDTH
  SB2       SCALE
  SB2       PRECISION
  UB4       QUERYID
  UB2       ODATA_TYPE
  UB4       RELOPLST
  UB1       PERS_FLAGS
END

DESCRIBE  SRW2_QUERY
BEGIN
  UB4       ITEMID
  TEXT      NAME
  UB4       TAG
  UB2       DISP_ORDER
  TLONG     QUERYLFID
  TEXT      NET_LOGON
  TEXT      EXT_QUERY
  TEXT      TEMP_TABLE
  UB1       TEMP_FLAGS
  UB1       EXEC_FREQ
  UB4       MAX_ROWS
  SB4       X
  SB4       Y
  SB4       WD
  SB4       HT
  UB1       PERS_FLAGS
  UB1       DSTYPE
  TEXT      PLUGINXML
  TEXT      PLUGINCLZ
  UB4       MAJORVER
  UB4       MINORVER
  UB4       SIGNONPRM
  TLONG     PLUGINXMLID
END

DESCRIBE  SRW2_GROUP
BEGIN
  UB4       ITEMID
  TEXT      NAME
  UB4       TAG
  UB2       DISP_ORDER
  UB4       PTAG
  UB4       QUERY_ID
  UB4       PARENT_ID
  UB1       QLF_TYPE
  SB2       QLF_ARG
  UB4       QLF_COLUMN
  UB1       GLF_TYPE
  SB2       GLF_ARG
  UB4       GLF_COLUMN
  UB1       RLF_TYPE
  SB2       RLF_ARG
  UB4       RLF_COLUMN
  UB1       CROSS_PROD
  UB4       PRODUCT_ID
  UB4       NUM_POINTS
  BINARY    NUM_POINTS:POINTS
  SB4       X
  SB4       Y
  SB4       WD
  SB4       HT
  UB2       DFLT_DIR
  UB1       PERS_FLAGS
  TEXT      MAIL_TEXT
  TEXT      XML_TAG
  TEXT      XML_ATTR
  BOOLEAN   XML_SUPPRESS
  TEXT      OUTER_XML_TAG
  TEXT      OUTER_ATTR
END

DESCRIBE  SRW2_COLUMN
BEGIN
  UB4       ITEMID
  TEXT      NAME
  UB4       TAG
  UB2       DISP_ORDER
  UB4       GROUP_ID
  UB2       SOURCE
  UB4       SOURCE_ID
  UB4       COMPUTE_ID
  TEXT      PROD_ORDER
  UB4       RESET_ID
  TEXT      NULL_VALUE
  TEXT      INPUT_MASK
  UB1       OPERATOR
  UB1       DATA_TYPE
  UB1       FILE_TYPE
  UB4       WIDTH
  UB2       FLAGS
  SB2       PRECISION
  SB2       SCALE
  SB4       X
  SB4       Y
  SB4       WD
  SB4       HT
  TEXT      DFLT_LBL
  UB4       DFLT_WID
  UB4       DEREF_ID
  UB2       ODATA_TYPE
  UB4       DFLT_HGT
  UB2       PARA_TYPE
  UB1       PLOV_RTYPE
  UB4       PLOV_SLISTID
  TEXT      PLOV_SELECT
  TEXT      PLOV_COL
  UB1       REFDTYPE
  UB1       PERS_FLAGS
  UB1       EXPANDED
  UB4       SUBGROUP
  TEXT      TYPENAME
  TEXT      SCHEMA
  UB4       PARENT_COL
  UB1       BOUND
  UB4       SORTSRCCOL
  UB4       SORTCOL
  TEXT      XML_TAG
  TEXT      XML_ATTR
  UB1       XML_SUPPRESS
  UB1       CONTAIN_XML
  UB4       RTYPE
  TEXT      PDSCLS
END

DESCRIBE  SRW2_LINK
BEGIN
  UB4       ITEMID
  UB4       TAG
  UB2       DISP_ORDER
  UB4       PARENT_ID
  UB4       P_COLUMN
  UB4       CHILD_ID
  UB4       C_COLUMN
  UB1       CLAUSE
  UB1       OPERATOR
  UB4       NUM_POINTS
  BINARY    NUM_POINTS:POINTS
  UB1       PERS_FLAGS
END

DESCRIBE  SRW2_BOILERPLATE
BEGIN
  UB4       ITEMID
  TEXT      NAME
  UB4       TAG
  UB2       DISP_ORDER
  UB4       FORMATFLAG
  TEXT      PRE_CODE
  TEXT      POST_CODE
  SB4       X
  SB4       Y
  SB4       WD
  SB4       HT
  UB4       PAGE
  UB1       TYPE
  UB4       NUM_POINTS
  BINARY    NUM_POINTS:POINTS
  UB2       GRAPH_TYPE
  BLONG     GRAPH_LFID
  SB4       GRAPH_LEN
  UB1       CLOSE
  SB2       MIN_WIDOWS
  SB2       MIN_ORPHAN
  SB2       MAX_LINES
  UB1       TEXT_WRAP
  UB1       ALIGNMENT
  UB1       ARCFILL
  UB1       ARROWSTYLE
  SB2       ROTANGLE
  SB4       SPACING
  TEXT      LINKEDFILE
  BLONG     POINTSLFID
  BLONG     OLE_LFID
  SB4       OLE_LEN
  UB4       BIDI_DIR
  UB4       ASSOCOBJ
  UB1       PERS_FLAGS
  UB4       GROUP_NODE
  UB1       GN_TYPE
  UB4       NULL_IND1
  UB4       NULL_IND2
  UB4       NULL_IND3
  UB4       TEMPL_ID
  UB4       FRAME_ID
  TEXT      ALTXT
  TEXT      HEADERS
  UB4       LABFIELD
  TEXT      ACCKEY
END

DESCRIBE  SRW2_TEXT_SEGMENT
BEGIN
  UB4       ITEMID
  UB2       SEG_ORDER
  UB4       TAG
END

DESCRIBE  SRW2_OG_DOCUMENT
BEGIN
  UB4       ITEMID
  TEXT      NAME
  UB4       TAG
  UB2       DISP_ORDER
  UB4       FORMATFLAG
  TEXT      PRE_CODE
  TEXT      POST_CODE
  SB4       X
  SB4       Y
  SB4       WD
  SB4       HT
  UB4       PAGE
  TEXT      OG_DNAME
  TEXT      OG_QNAME
  UB2       OG_SLOC
  UB4       GROUP_ID
  UB1       PERS_FLAGS
  UB2       OG_DTYPE
  UB4       PLACE_ID
  UB4       GRP_TOP_ID
  UB4       GRP_BOT_ID
  TEXT      OG_LINK
  TEXT      CHART_XMLDEF
  TEXT      ALTXT
  TLONG     XMLDEFID
END

DESCRIBE  SRW2_OGD_COLUMN_MAP
BEGIN
  UB4       ITEMID
  UB4       SRW_COLID
  UB2       OG_COLTYPE
  TEXT      OG_COLNAME
  UB1       PERS_FLAGS
  UB1       OG_COLSUBT
END

DESCRIBE  SRW2_FRAME
BEGIN
  UB4       ITEMID
  TEXT      NAME
  UB4       TAG
  UB2       DISP_ORDER
  UB4       FORMATFLAG
  TEXT      PRE_CODE
  TEXT      POST_CODE
  SB4       X
  SB4       Y
  SB4       WD
  SB4       HT
  UB4       PAGE
  UB4       GROUP_ID
  UB4       CONTINUED
  UB2       DIRECTION
  SB2       MIN_WIDOWS
  SB2       MIN_ORPHAN
  SB2       MAX_LINES
  SB4       BETWEEN_X
  SB4       BETWEEN_Y
  SB4       RESERVED
  UB4       BIDI_DIR
  SB2       MAX_COLS
  SB2       MAX_ROWS
  UB1       PERS_FLAGS
  UB4       GROUP_NODE
  UB1       GN_TYPE
  UB4       NULL_IND1
  UB4       NULL_IND2
  UB1       FRAME_TYPE
  UB4       TEMPL_ID
  TEXT      TABCAP
END

DESCRIBE  SRW2_MATRIX
BEGIN
  UB4       ITEMID
  TEXT      NAME
  UB4       TAG
  UB2       DISP_ORDER
  UB4       PAGE
  UB4       DOWN_ID
  UB4       ACROSS_ID
  UB4       GROUP_ID
  UB1       PERS_FLAGS
END

DESCRIBE  SRW2_FIELD
BEGIN
  UB4       ITEMID
  TEXT      NAME
  UB4       TAG
  UB2       DISP_ORDER
  UB4       FORMATFLAG
  TEXT      PRE_CODE
  TEXT      POST_CODE
  SB4       X
  SB4       Y
  SB4       WD
  SB4       HT
  UB4       PAGE
  UB1       PGN_FLAGS
  UB4       PGN_START
  UB4       PGN_INCR
  UB4       PGN_RESET
  UB4       SOURCE_ID
  UB4       CONTINUED
  UB1       ALIGNMENT
  UB1       TEXT_WRAP
  SB2       MIN_WIDOWS
  SB2       MIN_ORPHAN
  SB2       MAX_LINES
  TEXT      MASK
  TEXT      NULL_VALUE
  SB4       SPACING
  UB4       BIDI_DIR
  UB1       PERS_FLAGS
  UB4       GROUP_NODE
  UB1       GN_TYPE
  UB4       NULL_IND1
  UB4       NULL_IND2
  UB4       NULL_IND3
  UB4       TEMPL_ID
  UB4       FRAME_ID
  TEXT      ALTXT
  TEXT      HEADERS
END

DESCRIBE  SRW2_ANCHOR
BEGIN
  UB4       ITEMID
  UB4       TAG
  UB2       DISP_ORDER
  UB4       HEAD_ID
  UB1       HEAD_EDGE
  UB4       HEAD_PCT
  UB4       TAIL_ID
  UB1       TAIL_EDGE
  UB4       TAIL_PCT
  UB4       NUM_POINTS
  BINARY    NUM_POINTS:POINTS
  UB2       COLLAPSE
  UB1       PERS_FLAGS
END

DESCRIBE  SRW2_LAYOUT
BEGIN
  UB4       ITEMID
  UB4       SETTINGS
  SB2       ZOOMPOWER
  UB1       UNITS
  UB1       ORIENT
  SB4       UNITS_WID
  SB4       UNITS_HGT
  SB4       CHAR_WID
  SB4       CHAR_HGT
  SB4       BODY_WID
  SB4       BODY_HGT
  SB4       PAGE_WID
  SB4       PAGE_HGT
  SB4       PRINT_WID
  SB4       PRINT_HGT
  SB4       X_PANELS
  SB4       Y_PANELS
  UB4       HEADERS
  UB4       TRAILERS
  SB4       WINDOW_X
  SB4       WINDOW_Y
  SB4       WINDOW_WD
  SB4       WINDOW_HT
  UB2       RUN_FLAGS
  TEXT      TITLE
  TEXT      HINT
  TEXT      STATUS
  UB4       MAXHEADERS
  UB4       MAXTRAILERS
  UB4       MAXBODY_ACR
  UB4       MAXBODY_DWN
  UB1       INTERN_VER
  UB2       INTERN_VER2
  UB4       APPLSTATE
  UB4       UIFLAGS
  SB4       GRIDINTC
  SB4       GRIDSNPC
  UB1       HALIGN
  UB1       VALIGN
  SB4       RRECTCNR_WD
  SB4       RRECTCNR_HT
  SB4       SPACING
  UB1       JUSTIFIC
  UB1       ARROWSTYLE
  UB4       UITAG
  UB4       NEXTLISTID
  UB4       IDROLESLIST
  UB4       BIDI_DIR
  UB1       PERS_FLAGS
  SB4       HDR_UNITS_WID
  SB4       HDR_UNITS_HGT
  SB4       HDR_CHAR_WID
  SB4       HDR_CHAR_HGT
  SB4       HDR_BODY_WID
  SB4       HDR_BODY_HGT
  SB4       HDR_PAGE_WID
  SB4       HDR_PAGE_HGT
  SB4       HDR_PRINT_WID
  SB4       HDR_PRINT_HGT
  SB4       HDR_X_PANELS
  SB4       HDR_Y_PANELS
  SB4       TRL_UNITS_WID
  SB4       TRL_UNITS_HGT
  SB4       TRL_CHAR_WID
  SB4       TRL_CHAR_HGT
  SB4       TRL_BODY_WID
  SB4       TRL_BODY_HGT
  SB4       TRL_PAGE_WID
  SB4       TRL_PAGE_HGT
  SB4       TRL_PRINT_WID
  SB4       TRL_PRINT_HGT
  SB4       TRL_X_PANELS
  SB4       TRL_Y_PANELS
  UB4       HDR_MAXBODY_ACR
  UB4       HDR_MAXBODY_DWN
  UB4       TRL_MAXBODY_ACR
  UB4       DIST_OVERLAP
  UB4       TRL_MAXBODY_DWN
  UB4       HDR_RPTON
  UB4       MAI_RPTON
  UB4       TRL_RPTON
END

DESCRIBE  SRW2_DATA_MODEL
BEGIN
  UB4       ITEMID
  UB4       SETTINGS
  SB2       ZOOMPOWER
  SB4       WINDOW_X
  SB4       WINDOW_Y
  SB4       WINDOW_WD
  SB4       WINDOW_HT
  UB2       DFLT_TYPE
  UB4       UIFLAGS
  SB4       GRIDINTC
  SB4       GRIDSNPC
  UB1       HALIGN
  UB1       VALIGN
  SB4       DECURREF_ID
  UB4       GRPMAXROW
  ORADATE   MOD_DATE
  UB1       PERS_FLAGS
  UB1       MUST_SPLIT
  UB1       MAY_SPLIT
  UB2       MIN_TRUNC
  UB1       MIN_PNT_SZ
  TEXT      TMPL_NAME
  UB1       TMPL_CUST
  TEXT      MAIL_TEXT
  TEXT      TEXT_FILE
  TEXT      IMAGE_FILE
  TEXT      VERS_FLAGS
  TEXT      TEXTESC_BR
  TEXT      TEXTESC_AR
  TEXT      TEXTESC_BP
  TEXT      TEXTESC_AP
  TEXT      TEXTESC_BF
  TEXT      TEXTESC_AF
  TEXT      FILEESC_BR
  TEXT      FILEESC_AR
  TEXT      FILEESC_BP
  TEXT      FILEESC_AP
  TEXT      FILEESC_BF
  TEXT      FILEESC_AF
  UB4       ESCTYPES
  TEXT      SECTION_TITLE
  TEXT      FILEESC_MJ
  TLONG     TEXTESC_MJ_ID
  TEXT      XML_TAG
  TEXT      XML_ATTR
  UB1       XML_SUPPRESS
  UB1       PROLOG_TYPE
  TEXT      TEXT_PROLOG
  TEXT      FILE_PROLOG
  UB1       XML_INCLUDEDTD
  VARCHAR   HTMLBUF
  TLONG     HTMLBUFID
  VARCHAR   SAVHTMLBUF
END

DESCRIBE  SRW2_PARAM_FORM
BEGIN
  UB4       ITEMID
  UB4       SETTINGS
  SB2       ZOOMPOWER
  UB1       UNITS
  SB4       UNITS_WID
  SB4       UNITS_HGT
  SB4       FORM_WID
  SB4       FORM_HGT
  SB4       CHAR_WID
  SB4       CHAR_HGT
  SB4       WINDOW_X
  SB4       WINDOW_Y
  SB4       WINDOW_WD
  SB4       WINDOW_HT
  UB4       UIFLAGS
  SB4       GRIDINTC
  SB4       GRIDSNPC
  UB1       HALIGN
  UB1       VALIGN
  SB4       RRECTCNR_WD
  SB4       RRECTCNR_HT
  SB4       SPACING
  UB1       JUSTIFIC
  UB1       ARROWSTYLE
  UB4       UITAG
  UB4       PAGE_TOT
  TEXT      DFLT_TITLE
  TEXT      DFLT_HINT
  TEXT      DFLT_STATUS
  UB1       PERS_FLAGS
END

DESCRIBE  TOOL_MODULE
BEGIN
  VARCHAR   PRODUCT
  VARCHAR   MODTYPE
  VARCHAR   OWNER
  VARCHAR   MODNAME
  UB4       MODID
  UB4       TCS_VER
  UB4       NEXT_ITEMID
  VARCHAR   CREATOR
  ORADATE   CREATE_DATE
  UB4       CREATE_VER
  VARCHAR   MODIFIER
  ORADATE   MOD_DATE
  UB4       MOD_VER
  VARCHAR   COPYRIGHT
  VARCHAR   REQ_ROLE
  UB4       VGS_VER
  UB4       DE_VER
  UB4       ROS_VER
  TEXT      REPLANG
  TEXT      TITLE
  TEXT      AUTHOR
  TEXT      SUBJECT
  TEXT      KEYWORD
  UB1       FORMAT_ORDER
  TEXT      STYLE_SHEETS
  TEXT      CSS_CLASS 
  TEXT      RWTB 
END

DESCRIBE  SRW2_LAYOUT_GROUP
BEGIN
  UB4       ITEMID
  UB2       DISP_ORDER
  UB4       FORMATFLAG
  UB4       NCHILDREN
  UB1       PERS_FLAGS
END

DESCRIBE  ROSSTRINGS
BEGIN
  UB4       groupid
  UB4       stringid
  UB4       lfid
  UB2       cs
  UB2       len
  BINARY    len:str
END

DESCRIBE  SRW2_BUTTON
BEGIN
  UB4       ITEMID
  TEXT      NAME
  UB4       TAG
  UB2       DISP_ORDER
  UB4       FORMATFLAG
  TEXT      PRE_CODE
  TEXT      POST_CODE
  SB4       X
  SB4       Y
  SB4       WD
  SB4       HT
  UB4       PAGE
  UB1       TYPE
  UB4       SOURCE
  TEXT      SRCFILE
  UB1       ICONIC
  TEXT      LOOKSTR
  UB4       BIDI_DIR
  UB1       PERS_FLAGS
END

DESCRIBE  SRW2_HYPERLINK
BEGIN
  UB2       HYPL_FLAGS
  UB4       OBJECT_ID
  TEXT      TAG_NAME
  TEXT      LINK_TODOC
  TEXT      LINKACTION
  TEXT      OUT_TITLE
  TEXT      IMAGE_NAME
  TEXT      ADDNL_ATTR
  TEXT      HTML_ATTR
  TEXT      TABLE_ATTR
  TEXT      ID
  TEXT      CSS_CLASS
  TEXT      CSS_ID
END

DESCRIBE  SRW2_GROUP_NODE
BEGIN
  UB4       ITEMID
  UB4       NULL_IND1
  UB4       NULL_IND2
  UB4       DELTA_NULL
  UB4       DELTA_HFR
  UB4       DELTA_VFR
  UB4       DELTA_HMD
  UB4       DELTA_VMD
  UB4       DELTA_HSB
  UB4       DELTA_VSB
  UB4       DELTA_HFL
  UB4       DELTA_VFL
  UB4       DELTA_HIF
  UB4       DELTA_VIF
  UB4       DELTA_HPF
  UB4       DELTA_HPG
  UB4       DELTA_VPG
  UB4       DELTA_HCH
  UB4       DELTA_VCH
  UB1       JUSTIFY
  UB1       GROUPSTYLE
  UB1       PLACEBELOW
  UB2       FLDSPERLINE
  UB1       VERTSPACE
  UB2       LISTID
  UB2       LISTPOS
  UB1       PLACEABOVE
  UB1       ALIGNSUMS
END

DESCRIBE  SRW2_JAVA_APPLET
BEGIN
  UB4       ITEMID
  TEXT      NAME
  UB4       TAG
  UB2       DISP_ORDER
  UB4       FORMATFLAG
  TEXT      PRE_CODE
  TEXT      POST_CODE
  SB4       X
  SB4       Y
  SB4       WD
  SB4       HT
  UB4       PAGE
  UB4       GROUP_ID
  UB1       PERS_FLAGS
  TEXT      DATA_FILE_LOC
  TEXT      DATA_FILE_SRC
  UB4       PLACE_ID
  UB4       GRP_TOP_ID
  UB4       GRP_BOT_ID
END

DESCRIBE  SRW2_JAVA_PROPERTIES
BEGIN
  UB1       PERS_FLAGS
  UB4       JAVA_APPLET_ID
  UB4       PROPERTY_FLAG
  TEXT      NAME
  UB4       TAG_ID
  TEXT      VALUE
  TEXT      EXTENSION
  UB4       LOVLISTID
END

DESCRIBE  SRW2_FORMAT_EXCEPTION
BEGIN
  UB4       OBJECT_ID
  UB4       ACTIVATE
  UB4       TAG
  UB4       NULLVALS
  UB1       DISPLAYED
  TEXT      EXP_LABEL
  UB4       SRCCOL1
  UB1       EXCEPTION1
  TEXT      LOVAL1
  TEXT      HIVAL1
  UB1       CONJUNCT1
  UB4       SRCCOL2
  UB1       EXCEPTION2
  TEXT      LOVAL2
  TEXT      HIVAL2
  UB1       CONJUNCT2
  UB4       SRCCOL3
  UB1       EXCEPTION3
  TEXT      LOVAL3
  TEXT      HIVAL3
  UB1       CONJUNCT3
END

DESCRIBE  SRW2_DISTRIBUTION
BEGIN
  UB4       ITEMID
  TEXT      DISTID
  UB1       LYTYPE
  UB2       COPIES
  UB1       SPOOL
  TEXT      DESNAME
  UB4       DESTYPE
  UB4       DESFORMAT
END

DESCRIBE  SRW2_FORMFIELD
BEGIN
  UB4       ITEMID
  TEXT      NAME
  UB4       TAG
  UB2       DISP_ORDER
  UB4       FORMATFLAG
  TEXT      PRE_CODE
  TEXT      POST_CODE
  SB4       X
  SB4       Y
  SB4       WD
  SB4       HT
  UB4       PAGE
  UB1       TYPE
  UB4       TABORDER
  TEXT      DESCRIPTION
  UB1       READONLY
  UB1       VISIBILITY
  UB1       REQUIRED
  SB4       ORIENTATION
  UB1       ALIGNMENT
  UB1       MULTILINE
  UB1       SCROLL
  UB4       MAXCHARS
  UB1       SPELLCHECK
  UB1       CHECKSTYLE
  TEXT      EXPORTVALUE
  UB1       ISCHECKED
  UB1       TIMEFORMAT
  TEXT      DATEFORMAT
  TEXT      VALSCRIPT
END

DESCRIBE  SRW2_ACTION
BEGIN
  UB4       FORMID
  UB1       EVENT
  UB1       TYPE
  TEXT      VALUE
END

DESCRIBE  SRW2_BODY_LOCATION
BEGIN
  SB4       START_X
  SB4       START_Y
  UB2       LOC_ORDER
  UB1       TYPE
END

DESCRIBE  TOOL_ACCESS
BEGIN
  TEXT      GRANTEE
END

DESCRIBE  SRW2_LISTS
BEGIN
  UB4       LISTID
  UB4       POSITION
  UB2       TYPE
  TEXT      CTYPE
END

DESCRIBE  TOOL_LIBRARY
BEGIN
  TEXT      LIBNAME
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 215
   stringid = 0
   lfid = 0
   cs = 560
   len = 6
   str = (BINARY)
<<"
c7e1d5e4 dd000000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 217
   stringid = 0
   lfid = 0
   cs = 560
   len = 5
   str = (BINARY)
<<"
dfe3edc9 00000000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 219
   stringid = 0
   lfid = 0
   cs = 560
   len = 4
   str = (BINARY)
<<"
d3dad100 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 221
   stringid = 0
   lfid = 0
   cs = 560
   len = 7
   str = (BINARY)
<<"
c7cce3c7 e1ec0000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 223
   stringid = 0
   lfid = 0
   cs = 560
   len = 9
   str = (BINARY)
<<"
c7e1e3cc e3e6da3a 00000000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 257
   stringid = 0
   lfid = 0
   cs = 560
   len = 12
   str = (BINARY)
<<"
ddc7cae6 d1c920d1 dee33a00 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 258
   stringid = 0
   lfid = 0
   cs = 560
   len = 13
   str = (BINARY)
<<"
d1dee320 c7e1e3c7 c6cfc93a 00000000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 261
   stringid = 0
   lfid = 0
   cs = 560
   len = 11
   str = (BINARY)
<<"
dad6e6ed c920d1de e33a0000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 267
   stringid = 0
   lfid = 0
   cs = 560
   len = 15
   str = (BINARY)
<<"
c7e1cecf e3c92031 322e3520 253a0000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 268
   stringid = 0
   lfid = 0
   cs = 560
   len = 7
   str = (BINARY)
<<"
c7e1ced5 e33a0000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 269
   stringid = 0
   lfid = 0
   cs = 560
   len = 10
   str = (BINARY)
<<"
c7e1c7cc e3c7e1ec 3a000000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 296
   stringid = 0
   lfid = 0
   cs = 560
   len = 51
   str = (BINARY)
<<"
2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d 
2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d0000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 300
   stringid = 0
   lfid = 0
   cs = 560
   len = 38
   str = (BINARY)
<<"
2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d 
2d2d2d2d 2d000000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 312
   stringid = 0
   lfid = 0
   cs = 560
   len = 10
   str = (BINARY)
<<"
cdccd1c9 20d1dee3 3a000000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 425
   stringid = 0
   lfid = 0
   cs = 560
   len = 22
   str = (BINARY)
<<"
57656c63 6f6d6520 546f2045 6c5f4d61 68726f73 61000000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 426
   stringid = 0
   lfid = 0
   cs = 560
   len = 28
   str = (BINARY)
<<"
cfc7d120 c7e1dee6 c7ca20c7 e1c8cdd1 edc920c7 e1e3cdd1 e6d3c900 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 571
   stringid = 0
   lfid = 0
   cs = 560
   len = 7
   str = (BINARY)
<<"
dfc7d4ed d13a0000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 574
   stringid = 0
   lfid = 0
   cs = 560
   len = 34
   str = (BINARY)
<<"
2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d 2d000000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 579
   stringid = 0
   lfid = 0
   cs = 560
   len = 7
   str = (BINARY)
<<"
2d2d2d2d 2d2d0000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 584
   stringid = 0
   lfid = 0
   cs = 560
   len = 38
   str = (BINARY)
<<"
2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d 
2d2d2d2d 2d000000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 586
   stringid = 0
   lfid = 0
   cs = 560
   len = 38
   str = (BINARY)
<<"
2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d 2d2d2d2d 
2d2d2d2d 2d000000 
">>
END

DEFINE  TOOL_MODULE
BEGIN
   PRODUCT = 16
     <<"SQL*ReportWriter">>
   MODTYPE = 6
     <<"REPORT">>
   OWNER = (VARCHAR) NULLP
   MODNAME = 7
     <<"invoice">>
   MODID = 0
   TCS_VER = 16777216
   NEXT_ITEMID = 619
   CREATOR = 7
     <<"MAHROSA">>
   CREATE_DATE = <<"120104.10.10 09:04:26">>
   CREATE_VER = -1744300544
   MODIFIER = 7
     <<"MAHROSA">>
   MOD_DATE = <<"120126.11.09 01:26:29">>
   MOD_VER = -1337912576
   COPYRIGHT = (VARCHAR) NULLP
   REQ_ROLE = (VARCHAR) NULLP
   VGS_VER = 203428608
   DE_VER = 203428608
   ROS_VER = 203428608
   REPLANG = NULLP
   TITLE = NULLP
   AUTHOR = NULLP
   SUBJECT = NULLP
   KEYWORD = NULLP
   FORMAT_ORDER = 0
   STYLE_SHEETS = NULLP
   CSS_CLASS  = NULLP
   RWTB  = NULLP
END

DEFINE  SRW2_LAYOUT
BEGIN
   ITEMID = 100
   SETTINGS = 260753
   ZOOMPOWER = 1
   UNITS = 2
   ORIENT = 5
   UNITS_WID = 63000
   UNITS_HGT = 254000
   CHAR_WID = 80
   CHAR_HGT = 66
   BODY_WID = 20166
   BODY_HGT = 81845
   PAGE_WID = 20318
   PAGE_HGT = 81920
   PRINT_WID = 20318
   PRINT_HGT = 81920
   X_PANELS = 1
   Y_PANELS = 1
   HEADERS = 0
   TRAILERS = 0
   WINDOW_X = 0
   WINDOW_Y = 0
   WINDOW_WD = 0
   WINDOW_HT = 0
   RUN_FLAGS = 0
   TITLE = NULLP
   HINT = NULLP
   STATUS = NULLP
   MAXHEADERS = 10
   MAXTRAILERS = 10
   MAXBODY_ACR = 10
   MAXBODY_DWN = 10
   INTERN_VER = 192
   INTERN_VER2 = 560
   APPLSTATE = 0
   UIFLAGS = 1022
   GRIDINTC = 1
   GRIDSNPC = 16
   HALIGN = 0
   VALIGN = 0
   RRECTCNR_WD = 1130
   RRECTCNR_HT = 1130
   SPACING = 0
   JUSTIFIC = 64
   ARROWSTYLE = 0
   UITAG = 618
   NEXTLISTID = 2
   IDROLESLIST = 1
   BIDI_DIR = 2
   PERS_FLAGS = 0
   HDR_UNITS_WID = 215900
   HDR_UNITS_HGT = 279400
   HDR_CHAR_WID = 80
   HDR_CHAR_HGT = 66
   HDR_BODY_WID = 65661
   HDR_BODY_HGT = 79865
   HDR_PAGE_WID = 69632
   HDR_PAGE_HGT = 90112
   HDR_PRINT_WID = 69632
   HDR_PRINT_HGT = 90112
   HDR_X_PANELS = 1
   HDR_Y_PANELS = 1
   TRL_UNITS_WID = 215900
   TRL_UNITS_HGT = 279400
   TRL_CHAR_WID = 80
   TRL_CHAR_HGT = 66
   TRL_BODY_WID = 61440
   TRL_BODY_HGT = 73728
   TRL_PAGE_WID = 69632
   TRL_PAGE_HGT = 90112
   TRL_PRINT_WID = 69632
   TRL_PRINT_HGT = 90112
   TRL_X_PANELS = 1
   TRL_Y_PANELS = 1
   HDR_MAXBODY_ACR = 10
   HDR_MAXBODY_DWN = 10
   TRL_MAXBODY_ACR = 10
   DIST_OVERLAP = 15
   TRL_MAXBODY_DWN = 10
   HDR_RPTON = 17
   MAI_RPTON = 17
   TRL_RPTON = 17
END

DEFINE  SRW2_BODY_LOCATION
BEGIN
   START_X = 0
   START_Y = 0
   LOC_ORDER = 0
   TYPE = 1
END

DEFINE  SRW2_BODY_LOCATION
BEGIN
   START_X = 0
   START_Y = 4595
   LOC_ORDER = 0
   TYPE = 2
END

DEFINE  SRW2_BODY_LOCATION
BEGIN
   START_X = 4096
   START_Y = 8192
   LOC_ORDER = 0
   TYPE = 3
END

DEFINE  SRW2_DATA_MODEL
BEGIN
   ITEMID = 101
   SETTINGS = 0
   ZOOMPOWER = 0
   WINDOW_X = 219
   WINDOW_Y = 35
   WINDOW_WD = 774
   WINDOW_HT = 528
   DFLT_TYPE = 3
   UIFLAGS = 8192
   GRIDINTC = 1
   GRIDSNPC = 4
   HALIGN = 0
   VALIGN = 0
   DECURREF_ID = 5
   GRPMAXROW = 0
   MOD_DATE = <<"120104.10.10 09:04:26">>
   PERS_FLAGS = 0
   MUST_SPLIT = 124
   MAY_SPLIT = 32
   MIN_TRUNC = 50
   MIN_PNT_SZ = 2
   TMPL_NAME = NULLP
   TMPL_CUST = 0
   MAIL_TEXT = NULLP
   TEXT_FILE = NULLP
   IMAGE_FILE = NULLP
   VERS_FLAGS = NULLP
   TEXTESC_BR = <<"<html>
<body dir=&Direction bgcolor="#ffffff">
">>
   TEXTESC_AR = <<"</body></html>
">>
   TEXTESC_BP = <<"<html>
<body dir=&Direction bgcolor="#ffffff">
<form method=post action="_action_">
<input name="hidden_run_parameters" type=hidden value="_hidden_">
<font color=red><!--error--></font>
<center>
<p><table border=0 cellspacing=0 cellpadding=0>
<tr>
<td><input type=submit></td>
<td width=15>
<td><input type=reset></td>
</tr>
</table>
<p><hr><p>
">>
   TEXTESC_AP = <<"</center>
</body>
</form>
</html>
">>
   TEXTESC_BF = NULLP
   TEXTESC_AF = <<"<hr size=5 noshade>
">>
   FILEESC_BR = NULLP
   FILEESC_AR = NULLP
   FILEESC_BP = NULLP
   FILEESC_AP = NULLP
   FILEESC_BF = NULLP
   FILEESC_AF = NULLP
   ESCTYPES = 0
   SECTION_TITLE = NULLP
   FILEESC_MJ = NULLP
   TEXTESC_MJ_ID = (TLONG)
<<"<HTML>
<TITLE>Oracle HTML Navigator</TITLE>
<HEAD>
<SCRIPT LANGUAGE = "JavaScript">

var jump_index = 1			// Jump to this page
var num_pages = &TotalPages			// Total number of pages
var basefilename = "&file_name"		// Base file name
var fileext = "&file_ext"		//File extension

/* jumps to "new_page" */
function new_page(form, new_page)
{
	form.reqpage.value = new_page;
	parent.frames[0].location = basefilename + "_" + new_page + "."+fileext;
}

/* go back one page */
function back(form)
{
	/* if we are not in first page */
	if (jump_index > 1)
	{
		jump_index--;
		new_page(form, jump_index);
	}
}

/* go forward one page */
function forward(form)
{
	/* if we are not in last page */
	if (jump_index < num_pages)
	{
		jump_index++;
		new_page(form, jump_index);
	}
}

/* go to first page */
function first(form)
{
	if(jump_index != 1)
	{
		jump_index = 1;
		new_page(form, jump_index);
	}
}

/* go to last page */
function last(form)
{
	if(jump_index != num_pages)
	{
		jump_index = num_pages;
		new_page(form, jump_index);
	}
}

/* go to the user specified page number */
function pagenum(form)
{
	/* sanity check */
	if (form.reqpage.value < 1)
	{
		form.reqpage.value = 1;
	}
	if (form.reqpage.value > num_pages)
	{
		form.reqpage.value = num_pages;
	}
	jump_index = form.reqpage.value;
	new_page(form, jump_index);
}
</SCRIPT>
</HEAD>

<BODY>
<FORM NAME="ThisForm" onSubmit="pagenum(this); return false;">
<center><table><tr>
<td> <INPUT TYPE="button"  VALUE="<< " onClick="first(this.form)">
<td> <INPUT TYPE="button"  VALUE=" < " onClick="back(this.form)">
<td> <INPUT TYPE="button"  VALUE="Page:" onClick="pagenum(this.form)">
<td> <INPUT NAME="reqpage" VALUE="1" SIZE=2>
<td> <INPUT TYPE="button"  VALUE=" > " onClick="forward(this.form)">
<td> <INPUT TYPE="button"  VALUE=" >>" onClick="last(this.form)">
</table></center>
</FORM></BODY>
</HTML>
">>
   XML_TAG = <<"INVOICE">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   PROLOG_TYPE = 0
   TEXT_PROLOG = <<"<?xml version="1.0"?>">>
   FILE_PROLOG = NULLP
   XML_INCLUDEDTD = 0
   HTMLBUF = (VARCHAR) NULLP
   HTMLBUFID = (TLONG) NULLP
   SAVHTMLBUF = (VARCHAR) NULLP
END

DEFINE  SRW2_PARAM_FORM
BEGIN
   ITEMID = 102
   SETTINGS = 129680
   ZOOMPOWER = 0
   UNITS = 2
   UNITS_WID = 100000
   UNITS_HGT = 150000
   FORM_WID = 32251
   FORM_HGT = 48377
   CHAR_WID = 80
   CHAR_HGT = 24
   WINDOW_X = 0
   WINDOW_Y = 0
   WINDOW_WD = 0
   WINDOW_HT = 0
   UIFLAGS = 1006
   GRIDINTC = 1
   GRIDSNPC = 16
   HALIGN = 0
   VALIGN = 0
   RRECTCNR_WD = 1130
   RRECTCNR_HT = 1130
   SPACING = -1
   JUSTIFIC = 0
   ARROWSTYLE = 0
   UITAG = 444
   PAGE_TOT = 1
   DFLT_TITLE = NULLP
   DFLT_HINT = NULLP
   DFLT_STATUS = NULLP
   PERS_FLAGS = 0
END

DESCRIBE  VG_COLOR
BEGIN
  SB4       ITEMID
  SB4       CELLID
  UB2       NAME_SET
  UB2       NAME_LENGTH
  BINARY    NAME_LENGTH:COLOR_NAME
  UB2       RED
  UB2       GREEN
  UB2       BLUE
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 0
   NAME_SET = 0
   NAME_LENGTH = 5
   COLOR_NAME = (BINARY)
<<"
626c6163 6b000000 
">>
   RED = 0
   GREEN = 0
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 1
   NAME_SET = 0
   NAME_LENGTH = 5
   COLOR_NAME = (BINARY)
<<"
77686974 65000000 
">>
   RED = 65535
   GREEN = 65535
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 2
   NAME_SET = 0
   NAME_LENGTH = 5
   COLOR_NAME = (BINARY)
<<"
67726565 6e000000 
">>
   RED = 0
   GREEN = 65535
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 3
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
6461726b 67726565 6e000000 
">>
   RED = 0
   GREEN = 32768
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 4
   NAME_SET = 0
   NAME_LENGTH = 6
   COLOR_NAME = (BINARY)
<<"
67726179 39360000 
">>
   RED = 2621
   GREEN = 2621
   BLUE = 2621
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 5
   NAME_SET = 0
   NAME_LENGTH = 6
   COLOR_NAME = (BINARY)
<<"
67726179 39320000 
">>
   RED = 5242
   GREEN = 5242
   BLUE = 5242
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 6
   NAME_SET = 0
   NAME_LENGTH = 6
   COLOR_NAME = (BINARY)
<<"
67726179 38380000 
">>
   RED = 7864
   GREEN = 7864
   BLUE = 7864
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 7
   NAME_SET = 0
   NAME_LENGTH = 6
   COLOR_NAME = (BINARY)
<<"
67726179 38340000 
">>
   RED = 10485
   GREEN = 10485
   BLUE = 10485
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 8
   NAME_SET = 0
   NAME_LENGTH = 6
   COLOR_NAME = (BINARY)
<<"
72306730 62300000 
">>
   RED = 0
   GREEN = 0
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 9
   NAME_SET = 0
   NAME_LENGTH = 7
   COLOR_NAME = (BINARY)
<<"
72323567 30623000 
">>
   RED = 16384
   GREEN = 0
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 10
   NAME_SET = 0
   NAME_LENGTH = 7
   COLOR_NAME = (BINARY)
<<"
72353067 30623000 
">>
   RED = 32768
   GREEN = 0
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 11
   NAME_SET = 0
   NAME_LENGTH = 7
   COLOR_NAME = (BINARY)
<<"
72373567 30623000 
">>
   RED = 49152
   GREEN = 0
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 12
   NAME_SET = 0
   NAME_LENGTH = 7
   COLOR_NAME = (BINARY)
<<"
72383867 30623000 
">>
   RED = 57344
   GREEN = 0
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 13
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72313030 67306230 
">>
   RED = 65535
   GREEN = 0
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 14
   NAME_SET = 0
   NAME_LENGTH = 7
   COLOR_NAME = (BINARY)
<<"
72306730 62353000 
">>
   RED = 0
   GREEN = 0
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 15
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72323567 30623530 
">>
   RED = 16384
   GREEN = 0
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 16
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72353067 30623530 
">>
   RED = 32768
   GREEN = 0
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 17
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72373567 30623530 
">>
   RED = 49152
   GREEN = 0
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 18
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72383867 30623530 
">>
   RED = 57344
   GREEN = 0
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 19
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72313030 67306235 30000000 
">>
   RED = 65535
   GREEN = 0
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 20
   NAME_SET = 0
   NAME_LENGTH = 7
   COLOR_NAME = (BINARY)
<<"
72306730 62373500 
">>
   RED = 0
   GREEN = 0
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 21
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72323567 30623735 
">>
   RED = 16384
   GREEN = 0
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 22
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72353067 30623735 
">>
   RED = 32768
   GREEN = 0
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 23
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72373567 30623735 
">>
   RED = 49152
   GREEN = 0
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 24
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72383867 30623735 
">>
   RED = 57344
   GREEN = 0
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 25
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72313030 67306237 35000000 
">>
   RED = 65535
   GREEN = 0
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 26
   NAME_SET = 0
   NAME_LENGTH = 7
   COLOR_NAME = (BINARY)
<<"
72306730 62383800 
">>
   RED = 0
   GREEN = 0
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 27
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72323567 30623838 
">>
   RED = 16384
   GREEN = 0
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 28
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72353067 30623838 
">>
   RED = 32768
   GREEN = 0
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 29
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72373567 30623838 
">>
   RED = 49152
   GREEN = 0
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 30
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72383867 30623838 
">>
   RED = 57344
   GREEN = 0
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 31
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72313030 67306238 38000000 
">>
   RED = 65535
   GREEN = 0
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 32
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72306730 62313030 
">>
   RED = 0
   GREEN = 0
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 33
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72323567 30623130 30000000 
">>
   RED = 16384
   GREEN = 0
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 34
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72353067 30623130 30000000 
">>
   RED = 32768
   GREEN = 0
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 35
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72373567 30623130 30000000 
">>
   RED = 49152
   GREEN = 0
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 36
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72383867 30623130 30000000 
">>
   RED = 57344
   GREEN = 0
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 37
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72313030 67306231 30300000 
">>
   RED = 65535
   GREEN = 0
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 38
   NAME_SET = 0
   NAME_LENGTH = 4
   COLOR_NAME = (BINARY)
<<"
67726179 
">>
   RED = 49152
   GREEN = 49152
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 39
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
6461726b 67726179 
">>
   RED = 32768
   GREEN = 32768
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 40
   NAME_SET = 0
   NAME_LENGTH = 4
   COLOR_NAME = (BINARY)
<<"
6379616e 
">>
   RED = 0
   GREEN = 65535
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 41
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
6461726b 6379616e 
">>
   RED = 0
   GREEN = 32768
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 42
   NAME_SET = 0
   NAME_LENGTH = 6
   COLOR_NAME = (BINARY)
<<"
67726179 38300000 
">>
   RED = 13107
   GREEN = 13107
   BLUE = 13107
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 43
   NAME_SET = 0
   NAME_LENGTH = 6
   COLOR_NAME = (BINARY)
<<"
67726179 37360000 
">>
   RED = 15728
   GREEN = 15728
   BLUE = 15728
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 44
   NAME_SET = 0
   NAME_LENGTH = 6
   COLOR_NAME = (BINARY)
<<"
67726179 37320000 
">>
   RED = 18350
   GREEN = 18350
   BLUE = 18350
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 45
   NAME_SET = 0
   NAME_LENGTH = 6
   COLOR_NAME = (BINARY)
<<"
67726179 36380000 
">>
   RED = 20971
   GREEN = 20971
   BLUE = 20971
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 46
   NAME_SET = 0
   NAME_LENGTH = 7
   COLOR_NAME = (BINARY)
<<"
72306732 35623000 
">>
   RED = 0
   GREEN = 16384
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 47
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72323567 32356230 
">>
   RED = 16384
   GREEN = 16384
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 48
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72353067 32356230 
">>
   RED = 32768
   GREEN = 16384
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 49
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72373567 32356230 
">>
   RED = 49152
   GREEN = 16384
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 50
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72383867 32356230 
">>
   RED = 57344
   GREEN = 16384
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 51
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72313030 67323562 30000000 
">>
   RED = 65535
   GREEN = 16384
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 52
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72306732 35623530 
">>
   RED = 0
   GREEN = 16384
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 53
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72323567 32356235 30000000 
">>
   RED = 16384
   GREEN = 16384
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 54
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72353067 32356235 30000000 
">>
   RED = 32768
   GREEN = 16384
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 55
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72373567 32356235 30000000 
">>
   RED = 49152
   GREEN = 16384
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 56
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72383867 32356235 30000000 
">>
   RED = 57344
   GREEN = 16384
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 57
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72313030 67323562 35300000 
">>
   RED = 65535
   GREEN = 16384
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 58
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72306732 35623735 
">>
   RED = 0
   GREEN = 16384
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 59
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72323567 32356237 35000000 
">>
   RED = 16384
   GREEN = 16384
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 60
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72353067 32356237 35000000 
">>
   RED = 32768
   GREEN = 16384
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 61
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72373567 32356237 35000000 
">>
   RED = 49152
   GREEN = 16384
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 62
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72383867 32356237 35000000 
">>
   RED = 57344
   GREEN = 16384
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 63
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72313030 67323562 37350000 
">>
   RED = 65535
   GREEN = 16384
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 64
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72306732 35623838 
">>
   RED = 0
   GREEN = 16384
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 65
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72323567 32356238 38000000 
">>
   RED = 16384
   GREEN = 16384
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 66
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72353067 32356238 38000000 
">>
   RED = 32768
   GREEN = 16384
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 67
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72373567 32356238 38000000 
">>
   RED = 49152
   GREEN = 16384
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 68
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72383867 32356238 38000000 
">>
   RED = 57344
   GREEN = 16384
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 69
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72313030 67323562 38380000 
">>
   RED = 65535
   GREEN = 16384
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 70
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72306732 35623130 30000000 
">>
   RED = 0
   GREEN = 16384
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 71
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72323567 32356231 30300000 
">>
   RED = 16384
   GREEN = 16384
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 72
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72353067 32356231 30300000 
">>
   RED = 32768
   GREEN = 16384
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 73
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72373567 32356231 30300000 
">>
   RED = 49152
   GREEN = 16384
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 74
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72383867 32356231 30300000 
">>
   RED = 57344
   GREEN = 16384
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 75
   NAME_SET = 0
   NAME_LENGTH = 11
   COLOR_NAME = (BINARY)
<<"
72313030 67323562 31303000 
">>
   RED = 65535
   GREEN = 16384
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 76
   NAME_SET = 0
   NAME_LENGTH = 3
   COLOR_NAME = (BINARY)
<<"
72656400 
">>
   RED = 65535
   GREEN = 0
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 77
   NAME_SET = 0
   NAME_LENGTH = 7
   COLOR_NAME = (BINARY)
<<"
6461726b 72656400 
">>
   RED = 32768
   GREEN = 0
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 78
   NAME_SET = 0
   NAME_LENGTH = 4
   COLOR_NAME = (BINARY)
<<"
626c7565 
">>
   RED = 0
   GREEN = 0
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 79
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
6461726b 626c7565 
">>
   RED = 0
   GREEN = 0
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 80
   NAME_SET = 0
   NAME_LENGTH = 6
   COLOR_NAME = (BINARY)
<<"
67726179 36340000 
">>
   RED = 23592
   GREEN = 23592
   BLUE = 23592
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 81
   NAME_SET = 0
   NAME_LENGTH = 6
   COLOR_NAME = (BINARY)
<<"
67726179 36300000 
">>
   RED = 26214
   GREEN = 26214
   BLUE = 26214
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 82
   NAME_SET = 0
   NAME_LENGTH = 6
   COLOR_NAME = (BINARY)
<<"
67726179 35360000 
">>
   RED = 28835
   GREEN = 28835
   BLUE = 28835
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 83
   NAME_SET = 0
   NAME_LENGTH = 6
   COLOR_NAME = (BINARY)
<<"
67726179 35320000 
">>
   RED = 31457
   GREEN = 31457
   BLUE = 31457
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 84
   NAME_SET = 0
   NAME_LENGTH = 7
   COLOR_NAME = (BINARY)
<<"
72306735 30623000 
">>
   RED = 0
   GREEN = 32768
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 85
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72323567 35306230 
">>
   RED = 16384
   GREEN = 32768
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 86
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72353067 35306230 
">>
   RED = 32768
   GREEN = 32768
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 87
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72373567 35306230 
">>
   RED = 49152
   GREEN = 32768
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 88
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72383867 35306230 
">>
   RED = 57344
   GREEN = 32768
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 89
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72313030 67353062 30000000 
">>
   RED = 65535
   GREEN = 32768
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 90
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72306735 30623530 
">>
   RED = 0
   GREEN = 32768
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 91
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72323567 35306235 30000000 
">>
   RED = 16384
   GREEN = 32768
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 92
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72353067 35306235 30000000 
">>
   RED = 32768
   GREEN = 32768
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 93
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72373567 35306235 30000000 
">>
   RED = 49152
   GREEN = 32768
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 94
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72383867 35306235 30000000 
">>
   RED = 57344
   GREEN = 32768
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 95
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72313030 67353062 35300000 
">>
   RED = 65535
   GREEN = 32768
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 96
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72306735 30623735 
">>
   RED = 0
   GREEN = 32768
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 97
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72323567 35306237 35000000 
">>
   RED = 16384
   GREEN = 32768
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 98
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72353067 35306237 35000000 
">>
   RED = 32768
   GREEN = 32768
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 99
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72373567 35306237 35000000 
">>
   RED = 49152
   GREEN = 32768
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 100
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72383867 35306237 35000000 
">>
   RED = 57344
   GREEN = 32768
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 101
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72313030 67353062 37350000 
">>
   RED = 65535
   GREEN = 32768
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 102
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72306735 30623838 
">>
   RED = 0
   GREEN = 32768
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 103
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72323567 35306238 38000000 
">>
   RED = 16384
   GREEN = 32768
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 104
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72353067 35306238 38000000 
">>
   RED = 32768
   GREEN = 32768
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 105
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72373567 35306238 38000000 
">>
   RED = 49152
   GREEN = 32768
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 106
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72383867 35306238 38000000 
">>
   RED = 57344
   GREEN = 32768
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 107
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72313030 67353062 38380000 
">>
   RED = 65535
   GREEN = 32768
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 108
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72306735 30623130 30000000 
">>
   RED = 0
   GREEN = 32768
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 109
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72323567 35306231 30300000 
">>
   RED = 16384
   GREEN = 32768
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 110
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72353067 35306231 30300000 
">>
   RED = 32768
   GREEN = 32768
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 111
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72373567 35306231 30300000 
">>
   RED = 49152
   GREEN = 32768
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 112
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72383867 35306231 30300000 
">>
   RED = 57344
   GREEN = 32768
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 113
   NAME_SET = 0
   NAME_LENGTH = 11
   COLOR_NAME = (BINARY)
<<"
72313030 67353062 31303000 
">>
   RED = 65535
   GREEN = 32768
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 114
   NAME_SET = 0
   NAME_LENGTH = 6
   COLOR_NAME = (BINARY)
<<"
79656c6c 6f770000 
">>
   RED = 65535
   GREEN = 65535
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 115
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
6461726b 79656c6c 6f770000 
">>
   RED = 32768
   GREEN = 32768
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 116
   NAME_SET = 0
   NAME_LENGTH = 7
   COLOR_NAME = (BINARY)
<<"
6d616765 6e746100 
">>
   RED = 65535
   GREEN = 0
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 117
   NAME_SET = 0
   NAME_LENGTH = 11
   COLOR_NAME = (BINARY)
<<"
6461726b 6d616765 6e746100 
">>
   RED = 32768
   GREEN = 0
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 118
   NAME_SET = 0
   NAME_LENGTH = 6
   COLOR_NAME = (BINARY)
<<"
67726179 34380000 
">>
   RED = 34078
   GREEN = 34078
   BLUE = 34078
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 119
   NAME_SET = 0
   NAME_LENGTH = 6
   COLOR_NAME = (BINARY)
<<"
67726179 34340000 
">>
   RED = 36700
   GREEN = 36700
   BLUE = 36700
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 120
   NAME_SET = 0
   NAME_LENGTH = 6
   COLOR_NAME = (BINARY)
<<"
67726179 34300000 
">>
   RED = 39321
   GREEN = 39321
   BLUE = 39321
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 121
   NAME_SET = 0
   NAME_LENGTH = 6
   COLOR_NAME = (BINARY)
<<"
67726179 33360000 
">>
   RED = 41943
   GREEN = 41943
   BLUE = 41943
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 122
   NAME_SET = 0
   NAME_LENGTH = 7
   COLOR_NAME = (BINARY)
<<"
72306737 35623000 
">>
   RED = 0
   GREEN = 49152
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 123
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72323567 37356230 
">>
   RED = 16384
   GREEN = 49152
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 124
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72353067 37356230 
">>
   RED = 32768
   GREEN = 49152
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 125
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72373567 37356230 
">>
   RED = 49152
   GREEN = 49152
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 126
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72383867 37356230 
">>
   RED = 57344
   GREEN = 49152
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 127
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72313030 67373562 30000000 
">>
   RED = 65535
   GREEN = 49152
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 128
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72306737 35623530 
">>
   RED = 0
   GREEN = 49152
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 129
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72323567 37356235 30000000 
">>
   RED = 16384
   GREEN = 49152
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 130
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72353067 37356235 30000000 
">>
   RED = 32768
   GREEN = 49152
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 131
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72373567 37356235 30000000 
">>
   RED = 49152
   GREEN = 49152
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 132
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72383867 37356235 30000000 
">>
   RED = 57344
   GREEN = 49152
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 133
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72313030 67373562 35300000 
">>
   RED = 65535
   GREEN = 49152
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 134
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72306737 35623735 
">>
   RED = 0
   GREEN = 49152
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 135
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72323567 37356237 35000000 
">>
   RED = 16384
   GREEN = 49152
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 136
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72353067 37356237 35000000 
">>
   RED = 32768
   GREEN = 49152
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 137
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72373567 37356237 35000000 
">>
   RED = 49152
   GREEN = 49152
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 138
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72383867 37356237 35000000 
">>
   RED = 57344
   GREEN = 49152
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 139
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72313030 67373562 37350000 
">>
   RED = 65535
   GREEN = 49152
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 140
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72306737 35623838 
">>
   RED = 0
   GREEN = 49152
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 141
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72323567 37356238 38000000 
">>
   RED = 16384
   GREEN = 49152
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 142
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72353067 37356238 38000000 
">>
   RED = 32768
   GREEN = 49152
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 143
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72373567 37356238 38000000 
">>
   RED = 49152
   GREEN = 49152
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 144
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72383867 37356238 38000000 
">>
   RED = 57344
   GREEN = 49152
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 145
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72313030 67373562 38380000 
">>
   RED = 65535
   GREEN = 49152
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 146
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72306737 35623130 30000000 
">>
   RED = 0
   GREEN = 49152
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 147
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72323567 37356231 30300000 
">>
   RED = 16384
   GREEN = 49152
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 148
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72353067 37356231 30300000 
">>
   RED = 32768
   GREEN = 49152
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 149
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72373567 37356231 30300000 
">>
   RED = 49152
   GREEN = 49152
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 150
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72383867 37356231 30300000 
">>
   RED = 57344
   GREEN = 49152
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 151
   NAME_SET = 0
   NAME_LENGTH = 11
   COLOR_NAME = (BINARY)
<<"
72313030 67373562 31303000 
">>
   RED = 65535
   GREEN = 49152
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 152
   NAME_SET = 0
   NAME_LENGTH = 7
   COLOR_NAME = (BINARY)
<<"
63757374 6f6d3100 
">>
   RED = 65535
   GREEN = 65535
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 153
   NAME_SET = 0
   NAME_LENGTH = 7
   COLOR_NAME = (BINARY)
<<"
63757374 6f6d3200 
">>
   RED = 65535
   GREEN = 65535
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 154
   NAME_SET = 0
   NAME_LENGTH = 7
   COLOR_NAME = (BINARY)
<<"
63757374 6f6d3300 
">>
   RED = 65535
   GREEN = 65535
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 155
   NAME_SET = 0
   NAME_LENGTH = 7
   COLOR_NAME = (BINARY)
<<"
63757374 6f6d3400 
">>
   RED = 65535
   GREEN = 65535
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 156
   NAME_SET = 0
   NAME_LENGTH = 6
   COLOR_NAME = (BINARY)
<<"
67726179 33320000 
">>
   RED = 44564
   GREEN = 44564
   BLUE = 44564
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 157
   NAME_SET = 0
   NAME_LENGTH = 6
   COLOR_NAME = (BINARY)
<<"
67726179 32380000 
">>
   RED = 47185
   GREEN = 47185
   BLUE = 47185
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 158
   NAME_SET = 0
   NAME_LENGTH = 6
   COLOR_NAME = (BINARY)
<<"
67726179 32340000 
">>
   RED = 49807
   GREEN = 49807
   BLUE = 49807
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 159
   NAME_SET = 0
   NAME_LENGTH = 6
   COLOR_NAME = (BINARY)
<<"
67726179 32300000 
">>
   RED = 52428
   GREEN = 52428
   BLUE = 52428
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 160
   NAME_SET = 0
   NAME_LENGTH = 7
   COLOR_NAME = (BINARY)
<<"
72306738 38623000 
">>
   RED = 0
   GREEN = 57344
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 161
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72323567 38386230 
">>
   RED = 16384
   GREEN = 57344
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 162
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72353067 38386230 
">>
   RED = 32768
   GREEN = 57344
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 163
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72373567 38386230 
">>
   RED = 49152
   GREEN = 57344
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 164
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72383867 38386230 
">>
   RED = 57344
   GREEN = 57344
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 165
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72313030 67383862 30000000 
">>
   RED = 65535
   GREEN = 57344
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 166
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72306738 38623530 
">>
   RED = 0
   GREEN = 57344
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 167
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72323567 38386235 30000000 
">>
   RED = 16384
   GREEN = 57344
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 168
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72353067 38386235 30000000 
">>
   RED = 32768
   GREEN = 57344
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 169
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72373567 38386235 30000000 
">>
   RED = 49152
   GREEN = 57344
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 170
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72383867 38386235 30000000 
">>
   RED = 57344
   GREEN = 57344
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 171
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72313030 67383862 35300000 
">>
   RED = 65535
   GREEN = 57344
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 172
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72306738 38623735 
">>
   RED = 0
   GREEN = 57344
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 173
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72323567 38386237 35000000 
">>
   RED = 16384
   GREEN = 57344
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 174
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72353067 38386237 35000000 
">>
   RED = 32768
   GREEN = 57344
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 175
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72373567 38386237 35000000 
">>
   RED = 49152
   GREEN = 57344
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 176
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72383867 38386237 35000000 
">>
   RED = 57344
   GREEN = 57344
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 177
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72313030 67383862 37350000 
">>
   RED = 65535
   GREEN = 57344
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 178
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72306738 38623838 
">>
   RED = 0
   GREEN = 57344
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 179
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72323567 38386238 38000000 
">>
   RED = 16384
   GREEN = 57344
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 180
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72353067 38386238 38000000 
">>
   RED = 32768
   GREEN = 57344
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 181
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72373567 38386238 38000000 
">>
   RED = 49152
   GREEN = 57344
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 182
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72383867 38386238 38000000 
">>
   RED = 57344
   GREEN = 57344
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 183
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72313030 67383862 38380000 
">>
   RED = 65535
   GREEN = 57344
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 184
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72306738 38623130 30000000 
">>
   RED = 0
   GREEN = 57344
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 185
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72323567 38386231 30300000 
">>
   RED = 16384
   GREEN = 57344
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 186
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72353067 38386231 30300000 
">>
   RED = 32768
   GREEN = 57344
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 187
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72373567 38386231 30300000 
">>
   RED = 49152
   GREEN = 57344
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 188
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72383867 38386231 30300000 
">>
   RED = 57344
   GREEN = 57344
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 189
   NAME_SET = 0
   NAME_LENGTH = 11
   COLOR_NAME = (BINARY)
<<"
72313030 67383862 31303000 
">>
   RED = 65535
   GREEN = 57344
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 190
   NAME_SET = 0
   NAME_LENGTH = 7
   COLOR_NAME = (BINARY)
<<"
63757374 6f6d3500 
">>
   RED = 65535
   GREEN = 65535
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 191
   NAME_SET = 0
   NAME_LENGTH = 7
   COLOR_NAME = (BINARY)
<<"
63757374 6f6d3600 
">>
   RED = 65535
   GREEN = 65535
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 192
   NAME_SET = 0
   NAME_LENGTH = 7
   COLOR_NAME = (BINARY)
<<"
63757374 6f6d3700 
">>
   RED = 65535
   GREEN = 65535
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 193
   NAME_SET = 0
   NAME_LENGTH = 7
   COLOR_NAME = (BINARY)
<<"
63757374 6f6d3800 
">>
   RED = 65535
   GREEN = 65535
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 194
   NAME_SET = 0
   NAME_LENGTH = 6
   COLOR_NAME = (BINARY)
<<"
67726179 31360000 
">>
   RED = 55050
   GREEN = 55050
   BLUE = 55050
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 195
   NAME_SET = 0
   NAME_LENGTH = 6
   COLOR_NAME = (BINARY)
<<"
67726179 31320000 
">>
   RED = 57671
   GREEN = 57671
   BLUE = 57671
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 196
   NAME_SET = 0
   NAME_LENGTH = 5
   COLOR_NAME = (BINARY)
<<"
67726179 38000000 
">>
   RED = 60293
   GREEN = 60293
   BLUE = 60293
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 197
   NAME_SET = 0
   NAME_LENGTH = 5
   COLOR_NAME = (BINARY)
<<"
67726179 34000000 
">>
   RED = 62914
   GREEN = 62914
   BLUE = 62914
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 198
   NAME_SET = 0
   NAME_LENGTH = 8
   COLOR_NAME = (BINARY)
<<"
72306731 30306230 
">>
   RED = 0
   GREEN = 65535
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 199
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72323567 31303062 30000000 
">>
   RED = 16384
   GREEN = 65535
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 200
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72353067 31303062 30000000 
">>
   RED = 32768
   GREEN = 65535
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 201
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72373567 31303062 30000000 
">>
   RED = 49152
   GREEN = 65535
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 202
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72383867 31303062 30000000 
">>
   RED = 57344
   GREEN = 65535
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 203
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72313030 67313030 62300000 
">>
   RED = 65535
   GREEN = 65535
   BLUE = 0
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 204
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72306731 30306235 30000000 
">>
   RED = 0
   GREEN = 65535
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 205
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72323567 31303062 35300000 
">>
   RED = 16384
   GREEN = 65535
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 206
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72353067 31303062 35300000 
">>
   RED = 32768
   GREEN = 65535
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 207
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72373567 31303062 35300000 
">>
   RED = 49152
   GREEN = 65535
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 208
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72383867 31303062 35300000 
">>
   RED = 57344
   GREEN = 65535
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 209
   NAME_SET = 0
   NAME_LENGTH = 11
   COLOR_NAME = (BINARY)
<<"
72313030 67313030 62353000 
">>
   RED = 65535
   GREEN = 65535
   BLUE = 32768
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 210
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72306731 30306237 35000000 
">>
   RED = 0
   GREEN = 65535
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 211
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72323567 31303062 37350000 
">>
   RED = 16384
   GREEN = 65535
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 212
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72353067 31303062 37350000 
">>
   RED = 32768
   GREEN = 65535
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 213
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72373567 31303062 37350000 
">>
   RED = 49152
   GREEN = 65535
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 214
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72383867 31303062 37350000 
">>
   RED = 57344
   GREEN = 65535
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 215
   NAME_SET = 0
   NAME_LENGTH = 11
   COLOR_NAME = (BINARY)
<<"
72313030 67313030 62373500 
">>
   RED = 65535
   GREEN = 65535
   BLUE = 49152
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 216
   NAME_SET = 0
   NAME_LENGTH = 9
   COLOR_NAME = (BINARY)
<<"
72306731 30306238 38000000 
">>
   RED = 0
   GREEN = 65535
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 217
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72323567 31303062 38380000 
">>
   RED = 16384
   GREEN = 65535
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 218
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72353067 31303062 38380000 
">>
   RED = 32768
   GREEN = 65535
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 219
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72373567 31303062 38380000 
">>
   RED = 49152
   GREEN = 65535
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 220
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72383867 31303062 38380000 
">>
   RED = 57344
   GREEN = 65535
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 221
   NAME_SET = 0
   NAME_LENGTH = 11
   COLOR_NAME = (BINARY)
<<"
72313030 67313030 62383800 
">>
   RED = 65535
   GREEN = 65535
   BLUE = 57344
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 222
   NAME_SET = 0
   NAME_LENGTH = 10
   COLOR_NAME = (BINARY)
<<"
72306731 30306231 30300000 
">>
   RED = 0
   GREEN = 65535
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 223
   NAME_SET = 0
   NAME_LENGTH = 11
   COLOR_NAME = (BINARY)
<<"
72323567 31303062 31303000 
">>
   RED = 16384
   GREEN = 65535
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 224
   NAME_SET = 0
   NAME_LENGTH = 11
   COLOR_NAME = (BINARY)
<<"
72353067 31303062 31303000 
">>
   RED = 32768
   GREEN = 65535
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 225
   NAME_SET = 0
   NAME_LENGTH = 11
   COLOR_NAME = (BINARY)
<<"
72373567 31303062 31303000 
">>
   RED = 49152
   GREEN = 65535
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 226
   NAME_SET = 0
   NAME_LENGTH = 11
   COLOR_NAME = (BINARY)
<<"
72383867 31303062 31303000 
">>
   RED = 57344
   GREEN = 65535
   BLUE = 65535
END

DEFINE  VG_COLOR
BEGIN
   ITEMID = 0
   CELLID = 227
   NAME_SET = 0
   NAME_LENGTH = 12
   COLOR_NAME = (BINARY)
<<"
72313030 67313030 62313030 
">>
   RED = 65535
   GREEN = 65535
   BLUE = 65535
END

DEFINE  SRW2_DISPLAY_TAG
BEGIN
   ITEMID = 186
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = NULLP
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 0
   TEXTBACK = 0
   LINEPAT = 255
   LINEFORE = 0
   LINEBACK = 1
   FILLPAT = 255
   FILLFORE = 0
   FILLBACK = 1
   FONTFACE = 0
   FONTSIZE = 0
   FONTSTYLE = 0
   FONTWEIGHT = 0
   CHARSET = 0
   CHARWIDTH = 0
   BASELINE = 0
   KERNING = 0
   DASHSTYLE = 0
   CAPSTYLE = 0
   JOINSTYLE = 0
   BORDSTYLE = 0
   PERS_FLAGS = 0
   NULL_FLAGS = 0
END

DEFINE  SRW2_DISPLAY_TAG
BEGIN
   ITEMID = 226
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = NULLP
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 0
   TEXTBACK = 0
   LINEPAT = 255
   LINEFORE = 0
   LINEBACK = 1
   FILLPAT = 255
   FILLFORE = 0
   FILLBACK = 1
   FONTFACE = 0
   FONTSIZE = 0
   FONTSTYLE = 0
   FONTWEIGHT = 0
   CHARSET = 0
   CHARWIDTH = 0
   BASELINE = 0
   KERNING = 0
   DASHSTYLE = 0
   CAPSTYLE = 0
   JOINSTYLE = 32
   BORDSTYLE = 0
   PERS_FLAGS = 0
   NULL_FLAGS = 0
END

DEFINE  SRW2_DISPLAY_TAG
BEGIN
   ITEMID = 362
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = <<"Courier New">>
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 0
   TEXTBACK = 0
   LINEPAT = 0
   LINEFORE = 0
   LINEBACK = 0
   FILLPAT = 0
   FILLFORE = 0
   FILLBACK = 0
   FONTFACE = 0
   FONTSIZE = 700
   FONTSTYLE = 0
   FONTWEIGHT = 7
   CHARSET = 560
   CHARWIDTH = 5
   BASELINE = 0
   KERNING = 0
   DASHSTYLE = 0
   CAPSTYLE = 0
   JOINSTYLE = 0
   BORDSTYLE = 0
   PERS_FLAGS = 0
   NULL_FLAGS = 0
END

DEFINE  SRW2_DISPLAY_TAG
BEGIN
   ITEMID = 391
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = <<"Simplified Arabic">>
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 0
   TEXTBACK = 0
   LINEPAT = 255
   LINEFORE = 0
   LINEBACK = 1
   FILLPAT = 255
   FILLFORE = 0
   FILLBACK = 1
   FONTFACE = 0
   FONTSIZE = 800
   FONTSTYLE = 0
   FONTWEIGHT = 7
   CHARSET = 560
   CHARWIDTH = 5
   BASELINE = 0
   KERNING = 0
   DASHSTYLE = 0
   CAPSTYLE = 0
   JOINSTYLE = 32
   BORDSTYLE = 0
   PERS_FLAGS = 0
   NULL_FLAGS = 0
END

DEFINE  SRW2_DISPLAY_TAG
BEGIN
   ITEMID = 392
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = <<"Simplified Arabic">>
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 0
   TEXTBACK = 0
   LINEPAT = 0
   LINEFORE = 0
   LINEBACK = 0
   FILLPAT = 0
   FILLFORE = 0
   FILLBACK = 0
   FONTFACE = 0
   FONTSIZE = 800
   FONTSTYLE = 0
   FONTWEIGHT = 7
   CHARSET = 560
   CHARWIDTH = 5
   BASELINE = 0
   KERNING = 0
   DASHSTYLE = 0
   CAPSTYLE = 0
   JOINSTYLE = 0
   BORDSTYLE = 0
   PERS_FLAGS = 0
   NULL_FLAGS = 0
END

DEFINE  SRW2_DISPLAY_TAG
BEGIN
   ITEMID = 444
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = <<"Courier New">>
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 0
   TEXTBACK = 0
   LINEPAT = 1
   LINEFORE = 0
   LINEBACK = 1
   FILLPAT = 0
   FILLFORE = 0
   FILLBACK = 1
   FONTFACE = 0
   FONTSIZE = 1000
   FONTSTYLE = 0
   FONTWEIGHT = 0
   CHARSET = 560
   CHARWIDTH = 0
   BASELINE = 0
   KERNING = 0
   DASHSTYLE = 0
   CAPSTYLE = 0
   JOINSTYLE = 32
   BORDSTYLE = 0
   PERS_FLAGS = 0
   NULL_FLAGS = 0
END

DEFINE  SRW2_DISPLAY_TAG
BEGIN
   ITEMID = 456
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = NULLP
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 0
   TEXTBACK = 0
   LINEPAT = 0
   LINEFORE = 0
   LINEBACK = 0
   FILLPAT = 0
   FILLFORE = 0
   FILLBACK = 0
   FONTFACE = 0
   FONTSIZE = 0
   FONTSTYLE = 0
   FONTWEIGHT = 0
   CHARSET = 0
   CHARWIDTH = 0
   BASELINE = 0
   KERNING = 0
   DASHSTYLE = 0
   CAPSTYLE = 0
   JOINSTYLE = 0
   BORDSTYLE = 0
   PERS_FLAGS = 0
   NULL_FLAGS = 0
END

DEFINE  SRW2_DISPLAY_TAG
BEGIN
   ITEMID = 504
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = <<"Courier New">>
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 0
   TEXTBACK = 0
   LINEPAT = 255
   LINEFORE = 0
   LINEBACK = 1
   FILLPAT = 255
   FILLFORE = 0
   FILLBACK = 1
   FONTFACE = 0
   FONTSIZE = 1200
   FONTSTYLE = 0
   FONTWEIGHT = 7
   CHARSET = 0
   CHARWIDTH = 5
   BASELINE = 0
   KERNING = 1
   DASHSTYLE = 0
   CAPSTYLE = 0
   JOINSTYLE = 32
   BORDSTYLE = 0
   PERS_FLAGS = 0
   NULL_FLAGS = 0
END

DEFINE  SRW2_DISPLAY_TAG
BEGIN
   ITEMID = 512
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = <<"Courier New">>
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 0
   TEXTBACK = 0
   LINEPAT = 255
   LINEFORE = 0
   LINEBACK = 1
   FILLPAT = 255
   FILLFORE = 0
   FILLBACK = 1
   FONTFACE = 0
   FONTSIZE = 1000
   FONTSTYLE = 0
   FONTWEIGHT = 7
   CHARSET = 0
   CHARWIDTH = 5
   BASELINE = 0
   KERNING = 1
   DASHSTYLE = 0
   CAPSTYLE = 0
   JOINSTYLE = 32
   BORDSTYLE = 0
   PERS_FLAGS = 0
   NULL_FLAGS = 0
END

DEFINE  SRW2_DISPLAY_TAG
BEGIN
   ITEMID = 516
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = <<"Courier New">>
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 0
   TEXTBACK = 0
   LINEPAT = 0
   LINEFORE = 0
   LINEBACK = 0
   FILLPAT = 0
   FILLFORE = 0
   FILLBACK = 0
   FONTFACE = 0
   FONTSIZE = 1000
   FONTSTYLE = 0
   FONTWEIGHT = 7
   CHARSET = 0
   CHARWIDTH = 5
   BASELINE = 0
   KERNING = 1
   DASHSTYLE = 0
   CAPSTYLE = 0
   JOINSTYLE = 0
   BORDSTYLE = 0
   PERS_FLAGS = 0
   NULL_FLAGS = 0
END

DEFINE  SRW2_DISPLAY_TAG
BEGIN
   ITEMID = 531
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = <<"Simplified Arabic">>
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 76
   TEXTBACK = 0
   LINEPAT = 0
   LINEFORE = 0
   LINEBACK = 0
   FILLPAT = 0
   FILLFORE = 0
   FILLBACK = 0
   FONTFACE = 0
   FONTSIZE = 1000
   FONTSTYLE = 0
   FONTWEIGHT = 7
   CHARSET = 560
   CHARWIDTH = 5
   BASELINE = 0
   KERNING = 0
   DASHSTYLE = 0
   CAPSTYLE = 0
   JOINSTYLE = 0
   BORDSTYLE = 0
   PERS_FLAGS = 0
   NULL_FLAGS = 0
END

DEFINE  SRW2_DISPLAY_TAG
BEGIN
   ITEMID = 539
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = <<"Simplified Arabic">>
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 0
   TEXTBACK = 0
   LINEPAT = 0
   LINEFORE = 0
   LINEBACK = 0
   FILLPAT = 0
   FILLFORE = 0
   FILLBACK = 0
   FONTFACE = 0
   FONTSIZE = 1000
   FONTSTYLE = 0
   FONTWEIGHT = 7
   CHARSET = 560
   CHARWIDTH = 5
   BASELINE = 0
   KERNING = 0
   DASHSTYLE = 0
   CAPSTYLE = 0
   JOINSTYLE = 0
   BORDSTYLE = 0
   PERS_FLAGS = 0
   NULL_FLAGS = 0
END

DEFINE  SRW2_DISPLAY_TAG
BEGIN
   ITEMID = 541
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = <<"Simplified Arabic">>
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 0
   TEXTBACK = 0
   LINEPAT = 255
   LINEFORE = 0
   LINEBACK = 1
   FILLPAT = 255
   FILLFORE = 0
   FILLBACK = 1
   FONTFACE = 0
   FONTSIZE = 900
   FONTSTYLE = 0
   FONTWEIGHT = 7
   CHARSET = 560
   CHARWIDTH = 5
   BASELINE = 0
   KERNING = 0
   DASHSTYLE = 0
   CAPSTYLE = 0
   JOINSTYLE = 32
   BORDSTYLE = 0
   PERS_FLAGS = 0
   NULL_FLAGS = 0
END

DEFINE  SRW2_DISPLAY_TAG
BEGIN
   ITEMID = 542
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = <<"Simplified Arabic">>
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 0
   TEXTBACK = 0
   LINEPAT = 255
   LINEFORE = 0
   LINEBACK = 1
   FILLPAT = 255
   FILLFORE = 0
   FILLBACK = 1
   FONTFACE = 0
   FONTSIZE = 1200
   FONTSTYLE = 0
   FONTWEIGHT = 7
   CHARSET = 560
   CHARWIDTH = 5
   BASELINE = 0
   KERNING = 0
   DASHSTYLE = 0
   CAPSTYLE = 0
   JOINSTYLE = 32
   BORDSTYLE = 0
   PERS_FLAGS = 0
   NULL_FLAGS = 0
END

DEFINE  SRW2_DISPLAY_TAG
BEGIN
   ITEMID = 569
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = <<"Simplified Arabic">>
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 0
   TEXTBACK = 0
   LINEPAT = 255
   LINEFORE = 0
   LINEBACK = 1
   FILLPAT = 255
   FILLFORE = 0
   FILLBACK = 1
   FONTFACE = 0
   FONTSIZE = 1000
   FONTSTYLE = 0
   FONTWEIGHT = 7
   CHARSET = 560
   CHARWIDTH = 5
   BASELINE = 0
   KERNING = 0
   DASHSTYLE = 0
   CAPSTYLE = 0
   JOINSTYLE = 32
   BORDSTYLE = 0
   PERS_FLAGS = 0
   NULL_FLAGS = 0
END

DEFINE  SRW2_DISPLAY_TAG
BEGIN
   ITEMID = 570
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = <<"Courier New">>
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 0
   TEXTBACK = 0
   LINEPAT = 255
   LINEFORE = 0
   LINEBACK = 1
   FILLPAT = 255
   FILLFORE = 0
   FILLBACK = 1
   FONTFACE = 0
   FONTSIZE = 900
   FONTSTYLE = 0
   FONTWEIGHT = 7
   CHARSET = 0
   CHARWIDTH = 5
   BASELINE = 0
   KERNING = 1
   DASHSTYLE = 0
   CAPSTYLE = 0
   JOINSTYLE = 32
   BORDSTYLE = 0
   PERS_FLAGS = 0
   NULL_FLAGS = 0
END

DEFINE  SRW2_DISPLAY_TAG
BEGIN
   ITEMID = 577
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = <<"Courier New">>
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 0
   TEXTBACK = 0
   LINEPAT = 0
   LINEFORE = 0
   LINEBACK = 0
   FILLPAT = 0
   FILLFORE = 0
   FILLBACK = 0
   FONTFACE = 0
   FONTSIZE = 800
   FONTSTYLE = 0
   FONTWEIGHT = 7
   CHARSET = 560
   CHARWIDTH = 5
   BASELINE = 0
   KERNING = 0
   DASHSTYLE = 0
   CAPSTYLE = 0
   JOINSTYLE = 0
   BORDSTYLE = 0
   PERS_FLAGS = 0
   NULL_FLAGS = 0
END

DEFINE  SRW2_DISPLAY_TAG
BEGIN
   ITEMID = 605
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = NULLP
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 0
   TEXTBACK = 0
   LINEPAT = 1
   LINEFORE = 1
   LINEBACK = 1
   FILLPAT = 0
   FILLFORE = 0
   FILLBACK = 0
   FONTFACE = 0
   FONTSIZE = 0
   FONTSTYLE = 0
   FONTWEIGHT = 0
   CHARSET = 0
   CHARWIDTH = 0
   BASELINE = 0
   KERNING = 0
   DASHSTYLE = 0
   CAPSTYLE = 0
   JOINSTYLE = 32
   BORDSTYLE = 0
   PERS_FLAGS = 0
   NULL_FLAGS = 0
END

DEFINE  SRW2_DISPLAY_TAG
BEGIN
   ITEMID = 608
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = <<"Simplified Arabic">>
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 1
   TEXTBACK = 0
   LINEPAT = 0
   LINEFORE = 0
   LINEBACK = 0
   FILLPAT = 0
   FILLFORE = 0
   FILLBACK = 0
   FONTFACE = 0
   FONTSIZE = 1000
   FONTSTYLE = 0
   FONTWEIGHT = 7
   CHARSET = 560
   CHARWIDTH = 5
   BASELINE = 0
   KERNING = 0
   DASHSTYLE = 0
   CAPSTYLE = 0
   JOINSTYLE = 0
   BORDSTYLE = 0
   PERS_FLAGS = 0
   NULL_FLAGS = 0
END

DEFINE  SRW2_DISPLAY_TAG
BEGIN
   ITEMID = 609
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = <<"Simplified Arabic">>
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 78
   TEXTBACK = 0
   LINEPAT = 0
   LINEFORE = 0
   LINEBACK = 0
   FILLPAT = 0
   FILLFORE = 0
   FILLBACK = 0
   FONTFACE = 0
   FONTSIZE = 1400
   FONTSTYLE = 0
   FONTWEIGHT = 7
   CHARSET = 560
   CHARWIDTH = 5
   BASELINE = 0
   KERNING = 0
   DASHSTYLE = 0
   CAPSTYLE = 0
   JOINSTYLE = 0
   BORDSTYLE = 0
   PERS_FLAGS = 0
   NULL_FLAGS = 0
END

DEFINE  SRW2_DISPLAY_TAG
BEGIN
   ITEMID = 610
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = <<"Courier New">>
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 0
   TEXTBACK = 0
   LINEPAT = 0
   LINEFORE = 0
   LINEBACK = 0
   FILLPAT = 0
   FILLFORE = 0
   FILLBACK = 0
   FONTFACE = 0
   FONTSIZE = 900
   FONTSTYLE = 0
   FONTWEIGHT = 7
   CHARSET = 560
   CHARWIDTH = 5
   BASELINE = 0
   KERNING = 0
   DASHSTYLE = 0
   CAPSTYLE = 0
   JOINSTYLE = 0
   BORDSTYLE = 0
   PERS_FLAGS = 0
   NULL_FLAGS = 0
END

DEFINE  SRW2_DISPLAY_TAG
BEGIN
   ITEMID = 612
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = NULLP
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 0
   TEXTBACK = 0
   LINEPAT = 1
   LINEFORE = 0
   LINEBACK = 1
   FILLPAT = 255
   FILLFORE = 0
   FILLBACK = 1
   FONTFACE = 0
   FONTSIZE = 0
   FONTSTYLE = 0
   FONTWEIGHT = 0
   CHARSET = 0
   CHARWIDTH = 0
   BASELINE = 0
   KERNING = 0
   DASHSTYLE = 0
   CAPSTYLE = 0
   JOINSTYLE = 32
   BORDSTYLE = 0
   PERS_FLAGS = 0
   NULL_FLAGS = 0
END

DEFINE  SRW2_DISPLAY_TAG
BEGIN
   ITEMID = 615
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = <<"Courier New">>
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 0
   TEXTBACK = 0
   LINEPAT = 255
   LINEFORE = 0
   LINEBACK = 1
   FILLPAT = 255
   FILLFORE = 0
   FILLBACK = 1
   FONTFACE = 0
   FONTSIZE = 1000
   FONTSTYLE = 0
   FONTWEIGHT = 7
   CHARSET = 560
   CHARWIDTH = 5
   BASELINE = 0
   KERNING = 0
   DASHSTYLE = 0
   CAPSTYLE = 0
   JOINSTYLE = 32
   BORDSTYLE = 0
   PERS_FLAGS = 0
   NULL_FLAGS = 0
END

DEFINE  SRW2_DISPLAY_TAG
BEGIN
   ITEMID = 617
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = <<"Courier New">>
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 0
   TEXTBACK = 0
   LINEPAT = 1
   LINEFORE = 0
   LINEBACK = 1
   FILLPAT = 255
   FILLFORE = 0
   FILLBACK = 1
   FONTFACE = 0
   FONTSIZE = 1200
   FONTSTYLE = 0
   FONTWEIGHT = 7
   CHARSET = 560
   CHARWIDTH = 5
   BASELINE = 0
   KERNING = 0
   DASHSTYLE = 0
   CAPSTYLE = 0
   JOINSTYLE = 32
   BORDSTYLE = 0
   PERS_FLAGS = 0
   NULL_FLAGS = 0
END

DEFINE  SRW2_DISPLAY_TAG
BEGIN
   ITEMID = 618
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = <<"Courier New">>
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 0
   TEXTBACK = 0
   LINEPAT = 1
   LINEFORE = 0
   LINEBACK = 1
   FILLPAT = 255
   FILLFORE = 0
   FILLBACK = 1
   FONTFACE = 0
   FONTSIZE = 1000
   FONTSTYLE = 0
   FONTWEIGHT = 7
   CHARSET = 560
   CHARWIDTH = 5
   BASELINE = 0
   KERNING = 0
   DASHSTYLE = 0
   CAPSTYLE = 0
   JOINSTYLE = 32
   BORDSTYLE = 0
   PERS_FLAGS = 0
   NULL_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 109
   ALIAS = <<"I_NAME">>
   EXPR = <<"ITEM_TBL.I_NAME">>
   DESC_EXPR = <<"I_NAME">>
   SEL_ORDER = 1
   DATA_TYPE = 7
   WIDTH = 60
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 1
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 112
   ALIAS = <<"I_CODE">>
   EXPR = <<"INV_DTL.I_CODE">>
   DESC_EXPR = <<"I_CODE">>
   SEL_ORDER = 2
   DATA_TYPE = 1
   WIDTH = 22
   SCALE = 0
   PRECISION = 10
   QUERYID = 103
   ODATA_TYPE = 2
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 115
   ALIAS = <<"QTY">>
   EXPR = <<"INV_DTL.QTY">>
   DESC_EXPR = <<"QTY">>
   SEL_ORDER = 3
   DATA_TYPE = 1
   WIDTH = 22
   SCALE = -127
   PRECISION = 126
   QUERYID = 103
   ODATA_TYPE = 2
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 118
   ALIAS = <<"PRICE">>
   EXPR = <<"INV_DTL.PRICE">>
   DESC_EXPR = <<"PRICE">>
   SEL_ORDER = 4
   DATA_TYPE = 1
   WIDTH = 22
   SCALE = -127
   PRECISION = 126
   QUERYID = 103
   ODATA_TYPE = 2
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 121
   ALIAS = <<"I_Q">>
   EXPR = <<"INV_DTL.I_Q">>
   DESC_EXPR = <<"I_Q">>
   SEL_ORDER = 5
   DATA_TYPE = 1
   WIDTH = 22
   SCALE = -127
   PRECISION = 126
   QUERYID = 103
   ODATA_TYPE = 2
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 124
   ALIAS = <<"SERIAL_NO">>
   EXPR = <<"INVOICE.SERIAL_NO">>
   DESC_EXPR = <<"SERIAL_NO">>
   SEL_ORDER = 6
   DATA_TYPE = 1
   WIDTH = 22
   SCALE = 0
   PRECISION = 6
   QUERYID = 103
   ODATA_TYPE = 2
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 127
   ALIAS = <<"INV_DATE">>
   EXPR = <<"INVOICE.INV_DATE">>
   DESC_EXPR = <<"INV_DATE">>
   SEL_ORDER = 7
   DATA_TYPE = 2
   WIDTH = 9
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 12
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 130
   ALIAS = <<"POINT_NAME">>
   EXPR = <<"POINT_TBL.POINT_NAME">>
   DESC_EXPR = <<"POINT_NAME">>
   SEL_ORDER = 8
   DATA_TYPE = 7
   WIDTH = 30
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 1
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 133
   ALIAS = <<"MEM_NAME">>
   EXPR = <<"MEM_VIEW.MEM_NAME">>
   DESC_EXPR = <<"MEM_NAME">>
   SEL_ORDER = 9
   DATA_TYPE = 7
   WIDTH = 70
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 1
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 136
   ALIAS = <<"MEM_ID">>
   EXPR = <<"MEM_VIEW.MEM_ID">>
   DESC_EXPR = <<"MEM_ID">>
   SEL_ORDER = 10
   DATA_TYPE = 1
   WIDTH = 22
   SCALE = 0
   PRECISION = 10
   QUERYID = 103
   ODATA_TYPE = 2
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 139
   ALIAS = <<"INV_TOT">>
   EXPR = <<"INVOICE.INV_TOT">>
   DESC_EXPR = <<"INV_TOT">>
   SEL_ORDER = 11
   DATA_TYPE = 1
   WIDTH = 22
   SCALE = 2
   PRECISION = 10
   QUERYID = 103
   ODATA_TYPE = 2
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 142
   ALIAS = <<"ROOM_NO">>
   EXPR = <<"INVOICE.ROOM_NO">>
   DESC_EXPR = <<"ROOM_NO">>
   SEL_ORDER = 12
   DATA_TYPE = 1
   WIDTH = 22
   SCALE = 0
   PRECISION = 5
   QUERYID = 103
   ODATA_TYPE = 2
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 145
   ALIAS = <<"SERV_Q">>
   EXPR = <<"INVOICE.SERV_Q">>
   DESC_EXPR = <<"SERV_Q">>
   SEL_ORDER = 13
   DATA_TYPE = 1
   WIDTH = 22
   SCALE = 2
   PRECISION = 10
   QUERYID = 103
   ODATA_TYPE = 2
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 148
   ALIAS = <<"DISC_Q">>
   EXPR = <<"INVOICE.DISC_Q">>
   DESC_EXPR = <<"DISC_Q">>
   SEL_ORDER = 14
   DATA_TYPE = 1
   WIDTH = 22
   SCALE = 2
   PRECISION = 10
   QUERYID = 103
   ODATA_TYPE = 2
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 151
   ALIAS = <<"TABLE_NO">>
   EXPR = <<"INVOICE.TABLE_NO">>
   DESC_EXPR = <<"TABLE_NO">>
   SEL_ORDER = 15
   DATA_TYPE = 1
   WIDTH = 22
   SCALE = 0
   PRECISION = 3
   QUERYID = 103
   ODATA_TYPE = 2
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 459
   ALIAS = <<"ser_NO">>
   EXPR = <<"INVOICE.SER_NO">>
   DESC_EXPR = <<"SER_NO">>
   SEL_ORDER = 16
   DATA_TYPE = 1
   WIDTH = 22
   SCALE = 0
   PRECISION = 6
   QUERYID = 103
   ODATA_TYPE = 2
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 473
   ALIAS = <<"inv_typ">>
   EXPR = <<"INVOICE.INV_TYP">>
   DESC_EXPR = <<"INV_TYP">>
   SEL_ORDER = 17
   DATA_TYPE = 1
   WIDTH = 22
   SCALE = 0
   PRECISION = 3
   QUERYID = 103
   ODATA_TYPE = 2
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 484
   ALIAS = <<"emp_code">>
   EXPR = <<"INVOICE.EMP_CODE">>
   DESC_EXPR = <<"EMP_CODE">>
   SEL_ORDER = 18
   DATA_TYPE = 1
   WIDTH = 22
   SCALE = 0
   PRECISION = 20
   QUERYID = 103
   ODATA_TYPE = 2
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 502
   ALIAS = <<"h_no">>
   EXPR = <<"INVOICE.H_NO">>
   DESC_EXPR = <<"H_NO">>
   SEL_ORDER = 19
   DATA_TYPE = 7
   WIDTH = 15
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 1
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 544
   ALIAS = <<"EMP_ID">>
   EXPR = <<"INVOICE.EMP_ID">>
   DESC_EXPR = <<"EMP_ID">>
   SEL_ORDER = 20
   DATA_TYPE = 1
   WIDTH = 22
   SCALE = 0
   PRECISION = 20
   QUERYID = 103
   ODATA_TYPE = 2
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_GROUP
BEGIN
   ITEMID = 104
   NAME = <<"G_I_NAME">>
   TAG = 0
   DISP_ORDER = 2
   PTAG = 0
   QUERY_ID = 103
   PARENT_ID = 153
   QLF_TYPE = 0
   QLF_ARG = 0
   QLF_COLUMN = 0
   GLF_TYPE = 0
   GLF_ARG = 0
   GLF_COLUMN = 0
   RLF_TYPE = 0
   RLF_ARG = 0
   RLF_COLUMN = 0
   CROSS_PROD = 0
   PRODUCT_ID = 0
   NUM_POINTS = 0
   POINTS = (BINARY) NULLP
   X = 12733
   Y = 33223
   WD = 15769
   HT = 18928
   DFLT_DIR = 32769
   PERS_FLAGS = 0
   MAIL_TEXT = NULLP
   XML_TAG = <<"G_I_NAME">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   OUTER_XML_TAG = <<"LIST_G_I_NAME">>
   OUTER_ATTR = NULLP
END

DEFINE  SRW2_GROUP
BEGIN
   ITEMID = 153
   NAME = <<"G_SERIAL_NO">>
   TAG = 0
   DISP_ORDER = 1
   PTAG = 0
   QUERY_ID = 103
   PARENT_ID = 0
   QLF_TYPE = 0
   QLF_ARG = 0
   QLF_COLUMN = 0
   GLF_TYPE = 0
   GLF_ARG = 0
   GLF_COLUMN = 0
   RLF_TYPE = 0
   RLF_ARG = 0
   RLF_COLUMN = 0
   CROSS_PROD = 0
   PRODUCT_ID = 0
   NUM_POINTS = 0
   POINTS = (BINARY) NULLP
   X = 13147
   Y = 7185
   WD = 16203
   HT = 24528
   DFLT_DIR = 1
   PERS_FLAGS = 0
   MAIL_TEXT = NULLP
   XML_TAG = <<"G_SERIAL_NO">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   OUTER_XML_TAG = <<"LIST_G_SERIAL_NO">>
   OUTER_ATTR = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 89
   NAME = <<"PRINTJOB">>
   TAG = 0
   DISP_ORDER = 14
   GROUP_ID = 1
   SOURCE = 2
   SOURCE_ID = 0
   COMPUTE_ID = 0
   PROD_ORDER = NULLP
   RESET_ID = 0
   NULL_VALUE = <<"Yes">>
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 0
   FILE_TYPE = 0
   WIDTH = 80
   FLAGS = 128
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"">>
   DFLT_WID = 0
   DEREF_ID = 0
   ODATA_TYPE = 0
   DFLT_HGT = 0
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = NULLP
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 90
   NAME = <<"MODE">>
   TAG = 0
   DISP_ORDER = 13
   GROUP_ID = 1
   SOURCE = 2
   SOURCE_ID = 0
   COMPUTE_ID = 0
   PROD_ORDER = NULLP
   RESET_ID = 0
   NULL_VALUE = <<"Default">>
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 0
   FILE_TYPE = 0
   WIDTH = 80
   FLAGS = 128
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"">>
   DFLT_WID = 0
   DEREF_ID = 0
   ODATA_TYPE = 0
   DFLT_HGT = 0
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = NULLP
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 91
   NAME = <<"BACKGROUND">>
   TAG = 0
   DISP_ORDER = 12
   GROUP_ID = 1
   SOURCE = 2
   SOURCE_ID = 0
   COMPUTE_ID = 0
   PROD_ORDER = NULLP
   RESET_ID = 0
   NULL_VALUE = <<"No">>
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 0
   FILE_TYPE = 0
   WIDTH = 80
   FLAGS = 128
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"">>
   DFLT_WID = 0
   DEREF_ID = 0
   ODATA_TYPE = 0
   DFLT_HGT = 0
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = NULLP
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 92
   NAME = <<"ORIENTATION">>
   TAG = 0
   DISP_ORDER = 11
   GROUP_ID = 1
   SOURCE = 2
   SOURCE_ID = 0
   COMPUTE_ID = 0
   PROD_ORDER = NULLP
   RESET_ID = 0
   NULL_VALUE = <<"Portrait">>
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 0
   FILE_TYPE = 0
   WIDTH = 80
   FLAGS = 128
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"">>
   DFLT_WID = 0
   DEREF_ID = 0
   ODATA_TYPE = 0
   DFLT_HGT = 0
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = NULLP
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 93
   NAME = <<"DECIMAL">>
   TAG = 0
   DISP_ORDER = 10
   GROUP_ID = 1
   SOURCE = 2
   SOURCE_ID = 0
   COMPUTE_ID = 0
   PROD_ORDER = NULLP
   RESET_ID = 0
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 0
   FILE_TYPE = 0
   WIDTH = 1
   FLAGS = 128
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"">>
   DFLT_WID = 0
   DEREF_ID = 0
   ODATA_TYPE = 0
   DFLT_HGT = 0
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = NULLP
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 94
   NAME = <<"THOUSANDS">>
   TAG = 0
   DISP_ORDER = 9
   GROUP_ID = 1
   SOURCE = 2
   SOURCE_ID = 0
   COMPUTE_ID = 0
   PROD_ORDER = NULLP
   RESET_ID = 0
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 0
   FILE_TYPE = 0
   WIDTH = 1
   FLAGS = 128
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"">>
   DFLT_WID = 0
   DEREF_ID = 0
   ODATA_TYPE = 0
   DFLT_HGT = 0
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = NULLP
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 95
   NAME = <<"CURRENCY">>
   TAG = 0
   DISP_ORDER = 8
   GROUP_ID = 1
   SOURCE = 2
   SOURCE_ID = 0
   COMPUTE_ID = 0
   PROD_ORDER = NULLP
   RESET_ID = 0
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 0
   FILE_TYPE = 0
   WIDTH = 1024
   FLAGS = 128
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"">>
   DFLT_WID = 0
   DEREF_ID = 0
   ODATA_TYPE = 0
   DFLT_HGT = 0
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = NULLP
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 96
   NAME = <<"COPIES">>
   TAG = 0
   DISP_ORDER = 7
   GROUP_ID = 1
   SOURCE = 2
   SOURCE_ID = 0
   COMPUTE_ID = 0
   PROD_ORDER = NULLP
   RESET_ID = 0
   NULL_VALUE = <<"1">>
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 1
   FILE_TYPE = 0
   WIDTH = 4
   FLAGS = 128
   PRECISION = 4
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"">>
   DFLT_WID = 0
   DEREF_ID = 0
   ODATA_TYPE = 0
   DFLT_HGT = 0
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = NULLP
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 97
   NAME = <<"DESFORMAT">>
   TAG = 0
   DISP_ORDER = 6
   GROUP_ID = 1
   SOURCE = 2
   SOURCE_ID = 0
   COMPUTE_ID = 0
   PROD_ORDER = NULLP
   RESET_ID = 0
   NULL_VALUE = <<"dflt">>
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 0
   FILE_TYPE = 0
   WIDTH = 1024
   FLAGS = 128
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"">>
   DFLT_WID = 0
   DEREF_ID = 0
   ODATA_TYPE = 0
   DFLT_HGT = 0
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = NULLP
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 98
   NAME = <<"DESNAME">>
   TAG = 0
   DISP_ORDER = 5
   GROUP_ID = 1
   SOURCE = 2
   SOURCE_ID = 0
   COMPUTE_ID = 0
   PROD_ORDER = NULLP
   RESET_ID = 0
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 0
   FILE_TYPE = 0
   WIDTH = 1024
   FLAGS = 128
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"">>
   DFLT_WID = 0
   DEREF_ID = 0
   ODATA_TYPE = 0
   DFLT_HGT = 0
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = NULLP
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 99
   NAME = <<"DESTYPE">>
   TAG = 0
   DISP_ORDER = 4
   GROUP_ID = 1
   SOURCE = 2
   SOURCE_ID = 0
   COMPUTE_ID = 0
   PROD_ORDER = NULLP
   RESET_ID = 0
   NULL_VALUE = <<"Screen">>
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 0
   FILE_TYPE = 0
   WIDTH = 80
   FLAGS = 128
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"">>
   DFLT_WID = 0
   DEREF_ID = 0
   ODATA_TYPE = 0
   DFLT_HGT = 0
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = NULLP
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 105
   NAME = <<"PT_CODE">>
   TAG = 0
   DISP_ORDER = 15
   GROUP_ID = 1
   SOURCE = 3
   SOURCE_ID = 0
   COMPUTE_ID = 0
   PROD_ORDER = NULLP
   RESET_ID = 0
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 0
   FILE_TYPE = 1
   WIDTH = 40
   FLAGS = 160
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"">>
   DFLT_WID = 0
   DEREF_ID = 0
   ODATA_TYPE = 0
   DFLT_HGT = 0
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = <<"PT_CODE">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 106
   NAME = <<"INV_DT">>
   TAG = 0
   DISP_ORDER = 16
   GROUP_ID = 1
   SOURCE = 3
   SOURCE_ID = 0
   COMPUTE_ID = 0
   PROD_ORDER = NULLP
   RESET_ID = 0
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 0
   FILE_TYPE = 1
   WIDTH = 40
   FLAGS = 160
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"">>
   DFLT_WID = 0
   DEREF_ID = 0
   ODATA_TYPE = 0
   DFLT_HGT = 0
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = <<"INV_DT">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 107
   NAME = <<"SER_NO">>
   TAG = 0
   DISP_ORDER = 17
   GROUP_ID = 1
   SOURCE = 3
   SOURCE_ID = 0
   COMPUTE_ID = 0
   PROD_ORDER = NULLP
   RESET_ID = 0
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 0
   FILE_TYPE = 1
   WIDTH = 40
   FLAGS = 160
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"">>
   DFLT_WID = 0
   DEREF_ID = 0
   ODATA_TYPE = 0
   DFLT_HGT = 0
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = <<"SER_NO">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 108
   NAME = <<"I_NAME">>
   TAG = 0
   DISP_ORDER = 3
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 109
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 60
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"I Name">>
   DFLT_WID = 100000
   DEREF_ID = 0
   ODATA_TYPE = 1
   DFLT_HGT = 10000
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = <<"I_NAME">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 111
   NAME = <<"I_CODE">>
   TAG = 0
   DISP_ORDER = 7
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 112
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 1
   FILE_TYPE = 1
   WIDTH = 22
   FLAGS = 1
   PRECISION = 10
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"I Code">>
   DFLT_WID = 80000
   DEREF_ID = 0
   ODATA_TYPE = 2
   DFLT_HGT = 10000
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = <<"I_CODE">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 114
   NAME = <<"QTY">>
   TAG = 0
   DISP_ORDER = 4
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 115
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 1
   FILE_TYPE = 1
   WIDTH = 22
   FLAGS = 33
   PRECISION = 126
   SCALE = -127
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Qty">>
   DFLT_WID = 70000
   DEREF_ID = 0
   ODATA_TYPE = 2
   DFLT_HGT = 10000
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = <<"QTY">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 117
   NAME = <<"PRICE">>
   TAG = 0
   DISP_ORDER = 5
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 118
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 1
   FILE_TYPE = 1
   WIDTH = 22
   FLAGS = 33
   PRECISION = 126
   SCALE = -127
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Price">>
   DFLT_WID = 120000
   DEREF_ID = 0
   ODATA_TYPE = 2
   DFLT_HGT = 10000
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = <<"PRICE">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 120
   NAME = <<"I_Q">>
   TAG = 0
   DISP_ORDER = 6
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 121
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 1
   FILE_TYPE = 1
   WIDTH = 22
   FLAGS = 33
   PRECISION = 126
   SCALE = -127
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"I Q">>
   DFLT_WID = 120000
   DEREF_ID = 0
   ODATA_TYPE = 2
   DFLT_HGT = 10000
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = <<"I_Q">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 123
   NAME = <<"SERIAL_NO">>
   TAG = 0
   DISP_ORDER = 0
   GROUP_ID = 153
   SOURCE = 0
   SOURCE_ID = 124
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 1
   FILE_TYPE = 1
   WIDTH = 22
   FLAGS = 1
   PRECISION = 6
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Serial No">>
   DFLT_WID = 80000
   DEREF_ID = 0
   ODATA_TYPE = 2
   DFLT_HGT = 10000
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = <<"SERIAL_NO">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 126
   NAME = <<"INV_DATE">>
   TAG = 0
   DISP_ORDER = 1
   GROUP_ID = 153
   SOURCE = 0
   SOURCE_ID = 127
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 2
   FILE_TYPE = 1
   WIDTH = 9
   FLAGS = 1
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Inv Date">>
   DFLT_WID = 90000
   DEREF_ID = 0
   ODATA_TYPE = 12
   DFLT_HGT = 10000
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = <<"INV_DATE">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 129
   NAME = <<"POINT_NAME">>
   TAG = 0
   DISP_ORDER = 2
   GROUP_ID = 153
   SOURCE = 0
   SOURCE_ID = 130
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 30
   FLAGS = 1
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Point Name">>
   DFLT_WID = 100000
   DEREF_ID = 0
   ODATA_TYPE = 1
   DFLT_HGT = 10000
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = <<"POINT_NAME">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 132
   NAME = <<"MEM_NAME">>
   TAG = 0
   DISP_ORDER = 3
   GROUP_ID = 153
   SOURCE = 0
   SOURCE_ID = 133
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 70
   FLAGS = 1
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Mem Name">>
   DFLT_WID = 100000
   DEREF_ID = 2
   ODATA_TYPE = 1
   DFLT_HGT = 10000
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = <<"MEM_NAME">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 135
   NAME = <<"MEM_ID">>
   TAG = 0
   DISP_ORDER = 6
   GROUP_ID = 153
   SOURCE = 0
   SOURCE_ID = 136
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 1
   FILE_TYPE = 1
   WIDTH = 22
   FLAGS = 1
   PRECISION = 10
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Mem Id">>
   DFLT_WID = 120000
   DEREF_ID = 3
   ODATA_TYPE = 2
   DFLT_HGT = 10000
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = <<"MEM_ID">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 138
   NAME = <<"INV_TOT">>
   TAG = 0
   DISP_ORDER = 8
   GROUP_ID = 153
   SOURCE = 0
   SOURCE_ID = 139
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 1
   FILE_TYPE = 1
   WIDTH = 22
   FLAGS = 1
   PRECISION = 10
   SCALE = 2
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Inv Tot">>
   DFLT_WID = 120000
   DEREF_ID = 0
   ODATA_TYPE = 2
   DFLT_HGT = 10000
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = <<"INV_TOT">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 141
   NAME = <<"ROOM_NO">>
   TAG = 0
   DISP_ORDER = 4
   GROUP_ID = 153
   SOURCE = 0
   SOURCE_ID = 142
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 1
   FILE_TYPE = 1
   WIDTH = 22
   FLAGS = 1
   PRECISION = 5
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Room No">>
   DFLT_WID = 70000
   DEREF_ID = 0
   ODATA_TYPE = 2
   DFLT_HGT = 10000
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = <<"ROOM_NO">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 144
   NAME = <<"SERV_Q">>
   TAG = 0
   DISP_ORDER = 5
   GROUP_ID = 153
   SOURCE = 0
   SOURCE_ID = 145
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 1
   FILE_TYPE = 1
   WIDTH = 22
   FLAGS = 1
   PRECISION = 10
   SCALE = 2
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Serv Q">>
   DFLT_WID = 120000
   DEREF_ID = 0
   ODATA_TYPE = 2
   DFLT_HGT = 10000
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = <<"SERV_Q">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 147
   NAME = <<"DISC_Q">>
   TAG = 0
   DISP_ORDER = 7
   GROUP_ID = 153
   SOURCE = 0
   SOURCE_ID = 148
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 1
   FILE_TYPE = 1
   WIDTH = 22
   FLAGS = 1
   PRECISION = 10
   SCALE = 2
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Disc Q">>
   DFLT_WID = 120000
   DEREF_ID = 0
   ODATA_TYPE = 2
   DFLT_HGT = 10000
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = <<"DISC_Q">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 150
   NAME = <<"TABLE_NO">>
   TAG = 0
   DISP_ORDER = 9
   GROUP_ID = 153
   SOURCE = 0
   SOURCE_ID = 151
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 1
   FILE_TYPE = 1
   WIDTH = 22
   FLAGS = 1
   PRECISION = 3
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Table No">>
   DFLT_WID = 50000
   DEREF_ID = 0
   ODATA_TYPE = 2
   DFLT_HGT = 10000
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = <<"TABLE_NO">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 154
   NAME = <<"SumI_QPerSERIAL_NO">>
   TAG = 0
   DISP_ORDER = 10
   GROUP_ID = 153
   SOURCE = 1
   SOURCE_ID = 120
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 153
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 1
   DATA_TYPE = 1
   FILE_TYPE = 1
   WIDTH = 22
   FLAGS = 520
   PRECISION = 10
   SCALE = 2
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Total:">>
   DFLT_WID = 120000
   DEREF_ID = 0
   ODATA_TYPE = 0
   DFLT_HGT = 10000
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = <<"SUMI_QPERSERIAL_NO">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 156
   NAME = <<"SumI_QPerReport">>
   TAG = 0
   DISP_ORDER = 3
   GROUP_ID = 1
   SOURCE = 1
   SOURCE_ID = 120
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 1
   DATA_TYPE = 1
   FILE_TYPE = 1
   WIDTH = 22
   FLAGS = 552
   PRECISION = 10
   SCALE = 2
   X = 35072
   Y = 12374
   WD = 17646
   HT = 1638
   DFLT_LBL = <<"Total:">>
   DFLT_WID = 120000
   DEREF_ID = 0
   ODATA_TYPE = 0
   DFLT_HGT = 10000
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = <<"SUMI_QPERREPORT">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 458
   NAME = <<"ser_NO1">>
   TAG = 0
   DISP_ORDER = 11
   GROUP_ID = 153
   SOURCE = 0
   SOURCE_ID = 459
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 1
   FILE_TYPE = 1
   WIDTH = 22
   FLAGS = 1
   PRECISION = 6
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Ser No1">>
   DFLT_WID = 80000
   DEREF_ID = 0
   ODATA_TYPE = 2
   DFLT_HGT = 10000
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = <<"SER_NO1">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 472
   NAME = <<"inv_typ">>
   TAG = 0
   DISP_ORDER = 12
   GROUP_ID = 153
   SOURCE = 0
   SOURCE_ID = 473
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 1
   FILE_TYPE = 1
   WIDTH = 22
   FLAGS = 1
   PRECISION = 3
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Inv Typ">>
   DFLT_WID = 50000
   DEREF_ID = 1
   ODATA_TYPE = 2
   DFLT_HGT = 10000
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = <<"INV_TYP">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 475
   NAME = <<"i_t">>
   TAG = 0
   DISP_ORDER = 13
   GROUP_ID = 153
   SOURCE = 1
   SOURCE_ID = 0
   COMPUTE_ID = 0
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 0
   FILE_TYPE = 1
   WIDTH = 20
   FLAGS = 16
   PRECISION = 10
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"I T">>
   DFLT_WID = 100000
   DEREF_ID = 0
   ODATA_TYPE = 0
   DFLT_HGT = 10000
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = <<"I_T">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 479
   NAME = <<"m_m">>
   TAG = 0
   DISP_ORDER = 14
   GROUP_ID = 153
   SOURCE = 1
   SOURCE_ID = 0
   COMPUTE_ID = 0
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 0
   FILE_TYPE = 1
   WIDTH = 100
   FLAGS = 16
   PRECISION = 10
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"M M">>
   DFLT_WID = 100000
   DEREF_ID = 0
   ODATA_TYPE = 0
   DFLT_HGT = 10000
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = <<"M_M">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 483
   NAME = <<"emp_code">>
   TAG = 0
   DISP_ORDER = 2
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 484
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 1
   FILE_TYPE = 1
   WIDTH = 22
   FLAGS = 1
   PRECISION = 20
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Emp Code">>
   DFLT_WID = 80000
   DEREF_ID = 4
   ODATA_TYPE = 2
   DFLT_HGT = 10000
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = <<"EMP_CODE">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 501
   NAME = <<"h_no">>
   TAG = 0
   DISP_ORDER = 1
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 502
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 15
   FLAGS = 1
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"H No">>
   DFLT_WID = 100000
   DEREF_ID = 5
   ODATA_TYPE = 1
   DFLT_HGT = 10000
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = <<"H_NO">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 543
   NAME = <<"EMP_ID">>
   TAG = 0
   DISP_ORDER = 0
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 544
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 1
   FILE_TYPE = 1
   WIDTH = 22
   FLAGS = 1
   PRECISION = 20
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Emp Id">>
   DFLT_WID = 90000
   DEREF_ID = 0
   ODATA_TYPE = 2
   DFLT_HGT = 10000
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = <<"EMP_ID">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 561
   NAME = <<"P_EMP_ID">>
   TAG = 0
   DISP_ORDER = 18
   GROUP_ID = 1
   SOURCE = 3
   SOURCE_ID = 0
   COMPUTE_ID = 0
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 1
   FILE_TYPE = 1
   WIDTH = 20
   FLAGS = 160
   PRECISION = 10
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"">>
   DFLT_WID = 0
   DEREF_ID = 0
   ODATA_TYPE = 0
   DFLT_HGT = 0
   PARA_TYPE = 0
   PLOV_RTYPE = 0
   PLOV_SLISTID = 0
   PLOV_SELECT = NULLP
   PLOV_COL = NULLP
   REFDTYPE = 0
   PERS_FLAGS = 0
   EXPANDED = 0
   SUBGROUP = 0
   TYPENAME = NULLP
   SCHEMA = NULLP
   PARENT_COL = 0
   BOUND = 0
   SORTSRCCOL = 0
   SORTCOL = 0
   XML_TAG = <<"P_EMP_ID">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 215
   SEG_ORDER = 0
   TAG = 608
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 217
   SEG_ORDER = 0
   TAG = 608
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 219
   SEG_ORDER = 0
   TAG = 608
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 221
   SEG_ORDER = 0
   TAG = 608
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 223
   SEG_ORDER = 0
   TAG = 539
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 257
   SEG_ORDER = 0
   TAG = 392
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 258
   SEG_ORDER = 0
   TAG = 392
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 261
   SEG_ORDER = 0
   TAG = 392
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 267
   SEG_ORDER = 0
   TAG = 516
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 268
   SEG_ORDER = 0
   TAG = 516
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 269
   SEG_ORDER = 0
   TAG = 516
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 296
   SEG_ORDER = 0
   TAG = 362
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 300
   SEG_ORDER = 0
   TAG = 392
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 312
   SEG_ORDER = 0
   TAG = 392
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 425
   SEG_ORDER = 0
   TAG = 531
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 426
   SEG_ORDER = 0
   TAG = 609
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 571
   SEG_ORDER = 0
   TAG = 610
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 574
   SEG_ORDER = 0
   TAG = 577
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 579
   SEG_ORDER = 0
   TAG = 577
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 584
   SEG_ORDER = 0
   TAG = 392
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 586
   SEG_ORDER = 0
   TAG = 392
END

DEFINE  SRW2_FRAME
BEGIN
   ITEMID = 189
   NAME = <<"M_G_SERIAL_NO_GRPFR">>
   TAG = 186
   DISP_ORDER = 0
   FORMATFLAG = 805306636
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 0
   Y = 4623
   WD = 20157
   HT = 28032
   PAGE = 0
   GROUP_ID = 153
   CONTINUED = 0
   DIRECTION = 0
   MIN_WIDOWS = 1
   MIN_ORPHAN = 1
   MAX_LINES = -1
   BETWEEN_X = 0
   BETWEEN_Y = 0
   RESERVED = 0
   BIDI_DIR = 0
   MAX_COLS = 0
   MAX_ROWS = 0
   PERS_FLAGS = 16
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   FRAME_TYPE = 1
   TEMPL_ID = 163
   TABCAP = NULLP
END

DEFINE  SRW2_FRAME
BEGIN
   ITEMID = 191
   NAME = <<"R_G_SERIAL_NO">>
   TAG = 226
   DISP_ORDER = 1
   FORMATFLAG = 805306636
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 0
   Y = 4824
   WD = 19961
   HT = 27428
   PAGE = 0
   GROUP_ID = 153
   CONTINUED = 0
   DIRECTION = 1
   MIN_WIDOWS = 1
   MIN_ORPHAN = 1
   MAX_LINES = -1
   BETWEEN_X = 0
   BETWEEN_Y = 0
   RESERVED = 0
   BIDI_DIR = 0
   MAX_COLS = 0
   MAX_ROWS = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   FRAME_TYPE = 3
   TEMPL_ID = 166
   TABCAP = NULLP
END

DEFINE  SRW2_FRAME
BEGIN
   ITEMID = 211
   NAME = <<"M_G_I_NAME_GRPFR">>
   TAG = 186
   DISP_ORDER = 2
   FORMATFLAG = 805306636
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 15
   Y = 15924
   WD = 19939
   HT = 7459
   PAGE = 0
   GROUP_ID = 104
   CONTINUED = 0
   DIRECTION = 0
   MIN_WIDOWS = 1
   MIN_ORPHAN = 1
   MAX_LINES = -1
   BETWEEN_X = 0
   BETWEEN_Y = 0
   RESERVED = 0
   BIDI_DIR = 0
   MAX_COLS = 0
   MAX_ROWS = 0
   PERS_FLAGS = 16
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   FRAME_TYPE = 1
   TEMPL_ID = 163
   TABCAP = NULLP
END

DEFINE  SRW2_FRAME
BEGIN
   ITEMID = 212
   NAME = <<"M_G_I_NAME_HDR">>
   TAG = 226
   DISP_ORDER = 4
   FORMATFLAG = 536871936
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 15
   Y = 16035
   WD = 19340
   HT = 1957
   PAGE = 0
   GROUP_ID = 104
   CONTINUED = 0
   DIRECTION = 0
   MIN_WIDOWS = 1
   MIN_ORPHAN = 1
   MAX_LINES = -1
   BETWEEN_X = 0
   BETWEEN_Y = 0
   RESERVED = 0
   BIDI_DIR = 0
   MAX_COLS = 0
   MAX_ROWS = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   FRAME_TYPE = 2
   TEMPL_ID = 165
   TABCAP = NULLP
END

DEFINE  SRW2_FRAME
BEGIN
   ITEMID = 213
   NAME = <<"R_G_I_NAME">>
   TAG = 226
   DISP_ORDER = 3
   FORMATFLAG = 805306628
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 15
   Y = 18193
   WD = 19139
   HT = 1536
   PAGE = 0
   GROUP_ID = 104
   CONTINUED = 0
   DIRECTION = 1
   MIN_WIDOWS = 1
   MIN_ORPHAN = 1
   MAX_LINES = -1
   BETWEEN_X = 0
   BETWEEN_Y = 0
   RESERVED = 0
   BIDI_DIR = 0
   MAX_COLS = 0
   MAX_ROWS = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   FRAME_TYPE = 3
   TEMPL_ID = 166
   TABCAP = NULLP
END

DEFINE  SRW2_FRAME
BEGIN
   ITEMID = 222
   NAME = <<"M_G_I_NAME_FTR">>
   TAG = 612
   DISP_ORDER = 5
   FORMATFLAG = 2048
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 15
   Y = 19729
   WD = 19135
   HT = 2359
   PAGE = 0
   GROUP_ID = 104
   CONTINUED = 0
   DIRECTION = 0
   MIN_WIDOWS = 1
   MIN_ORPHAN = 1
   MAX_LINES = -1
   BETWEEN_X = 0
   BETWEEN_Y = 0
   RESERVED = 0
   BIDI_DIR = 0
   MAX_COLS = 0
   MAX_ROWS = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   FRAME_TYPE = 4
   TEMPL_ID = 167
   TABCAP = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 192
   NAME = <<"F_SERIAL_NO">>
   TAG = 569
   DISP_ORDER = 6
   FORMATFLAG = 536871940
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 4756
   Y = 8996
   WD = 4096
   HT = 2292
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 458
   CONTINUED = 0
   ALIGNMENT = 4
   TEXT_WRAP = 4
   MIN_WIDOWS = 1
   MIN_ORPHAN = 1
   MAX_LINES = -1
   MASK = NULLP
   NULL_VALUE = NULLP
   SPACING = 0
   BIDI_DIR = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 181
   FRAME_ID = 191
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 194
   NAME = <<"F_INV_DATE">>
   TAG = 570
   DISP_ORDER = 7
   FORMATFLAG = 536871940
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 83
   Y = 6948
   WD = 19082
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 126
   CONTINUED = 0
   ALIGNMENT = 4
   TEXT_WRAP = 4
   MIN_WIDOWS = 1
   MIN_ORPHAN = 1
   MAX_LINES = -1
   MASK = <<"fmDay, Month DD RRRR">>
   NULL_VALUE = NULLP
   SPACING = 0
   BIDI_DIR = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 179
   FRAME_ID = 191
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 196
   NAME = <<"F_POINT_NAME">>
   TAG = 615
   DISP_ORDER = 8
   FORMATFLAG = 536871940
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 110
   Y = 4900
   WD = 9162
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 129
   CONTINUED = 0
   ALIGNMENT = 4
   TEXT_WRAP = 4
   MIN_WIDOWS = 1
   MIN_ORPHAN = 1
   MAX_LINES = -1
   MASK = NULLP
   NULL_VALUE = NULLP
   SPACING = 0
   BIDI_DIR = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 180
   FRAME_ID = 191
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 198
   NAME = <<"F_MEM_NAME">>
   TAG = 512
   DISP_ORDER = 9
   FORMATFLAG = 536871940
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 110
   Y = 13987
   WD = 18636
   HT = 1937
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 479
   CONTINUED = 0
   ALIGNMENT = 4
   TEXT_WRAP = 4
   MIN_WIDOWS = 1
   MIN_ORPHAN = 1
   MAX_LINES = -1
   MASK = NULLP
   NULL_VALUE = NULLP
   SPACING = 0
   BIDI_DIR = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 180
   FRAME_ID = 191
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 200
   NAME = <<"F_ROOM_NO">>
   TAG = 569
   DISP_ORDER = 10
   FORMATFLAG = 536871940
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 13627
   Y = 11537
   WD = 5119
   HT = 2167
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 141
   CONTINUED = 0
   ALIGNMENT = 4
   TEXT_WRAP = 4
   MIN_WIDOWS = 1
   MIN_ORPHAN = 1
   MAX_LINES = -1
   MASK = NULLP
   NULL_VALUE = NULLP
   SPACING = 0
   BIDI_DIR = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 181
   FRAME_ID = 191
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 202
   NAME = <<"F_SERV_Q">>
   TAG = 504
   DISP_ORDER = 11
   FORMATFLAG = 536871940
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 7682
   Y = 24144
   WD = 10459
   HT = 2289
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 144
   CONTINUED = 0
   ALIGNMENT = 68
   TEXT_WRAP = 4
   MIN_WIDOWS = 1
   MIN_ORPHAN = 1
   MAX_LINES = -1
   MASK = <<"NNNGNN0D00">>
   NULL_VALUE = NULLP
   SPACING = 0
   BIDI_DIR = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 181
   FRAME_ID = 191
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 204
   NAME = <<"F_DISC_Q">>
   TAG = 504
   DISP_ORDER = 12
   FORMATFLAG = 536871940
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 7680
   Y = 26931
   WD = 10461
   HT = 2289
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 147
   CONTINUED = 0
   ALIGNMENT = 68
   TEXT_WRAP = 4
   MIN_WIDOWS = 1
   MIN_ORPHAN = 1
   MAX_LINES = -1
   MASK = <<"NNNGNN0D00">>
   NULL_VALUE = NULLP
   SPACING = 0
   BIDI_DIR = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 181
   FRAME_ID = 191
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 206
   NAME = <<"F_INV_TOT">>
   TAG = 617
   DISP_ORDER = 13
   FORMATFLAG = 536871940
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 7681
   Y = 29381
   WD = 10460
   HT = 2249
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 138
   CONTINUED = 0
   ALIGNMENT = 68
   TEXT_WRAP = 4
   MIN_WIDOWS = 1
   MIN_ORPHAN = 1
   MAX_LINES = -1
   MASK = <<"NNNGNN0D00">>
   NULL_VALUE = NULLP
   SPACING = 0
   BIDI_DIR = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 181
   FRAME_ID = 191
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 208
   NAME = <<"F_TABLE_NO">>
   TAG = 569
   DISP_ORDER = 14
   FORMATFLAG = 536871940
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 13627
   Y = 8996
   WD = 5119
   HT = 2292
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 150
   CONTINUED = 0
   ALIGNMENT = 4
   TEXT_WRAP = 4
   MIN_WIDOWS = 1
   MIN_ORPHAN = 1
   MAX_LINES = -1
   MASK = NULLP
   NULL_VALUE = NULLP
   SPACING = 0
   BIDI_DIR = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 181
   FRAME_ID = 191
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 210
   NAME = <<"F_SumI_QPerSERIAL_NO">>
   TAG = 542
   DISP_ORDER = 15
   FORMATFLAG = 805306628
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 13102
   Y = 19758
   WD = 6048
   HT = 2330
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 154
   CONTINUED = 0
   ALIGNMENT = 68
   TEXT_WRAP = 4
   MIN_WIDOWS = 1
   MIN_ORPHAN = 1
   MAX_LINES = -1
   MASK = <<"NNNNN0D00">>
   NULL_VALUE = NULLP
   SPACING = 0
   BIDI_DIR = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 184
   FRAME_ID = 224
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 214
   NAME = <<"F_I_NAME">>
   TAG = 391
   DISP_ORDER = 16
   FORMATFLAG = 805306628
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 15
   Y = 18193
   WD = 8653
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 108
   CONTINUED = 0
   ALIGNMENT = 4
   TEXT_WRAP = 4
   MIN_WIDOWS = 1
   MIN_ORPHAN = 1
   MAX_LINES = -1
   MASK = NULLP
   NULL_VALUE = NULLP
   SPACING = 0
   BIDI_DIR = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 180
   FRAME_ID = 213
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 216
   NAME = <<"F_QTY">>
   TAG = 391
   DISP_ORDER = 18
   FORMATFLAG = 805306628
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 8729
   Y = 18193
   WD = 1761
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 114
   CONTINUED = 0
   ALIGNMENT = 68
   TEXT_WRAP = 4
   MIN_WIDOWS = 1
   MIN_ORPHAN = 1
   MAX_LINES = -1
   MASK = NULLP
   NULL_VALUE = NULLP
   SPACING = 0
   BIDI_DIR = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 181
   FRAME_ID = 213
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 218
   NAME = <<"F_PRICE">>
   TAG = 541
   DISP_ORDER = 20
   FORMATFLAG = 805306628
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 10482
   Y = 18193
   WD = 3435
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 117
   CONTINUED = 0
   ALIGNMENT = 68
   TEXT_WRAP = 4
   MIN_WIDOWS = 1
   MIN_ORPHAN = 1
   MAX_LINES = -1
   MASK = <<"NNN0D00">>
   NULL_VALUE = NULLP
   SPACING = 0
   BIDI_DIR = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 181
   FRAME_ID = 213
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 220
   NAME = <<"F_I_Q">>
   TAG = 541
   DISP_ORDER = 22
   FORMATFLAG = 805306628
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 13909
   Y = 18193
   WD = 5241
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 120
   CONTINUED = 0
   ALIGNMENT = 68
   TEXT_WRAP = 4
   MIN_WIDOWS = 1
   MIN_ORPHAN = 1
   MAX_LINES = -1
   MASK = <<"NNN0D00">>
   NULL_VALUE = NULLP
   SPACING = 0
   BIDI_DIR = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 181
   FRAME_ID = 213
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 259
   NAME = <<"F_ROOM_NO1">>
   TAG = 569
   DISP_ORDER = 27
   FORMATFLAG = 536871940
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 4756
   Y = 11537
   WD = 4096
   HT = 2167
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 135
   CONTINUED = 0
   ALIGNMENT = 4
   TEXT_WRAP = 4
   MIN_WIDOWS = 1
   MIN_ORPHAN = 0
   MAX_LINES = -1
   MASK = NULLP
   NULL_VALUE = NULLP
   SPACING = 0
   BIDI_DIR = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 0
   FRAME_ID = 0
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 562
   NAME = <<"F_1">>
   TAG = 569
   DISP_ORDER = 36
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 13304
   Y = 4838
   WD = 6651
   HT = 1612
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 561
   CONTINUED = 0
   ALIGNMENT = 4
   TEXT_WRAP = 1
   MIN_WIDOWS = 1
   MIN_ORPHAN = 0
   MAX_LINES = -1
   MASK = NULLP
   NULL_VALUE = NULLP
   SPACING = 0
   BIDI_DIR = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 0
   FRAME_ID = 0
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  TOOL_PLSQL
BEGIN
   ITEMID = 476
   NAME = <<"i_tformula">>
   PLSLFID_EP = (BLONG) NULLP
   OBJECT_ID = 475
   TYPE = 4
   PLSLFID_ST = (TLONG)
<<"function i_tFormula return Char is
t varchar2(10);
begin
  if :inv_typ = 1 then
  	 t := 'ãÔÊÑß';
  elsif :inv_typ = 2 then
  	 t := 'ãÏäì';
  elsif :inv_typ = 3 then
  	 t := 'ãÏíÑ';	 
  elsif :inv_typ = 3 then
  	 t := 'äÒíá';
  elsif :inv_typ = 3 then
  	 t := 'ÚÇãá';	 
  end if;	 
  return t;
end;">>
   STATE = 0
END

DEFINE  TOOL_PLSQL
BEGIN
   ITEMID = 480
   NAME = <<"m_mformula">>
   PLSLFID_EP = (BLONG) NULLP
   OBJECT_ID = 479
   TYPE = 4
   PLSLFID_ST = (TLONG)
<<"function m_mFormula return Char is
t varchar2(100);
begin
  if :inv_typ = 3 and :mem_name is null then
  	 select EMP_NAME into t from emp_tbl where
  	     emp_id = :emp_code;
  elsif :inv_typ = 4 and :h_no is not null then
  	 select h_NAME into t from hagz_tbl where
  	     h_no = :h_no;
  else
  	t := :mem_name;
  end if;
  return t;
  
  exception
  	when no_data_found then return null;
end;">>
   STATE = 0
END

DEFINE  SRW2_QUERY
BEGIN
   ITEMID = 103
   NAME = <<"Q_1">>
   TAG = 0
   DISP_ORDER = 0
   QUERYLFID = (TLONG)
<<"SELECT ALL ITEM_TBL.I_NAME, INV_DTL.I_CODE, INV_DTL.QTY, INV_DTL.PRICE, INV_DTL.I_Q, INVOICE.SERIAL_NO, INVOICE.INV_DATE, POINT_TBL.POINT_NAME, 
MEM_VIEW.MEM_NAME, MEM_VIEW.MEM_ID, INVOICE.INV_TOT, INVOICE.ROOM_NO, 
INVOICE.SERV_Q, INVOICE.DISC_Q, INVOICE.TABLE_NO, INVOICE.SER_NO, INVOICE.INV_TYP, 
INVOICE.EMP_CODE, INVOICE.H_NO, INVOICE.EMP_ID
FROM INVOICE, INV_DTL, ITEM_TBL, POINT_TBL, mahrmemb.MEM_VIEW
WHERE (INVOICE.POINT_CODE = :pt_code
 AND INVOICE.INV_DATE = :inv_dt
 AND INVOICE.SERIAL_NO = :ser_no)
 AND ((INV_DTL.SHIFT_TYP = INVOICE.SHIFT_TYP)
 AND (INV_DTL.EMP_ID = INVOICE.EMP_ID)
 AND (INV_DTL.INV_DATE = INVOICE.INV_DATE)
 AND (INV_DTL.POINT_CODE = INVOICE.POINT_CODE)
 AND (INV_DTL.SERIAL_NO = INVOICE.SERIAL_NO)
 AND (INV_DTL.I_CODE = ITEM_TBL.I_CODE)
 AND (INVOICE.POINT_CODE = POINT_TBL.POINT_CODE)
 AND (INVOICE.MEM_SERIAL = MEM_VIEW.MEM_SERIAL(+))) ">>
   NET_LOGON = NULLP
   EXT_QUERY = NULLP
   TEMP_TABLE = NULLP
   TEMP_FLAGS = 0
   EXEC_FREQ = 0
   MAX_ROWS = 0
   X = 20685
   Y = 2816
   WD = 5734
   HT = 1638
   PERS_FLAGS = 0
   DSTYPE = 0
   PLUGINXML = NULLP
   PLUGINCLZ = NULLP
   MAJORVER = 0
   MINORVER = 0
   SIGNONPRM = 0
   PLUGINXMLID = (TLONG) NULLP
END

DEFINE  SRW2_BOILERPLATE
BEGIN
   ITEMID = 215
   NAME = <<"B_I_NAME">>
   TAG = 605
   DISP_ORDER = 17
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 15
   Y = 16035
   WD = 8653
   HT = 1906
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
0000000f 00003ea3 000021cd 00000772 
">>
   GRAPH_TYPE = 0
   GRAPH_LFID = (BLONG) NULLP
   GRAPH_LEN = 0
   CLOSE = 0
   MIN_WIDOWS = 1
   MIN_ORPHAN = 1
   MAX_LINES = -1
   TEXT_WRAP = 4
   ALIGNMENT = 68
   ARCFILL = 0
   ARROWSTYLE = 0
   ROTANGLE = 0
   SPACING = 0
   LINKEDFILE = NULLP
   POINTSLFID = (BLONG) NULLP
   OLE_LFID = (BLONG) NULLP
   OLE_LEN = 0
   BIDI_DIR = 0
   ASSOCOBJ = 214
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 171
   FRAME_ID = 212
   ALTXT = NULLP
   HEADERS = NULLP
   LABFIELD = 0
   ACCKEY = NULLP
END

DEFINE  SRW2_BOILERPLATE
BEGIN
   ITEMID = 217
   NAME = <<"B_QTY">>
   TAG = 605
   DISP_ORDER = 19
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 8720
   Y = 16035
   WD = 1973
   HT = 1906
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00002210 00003ea3 000007b5 00000772 
">>
   GRAPH_TYPE = 0
   GRAPH_LFID = (BLONG) NULLP
   GRAPH_LEN = 0
   CLOSE = 0
   MIN_WIDOWS = 1
   MIN_ORPHAN = 1
   MAX_LINES = -1
   TEXT_WRAP = 4
   ALIGNMENT = 68
   ARCFILL = 0
   ARROWSTYLE = 0
   ROTANGLE = 0
   SPACING = 0
   LINKEDFILE = NULLP
   POINTSLFID = (BLONG) NULLP
   OLE_LFID = (BLONG) NULLP
   OLE_LEN = 0
   BIDI_DIR = 0
   ASSOCOBJ = 216
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 172
   FRAME_ID = 212
   ALTXT = NULLP
   HEADERS = NULLP
   LABFIELD = 0
   ACCKEY = NULLP
END

DEFINE  SRW2_BOILERPLATE
BEGIN
   ITEMID = 219
   NAME = <<"B_PRICE">>
   TAG = 605
   DISP_ORDER = 21
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 10683
   Y = 16035
   WD = 3226
   HT = 1906
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
000029bb 00003ea3 00000c9a 00000772 
">>
   GRAPH_TYPE = 0
   GRAPH_LFID = (BLONG) NULLP
   GRAPH_LEN = 0
   CLOSE = 0
   MIN_WIDOWS = 1
   MIN_ORPHAN = 1
   MAX_LINES = -1
   TEXT_WRAP = 4
   ALIGNMENT = 68
   ARCFILL = 0
   ARROWSTYLE = 0
   ROTANGLE = 0
   SPACING = 0
   LINKEDFILE = NULLP
   POINTSLFID = (BLONG) NULLP
   OLE_LFID = (BLONG) NULLP
   OLE_LEN = 0
   BIDI_DIR = 0
   ASSOCOBJ = 218
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 172
   FRAME_ID = 212
   ALTXT = NULLP
   HEADERS = NULLP
   LABFIELD = 0
   ACCKEY = NULLP
END

DEFINE  SRW2_BOILERPLATE
BEGIN
   ITEMID = 221
   NAME = <<"B_I_Q">>
   TAG = 605
   DISP_ORDER = 23
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 13909
   Y = 16035
   WD = 5246
   HT = 1906
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00003655 00003ea3 0000147e 00000772 
">>
   GRAPH_TYPE = 0
   GRAPH_LFID = (BLONG) NULLP
   GRAPH_LEN = 0
   CLOSE = 0
   MIN_WIDOWS = 1
   MIN_ORPHAN = 1
   MAX_LINES = -1
   TEXT_WRAP = 4
   ALIGNMENT = 68
   ARCFILL = 0
   ARROWSTYLE = 0
   ROTANGLE = 0
   SPACING = 0
   LINKEDFILE = NULLP
   POINTSLFID = (BLONG) NULLP
   OLE_LFID = (BLONG) NULLP
   OLE_LEN = 0
   BIDI_DIR = 0
   ASSOCOBJ = 220
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 172
   FRAME_ID = 212
   ALTXT = NULLP
   HEADERS = NULLP
   LABFIELD = 0
   ACCKEY = NULLP
END

DEFINE  SRW2_BOILERPLATE
BEGIN
   ITEMID = 223
   NAME = <<"B_Total">>
   TAG = 226
   DISP_ORDER = 24
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 9332
   Y = 20150
   WD = 3545
   HT = 1825
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00002474 00004eb6 00000dd9 00000721 
">>
   GRAPH_TYPE = 0
   GRAPH_LFID = (BLONG) NULLP
   GRAPH_LEN = 0
   CLOSE = 0
   MIN_WIDOWS = 1
   MIN_ORPHAN = 1
   MAX_LINES = -1
   TEXT_WRAP = 4
   ALIGNMENT = 4
   ARCFILL = 0
   ARROWSTYLE = 0
   ROTANGLE = 0
   SPACING = 0
   LINKEDFILE = NULLP
   POINTSLFID = (BLONG) NULLP
   OLE_LFID = (BLONG) NULLP
   OLE_LEN = 0
   BIDI_DIR = 0
   ASSOCOBJ = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 175
   FRAME_ID = 222
   ALTXT = NULLP
   HEADERS = NULLP
   LABFIELD = 0
   ACCKEY = NULLP
END

DEFINE  SRW2_BOILERPLATE
BEGIN
   ITEMID = 257
   NAME = <<"B_3">>
   TAG = 226
   DISP_ORDER = 25
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 391
   Y = 9398
   WD = 4447
   HT = 1365
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00000187 000024b6 0000115f 00000555 
">>
   GRAPH_TYPE = 0
   GRAPH_LFID = (BLONG) NULLP
   GRAPH_LEN = 0
   CLOSE = 0
   MIN_WIDOWS = 1
   MIN_ORPHAN = 0
   MAX_LINES = -1
   TEXT_WRAP = 1
   ALIGNMENT = 4
   ARCFILL = 0
   ARROWSTYLE = 0
   ROTANGLE = 0
   SPACING = 0
   LINKEDFILE = NULLP
   POINTSLFID = (BLONG) NULLP
   OLE_LFID = (BLONG) NULLP
   OLE_LEN = 0
   BIDI_DIR = 0
   ASSOCOBJ = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 0
   FRAME_ID = 0
   ALTXT = NULLP
   HEADERS = NULLP
   LABFIELD = 0
   ACCKEY = NULLP
END

DEFINE  SRW2_BOILERPLATE
BEGIN
   ITEMID = 258
   NAME = <<"B_4">>
   TAG = 226
   DISP_ORDER = 26
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 9262
   Y = 9398
   WD = 3842
   HT = 1485
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
0000242e 000024b6 00000f02 000005cd 
">>
   GRAPH_TYPE = 0
   GRAPH_LFID = (BLONG) NULLP
   GRAPH_LEN = 0
   CLOSE = 0
   MIN_WIDOWS = 1
   MIN_ORPHAN = 0
   MAX_LINES = -1
   TEXT_WRAP = 1
   ALIGNMENT = 4
   ARCFILL = 0
   ARROWSTYLE = 0
   ROTANGLE = 0
   SPACING = 0
   LINKEDFILE = NULLP
   POINTSLFID = (BLONG) NULLP
   OLE_LFID = (BLONG) NULLP
   OLE_LEN = 0
   BIDI_DIR = 0
   ASSOCOBJ = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 0
   FRAME_ID = 0
   ALTXT = NULLP
   HEADERS = NULLP
   LABFIELD = 0
   ACCKEY = NULLP
END

DEFINE  SRW2_BOILERPLATE
BEGIN
   ITEMID = 261
   NAME = <<"B_5">>
   TAG = 226
   DISP_ORDER = 28
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 392
   Y = 11939
   WD = 4244
   HT = 1365
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00000188 00002ea3 00001094 00000555 
">>
   GRAPH_TYPE = 0
   GRAPH_LFID = (BLONG) NULLP
   GRAPH_LEN = 0
   CLOSE = 0
   MIN_WIDOWS = 1
   MIN_ORPHAN = 0
   MAX_LINES = -1
   TEXT_WRAP = 1
   ALIGNMENT = 4
   ARCFILL = 0
   ARROWSTYLE = 0
   ROTANGLE = 0
   SPACING = 0
   LINKEDFILE = NULLP
   POINTSLFID = (BLONG) NULLP
   OLE_LFID = (BLONG) NULLP
   OLE_LEN = 0
   BIDI_DIR = 0
   ASSOCOBJ = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 0
   FRAME_ID = 0
   ALTXT = NULLP
   HEADERS = NULLP
   LABFIELD = 0
   ACCKEY = NULLP
END

DEFINE  SRW2_BOILERPLATE
BEGIN
   ITEMID = 267
   NAME = <<"B_6">>
   TAG = 226
   DISP_ORDER = 29
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 402
   Y = 23943
   WD = 6653
   HT = 3464
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00000192 00005d87 000019fd 00000d88 
">>
   GRAPH_TYPE = 0
   GRAPH_LFID = (BLONG) NULLP
   GRAPH_LEN = 0
   CLOSE = 0
   MIN_WIDOWS = 1
   MIN_ORPHAN = 0
   MAX_LINES = -1
   TEXT_WRAP = 1
   ALIGNMENT = 68
   ARCFILL = 0
   ARROWSTYLE = 0
   ROTANGLE = 0
   SPACING = 0
   LINKEDFILE = NULLP
   POINTSLFID = (BLONG) NULLP
   OLE_LFID = (BLONG) NULLP
   OLE_LEN = 0
   BIDI_DIR = 0
   ASSOCOBJ = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 0
   FRAME_ID = 0
   ALTXT = NULLP
   HEADERS = NULLP
   LABFIELD = 0
   ACCKEY = NULLP
END

DEFINE  SRW2_BOILERPLATE
BEGIN
   ITEMID = 268
   NAME = <<"B_7">>
   TAG = 226
   DISP_ORDER = 30
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 1812
   Y = 27333
   WD = 4931
   HT = 2034
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00000714 00006ac5 00001343 000007f2 
">>
   GRAPH_TYPE = 0
   GRAPH_LFID = (BLONG) NULLP
   GRAPH_LEN = 0
   CLOSE = 0
   MIN_WIDOWS = 1
   MIN_ORPHAN = 0
   MAX_LINES = -1
   TEXT_WRAP = 1
   ALIGNMENT = 68
   ARCFILL = 0
   ARROWSTYLE = 0
   ROTANGLE = 0
   SPACING = 0
   LINKEDFILE = NULLP
   POINTSLFID = (BLONG) NULLP
   OLE_LFID = (BLONG) NULLP
   OLE_LEN = 0
   BIDI_DIR = 0
   ASSOCOBJ = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 0
   FRAME_ID = 0
   ALTXT = NULLP
   HEADERS = NULLP
   LABFIELD = 0
   ACCKEY = NULLP
END

DEFINE  SRW2_BOILERPLATE
BEGIN
   ITEMID = 269
   NAME = <<"B_8">>
   TAG = 226
   DISP_ORDER = 31
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 1163
   Y = 29582
   WD = 6091
   HT = 2048
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
0000048b 0000738e 000017cb 00000800 
">>
   GRAPH_TYPE = 0
   GRAPH_LFID = (BLONG) NULLP
   GRAPH_LEN = 0
   CLOSE = 0
   MIN_WIDOWS = 1
   MIN_ORPHAN = 0
   MAX_LINES = -1
   TEXT_WRAP = 1
   ALIGNMENT = 68
   ARCFILL = 0
   ARROWSTYLE = 0
   ROTANGLE = 0
   SPACING = 0
   LINKEDFILE = NULLP
   POINTSLFID = (BLONG) NULLP
   OLE_LFID = (BLONG) NULLP
   OLE_LEN = 0
   BIDI_DIR = 0
   ASSOCOBJ = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 0
   FRAME_ID = 0
   ALTXT = NULLP
   HEADERS = NULLP
   LABFIELD = 0
   ACCKEY = NULLP
END

DEFINE  SRW2_BOILERPLATE
BEGIN
   ITEMID = 312
   NAME = <<"B_12">>
   TAG = 226
   DISP_ORDER = 32
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 9383
   Y = 11738
   WD = 3921
   HT = 1365
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
000024a7 00002dda 00000f51 00000555 
">>
   GRAPH_TYPE = 0
   GRAPH_LFID = (BLONG) NULLP
   GRAPH_LEN = 0
   CLOSE = 0
   MIN_WIDOWS = 1
   MIN_ORPHAN = 0
   MAX_LINES = -1
   TEXT_WRAP = 1
   ALIGNMENT = 4
   ARCFILL = 0
   ARROWSTYLE = 0
   ROTANGLE = 0
   SPACING = 0
   LINKEDFILE = NULLP
   POINTSLFID = (BLONG) NULLP
   OLE_LFID = (BLONG) NULLP
   OLE_LEN = 0
   BIDI_DIR = 0
   ASSOCOBJ = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 0
   FRAME_ID = 0
   ALTXT = NULLP
   HEADERS = NULLP
   LABFIELD = 0
   ACCKEY = NULLP
END

DEFINE  SRW2_BOILERPLATE
BEGIN
   ITEMID = 425
   NAME = <<"B_1">>
   TAG = 226
   DISP_ORDER = 34
   FORMATFLAG = 805306627
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 5192
   Y = 311
   WD = 14336
   HT = 1365
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00001448 00000137 00003800 00000555 
">>
   GRAPH_TYPE = 0
   GRAPH_LFID = (BLONG) NULLP
   GRAPH_LEN = 0
   CLOSE = 0
   MIN_WIDOWS = 1
   MIN_ORPHAN = 0
   MAX_LINES = -1
   TEXT_WRAP = 1
   ALIGNMENT = 4
   ARCFILL = 0
   ARROWSTYLE = 0
   ROTANGLE = 0
   SPACING = 0
   LINKEDFILE = NULLP
   POINTSLFID = (BLONG) NULLP
   OLE_LFID = (BLONG) NULLP
   OLE_LEN = 0
   BIDI_DIR = 0
   ASSOCOBJ = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 0
   FRAME_ID = 0
   ALTXT = NULLP
   HEADERS = NULLP
   LABFIELD = 0
   ACCKEY = NULLP
END

DEFINE  SRW2_BOILERPLATE
BEGIN
   ITEMID = 426
   NAME = <<"B_2">>
   TAG = 226
   DISP_ORDER = 33
   FORMATFLAG = 805306627
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 3830
   Y = 1445
   WD = 15723
   HT = 2184
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00000ef6 000005a5 00003d6b 00000888 
">>
   GRAPH_TYPE = 0
   GRAPH_LFID = (BLONG) NULLP
   GRAPH_LEN = 0
   CLOSE = 0
   MIN_WIDOWS = 1
   MIN_ORPHAN = 0
   MAX_LINES = -1
   TEXT_WRAP = 1
   ALIGNMENT = 68
   ARCFILL = 0
   ARROWSTYLE = 0
   ROTANGLE = 0
   SPACING = 0
   LINKEDFILE = NULLP
   POINTSLFID = (BLONG) NULLP
   OLE_LFID = (BLONG) NULLP
   OLE_LEN = 0
   BIDI_DIR = 0
   ASSOCOBJ = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 0
   FRAME_ID = 0
   ALTXT = NULLP
   HEADERS = NULLP
   LABFIELD = 0
   ACCKEY = NULLP
END

DEFINE  SRW2_BOILERPLATE
BEGIN
   ITEMID = 454
   NAME = <<"B_13">>
   TAG = 456
   DISP_ORDER = 35
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 13
   Y = 0
   WD = 3213
   HT = 4031
   PAGE = 0
   TYPE = 51
   NUM_POINTS = 32
   POINTS = (BINARY)
<<"
00000000 00000000 00000c8d 00000fbf 0000000d 00000000 00000c8d 00000fbf 
">>
   GRAPH_TYPE = 0
   GRAPH_LFID = (BLONG)
<<"
ffd8ffe0 00104a46 49460001 01010060 00600000 ffdb0084 00100b0c 0e0c0a10
0e0d0e12 11101318 281a1816 16183123 251d283a 333d3c39 33383740 485c4e40
44574537 38506d51 575f6267 68673e4d 71797064 785c6567 63011112 12181518
2f1a1a2f 63423842 63636363 63636363 63636363 63636363 63636363 63636363
63636363 63636363 63636363 63636363 63636363 63636363 6363ffc4 01a20000
01050101 01010101 00000000 00000000 01020304 05060708 090a0b10 00020103
03020403 05050404 0000017d 01020300 04110512 21314106 13516107 22711432
8191a108 2342b1c1 1552d1f0 24336272 82090a16 1718191a 25262728 292a3435
36373839 3a434445 46474849 4a535455 56575859 5a636465 66676869 6a737475
76777879 7a838485 86878889 8a929394 95969798 999aa2a3 a4a5a6a7 a8a9aab2
b3b4b5b6 b7b8b9ba c2c3c4c5 c6c7c8c9 cad2d3d4 d5d6d7d8 d9dae1e2 e3e4e5e6
e7e8e9ea f1f2f3f4 f5f6f7f8 f9fa0100 03010101 01010101 01010000 00000000
01020304 05060708 090a0b11 00020102 04040304 07050404 00010277 00010203
11040521 31061241 51076171 13223281 08144291 a1b1c109 233352f0 156272d1
0a162434 e125f117 18191a26 2728292a 35363738 393a4344 45464748 494a5354
55565758 595a6364 65666768 696a7374 75767778 797a8283 84858687 88898a92
93949596 9798999a a2a3a4a5 a6a7a8a9 aab2b3b4 b5b6b7b8 b9bac2c3 c4c5c6c7
c8c9cad2 d3d4d5d6 d7d8d9da e2e3e4e5 e6e7e8e9 eaf2f3f4 f5f6f7f8 f9faffc0
00110800 f100b203 00110001 11010211 01ffda00 0c030000 01110211 003f00ee
a800a002 800a0028 00a00280 0a002800 a002800a 002800a0 02800a00 2800a002
800a0028 00a005a0 04a00280 0a002800 a002800a 002800a0 02800a00 2800a002
800a0028 00a00280 0a002800 a0028016 8012800a 002800a0 02800a00 2800a002
800a0028 00a00280 0a002800 a002800a 002800a0 02800a00 5a004a00 2800a002
800a0028 00a00a77 77b6fa74 686e5c22 b7c82802 e5007352 f88d62f1 345a594f
97eee7f9 5006fc92 a5bdbf98 df2a20a0 0caf0f6b b0eb51cb e5a6cf2f 8fc3b500
6dd00140 05001400 50014005 00140050 01400b40 09400500 14005001 40050072
7ac5e6ab a15d7db3 3f6ad3ff 00b98c79 7401435d d423f11f 8707d8bf d643fbc9
63feed00 5ff046a8 92e85e5c 9c7d93f9 50079e7d b27fb77d b33fbece fcd0076b
e35d4da6 d174f017 68ba1e6f 5f6e9fad 0057f0bc ff00f08f e993dedd f1f6855f
257fbd40 0ade21d4 bc432456 7a5c66db d769ff00 38a00ebf 46d3ce9d 69e5198c
afd4bfad 00695001 40050014 00500140 05001400 b4009400 50014005 00140050
033cb468 fcb6c631 8c500791 eab65268 1ac617b7 cd11a00e 96db53d3 a5d3350b
9631dbbd cc3b2451 ebec3f1a 00f3fa00 eaa4d6ac 2e3fb296 58a52961 174fef9e
3fc28031 350d426d 4ee7ceb8 3cd007a3 f82b4c16 1a3a4bff 002d2e40 63401d25
00140050 01400500 14005001 4005002d 00250014 00500140 05001400 50071df1
06c44ba6 25d6cfde 47c67da8 03cda800 a002802f e8f109b5 5b589ba3 482803da
e800a002 800a0028 00a00280 0a002800 a005a004 a002800a 00e7bc4d af7f62db
26c4cccf f77d2803 274af13e a3a8d85e 6c8e16b8 880d9181 da8019a7 78fa23c6
a106dff7 2803b4b7 9629e157 859593b1 14015f53 8bccd26e 62f58b1f a50070da
5e87a77d 93ccbe6f f77cd7f2 c37e7cfe 94015ed9 f4c483e6 934bddef 6f335004
f6da769f a8cd201e 43f3c0b4 63137fdf 2f4017bc 35e1dfb2 eb66e0b7 cb17f077
a00eea80 390f1078 c23d3ffd 1ed3f793 8ebfdd14 0156fb5b d4e3f0b4 57fbbca9
a59bb0ed 8a004f09 6b5acea3 aa6c94f9 96ff00f2 d381f2d0 07754005 00140050
01400500 2d002500 14005006 76aba543 ab5a7d9e 7e83a15a 00f3cfb4 cde18d43
6fd820f3 87f1364d 00529b5a b8b87dd7 2b6f2b7f b510a00e 9fc27e22 b05db65e
41b6cfdd f9c90680 3b2b984c 968d0ab7 9595c6e1 da803c62 f639e2ba 64ba07cd
1d6802a5 001401e8 fe01fb6c b6dbae3f e3dd176c 5c5006a7 89f56b6d 2ac364d1
79de7fcb e57b77a0 0e0135d9 a1e2ce2b 7b6f5dab d7f3a00b 11ebdac6 a52c56ed
b2f3d223 0263f950 07a0689a 3dbe950f ee630b2b 01be8035 a800a002 800a0028
00a005a0 04a00280 0a002802 8dee9b69 a847b2ee 056f4f6a 00e62f7c 016c7fe3
ce678dbf daf9a802 847e06d5 6de75920 b8838e8d 401d45b7 886ddefb ec33452d
a49dbcf1 b73f4a00 5d5fc396 5ac7cf2e e1201d56 80389d43 c217563e 4e658dbc
e9444940 1afa5780 547cda93 7e086803 abb9bab6 d26c77be 238e25f9 47f4a00e
4efb4fd5 7c59b2e9 7cb82dbf e5924879 a0092d7e 1ec2926e b9bbf307 a05c5007
4da7e8d6 1a67fc7a db6dff00 6a803468 00a00280 0a002800 a0028016 8012800a
002800a0 02800a00 28033752 d2a1d4a0 c37cb22f faa71d52 8022d06e 2e27b3d9
79febe16 f2e4a00a fe29ff00 9837fd84 a1a00dfa 00e693fe 277ae77f b2696dc7
a3bfff00 5a803a5a 002800a0 02800a00 2800a002 800a0028 01680128 00a00280
0a00612b 1c796f95 450070da c78ecffa bd2d7db7 b0a00a10 78ef534d be6a4522
f1c62803 b8d1b57b 5d62df7d ae78eaad da802bc5 c78ba455 030d6a0b 7e74011f
8a7fe60d ff006128 68037e80 399f0263 fe11a4db d7273400 788bc511 68dfb888
79973e9f dda00e4c 78b3c40d 16564f96 3fbcde58 a00d6f0f f8d8ee58 354c7a09
a803bca0 02800a00 2800a002 800a005a 004a0028 00a00280 389f88b7 263b0b6b
61fc7f35 0041f0f7 4fb69565 bb7dad2a 7407f868 03b1bad3 ed2f536d d5ba483b
71401e69 e089bcaf 11c1e8ff 002d0076 dff3503f ee19ff00 b3d004be 228b7dad
96deb1dd 4447b500 6e500737 e0763fd8 1b1c7319 db401c4c c3ed3e35 f2e7e86f
367fe3d8 a00f508a c6d6183c 88eda211 1eaa138f ca80384f 1fd85b59 c964d6f1
88f7a9e1 471401da 681b9b43 b2dfd7c9 5cfe5401 a3400500 14005001 4005002d
00250014 00500140 18de21d1 bfb634cf b3e76b29 dcb401e7 911d57c2 f7cacca6
33e87a35 005abaf1 6eada946 9047884f adbe467f 5a0083c2 d2c3a778 823fb67c
9b78fa1a 00ea3c4b aedae93a 866de10d a8796177 7651e940 1764be96 fbc34b73
f67f25bc d8b62ffc 0968021f 1578925d 18c515b4 1ef93d28 02a685e2 dd3934dd
8f1fd9bc bfe14eff 004a00e3 ef9ffb5b 5891ad60 ff0059f7 5528035a dbc67ab5
841f672b 1c9b78cc c0e68022 b2d3751f 13ea1e74 fbc237fc b4c70280 3d2b4eb6
fb169f6f 6dff003c a354fc85 005aa002 800a0028 00a00280 16801280 0a002800
a0028021 9608e787 cb78c143 fc245003 6dad6ded 23d96f0c 7127fb0b b680382f
1aeaba5d eed8edd3 cc997fe5 b0fe5401 ca58ce96 d7492491 09547f01 a00f49fe
d4b4d774 831c5f3c b842d07e 5400ef17 5f58c1a6 35bdced3 295fddad 00795500
77de04d4 b4c8f6db 18bcbbc3 c6ff00ef 500771b1 3e5e3eef 4a009280 0a002800
a002800a 002800a0 05a004a0 02800a00 2800a002 800a00e5 ff00e10c d3bfb43e
d1d13af9 3da800d7 edec755b f834d987 973b2652 6e3f2a00 f3d8e59f 4abcff00
469be61d e3a00079 fab6a2bb 9b32ce71 9a00f47d 034fd2ec fced3a35 f3278957
ce62bebd a8019a67 846cec75 3fb5f5ee 89e9401d 35001400 50014005 00140050
01400500 2d002500 14005005 4befb48b 23f6058d ae3f8777 4a00e1df c79a827c
9f638d31 d8d00745 e14d5ae7 59b079ee 420c1c70 b401d0d0 057b8962 b3b6f3e6
6d91a0e6 803ccfc4 7e259f55 631c2592 cf8f9680 31b4fb09 750ba582 05e68019
77693595 c18271b5 c500741a 178bae74 ddb05c7e fad4718f 4a00f48b 49a2bab6
49addb7c 64714016 280317c4 d7f71a66 97f69b44 46dbf7b3 e9401cb5 8f8e7539
ae122fb3 40f9e368 e2803bdb 6dff0067 8fccfbdb 79db4013 50014005 00140050
02d00250 01400500 656bba9a 68fa619f f8beea0c 50079dda 69fa878a 24b8b90e
bbd40ce7 bd00777e 10d35f4b d1bcb946 d91b9a00 bbaa6ad6 da3db79b 707e8b40
1e5bab6b d7babe3e d0df28fe 1140142d 6da4bb99 618172e6 803b86f0 da697e15
bb3226fb cd9dbf0a 00d9d474 3b3d634c 4ff47f26 6f2ff75d b6fb5007 99df594d
a7dcf917 030c2802 ce97aedf 693ff1ed 2fc9fdda 00f47f0e 78820d6a df1f7675
5f997fc2 802d6b9a 7ff69690 f6a8db37 e280385f 11786ffb 062b7bab 79ff00fd
7401d7f8 5b571abe 96b9ff00 5d1fcb27 f8d006f5 00140050 01400500 2d002500
14005007 97f8fdb3 e20dbff3 ce351400 7857c4bf d8a1a199 0bc47d3b 5006cdcf
8f6d7ecf fe8b1ca2 5edb80a0 0e1aeaf2 7bc7df73 2173400b 636af7b7 31dbc5d5
b8a00eef 47b0ff00 847352d3 edbe5965 bdddbdfd 303b5006 ef8947fc 53779819
fdd5005c d2e6fb4e 996d31ea d1ad0072 da858c9e 20bad4ac dd866cf6 f90471db
a1a00e06 e2da5b59 fc99976b 2f5a0048 276b7956 58fef2d0 0773a67c 401b5535
1839fef4 7fe14018 de25f133 6b7b6348 fcb81680 27f87b79 e46b26df b4cb8a00
f4ca0028 00a00280 0a005a00 4a002800 a00f35f8 8567e4eb 09301c4d 1ff2e280
38fa0028 0248d0bb 009401ea ba1e9169 e1fb1df2 ecf376fe f26fe940 1977fad6
94de21d3 ae85df16 fbb7f1ed 401a9a8d dda6ade1 abdfb2cc ac045ce3 b5005dd2
ca59f87e cfed0ca8 a9027d07 14019ba2 4d0bf89b 58f29908 9043b76f b2d0059d
7fc396fa da0ff967 32f493fa 500798ea 3a7cfa65 d1b79c73 40142800 a00e83c1
90f9be23 b5ff0067 e6a00f5a a002800a 002800a0 05a004a0 02800a00 e37e239f
f8935b8f fa6bfd28 03cde800 a009118a 1caf1401 e83ff09c e933c1b2 eace523d
3031401c 3df4b0cf 76cf05b8 b74ec83b 50074fe1 28ff00e2 99d75cf4 30edff00
c74d006b eaff00f2 4ca3ff00 af7b7ffd 92803ce1 31b86ee9 401e9969 e2ad0ed7
4c8a259a 4fdda602 ece68038 9f10eaff 00db3a8f 9fb36a81 814018b4 0050077f
f0cbfe5f 8ffbb401 ddd00140 05001400 5002d002 50030958 e3cb7caa 280190c9
14833148 a7fdda00 c8d5bc35 6dac488f 732cbf28 c6148c50 0575f05e 89c7ee9b
fefba00c fbbf87f6 8e7fd1ae 5a3ff7a8 022ff856 bff515ff 00c97ffe bd000bf0
e477d47f 28e80273 e1cb6d33 50d25ed8 6e3e77cd bbe99cfe 1401bf79 a7a268b7
5059c289 e646785e 2801d616 63fb0ad6 d2ee3538 895193b7 028039bf f847f4dd
4f5dd42d fcaf205b 08f1e57b 8f4a00ce baf00df2 1ff45952 51efc500 650f0a6b
44e3ec4d c7d2802d db781b58 93ef2243 fefbd006 bffc2b5f fa8aff00 e4bfff00
5e80357c 3be1b6d0 e573f6bf 355d794d b401d2d0 01400500 14005002 d0025007
9ef8d565 97c4105a c72f13a2 ae3d2803 3e1d1aef 4dfde49a 8c563d9f 6cbf37e9
401e91a7 9ce9f01f 33cdca0f 9fd68023 9f51b1b3 1fe91711 26280327 fe134d14
7fcb73f8 47401927 e22c631e 5d81fc5e 802bcdf1 0ee3fe58 d9c69f53 9a00abff
0009f6ab d92d87fc 06803365 f146af32 ed37b201 fecfcbfc a801d0f8 af588936
8bd6fc71 401763f1 bea6bfc1 6f9f5db4 016e0f88 5783fd7d ac4df4e2 802d45f1
113f8f4e dbf47a00 d0b7f1ce 8efc3f9b 0ffbcbfe 1401ab69 afe97758 f26f23cf
a74a00b3 7f2fd96c 4c9bf66c 1fddddfa 50079cfd 9b5e6b2f b525eb4d 147dd2eb
3b3f5a00 d5f03eb3 7d35efd9 253e7c58 fbcdfc14 01ded001 4005002d 00250070
fe2fd546 9fad5b7f a1db4b84 593732f3 d7ff00ad 40187378 8207732f f6359ee3
d49e6803 32f754b8 beff005c df27f0c6 3eeafd05 006fd878 47caf9f5 d916d20c
7cbfbc19 a00c76d3 a0bad5d6 d347732a b7466a00 a37d66f6 176d049f 7968029d
00140050 069695a3 ddeaf36d b54fa9a0 0351d1af 74bd9f6b 8bcbddd2 80336803
4746648b 55b6794e 11581a00 ebfc4da2 7f6b22ea fa77f10c b6fe2801 da57872c
b50f08c7 c224cc7f d750071c 3edba25e f198264a 00d78bc6 3a8236ef 2ed89fef
6ca00d4f 09eb5777 dae24533 ed8847f2 c6800140 1df50014 005002d0 0250079a
7c47ff00 90e43ff5 c07f5a00 e42800a0 0ea6d86b 5e2ff91a 75db0faf 02803716
0d17c23e 5976f36e cf7f4a00 cbf8856d e56ae937 f0c89401 c7500140 1d1f87bc
333eb128 660c96df dfa00d5d 53c4d0d8 db7f6568 5c20e3cd cff2a00a dfd95aef
89acd2f6 6991c0fb b9a00e5e 789e094c 7270cb40 1dcf8434 55874dfe d092dbcd
9dbfd503 4013f8a6 5d7134a9 7725aa5a 700f97f7 a80336d2 6d9e0313 09f6cd6f
71fbbe7b fa7f3a00 a9e36092 5ddb5f45 f76ee10d 401cad00 745e08ff 0091a6cf
f1ff00d0 6803d628 00a00280 16801280 3cd3e23f fc8721ff 00ae03fa d0072140
172c60fb 5dec3074 f3180a00 ecfc4ffd a5f2e99a 65adc8b3 8d02fc91 f078a00a
7a5f864d 9a2ea5ac 6dfb322e 7caef401 a1a2dd69 de20d1e1 d32f3899 3ee81c50
0467e1e1 ddfbbbdf 97dd6802 59f4af0c e80b9bcf dec9fdd6 393f9500 626b7e2e
b9d47741 0e23b6f4 c50072d4 01e93e0a 9af974cf f4c548ec 517e573d 68039ad3
ac57c49e 259f0764 6c4c9f85 00745ff1 4ee9ba79 87fb4dee 176ffab1 73fd178a
00e7f5dd 7a3b9b68 f4fd350c 1648bf74 f7a00aba 0e8173aa dc45fba6 16e7abf6
a00bbe36 bb49753f b3471a2a 5a2f97c5 0072d401 d17823fe 469b3fc7 ff0041a0
0f58a002 800a005a 004a00e2 3c5fa2fd bb56b67f b5430870 23c13401 ce4da5e9
76f7bf66 7d5dfe5e adf65e3f f42a00ba 9e12bb78 45e69374 b3a7f0ed f95a802f
36b5e2cb 3f966b43 ff007ebf c28039dd 5f59d435 16f2ef98 fca7fd5e 318a00c6
a002800a 00e8746f f847fc9f f89909f7 8feef434 01affdaf e17d3a4d f63a799a
45e87b50 05f92cb5 8f1227fa 43a58d96 3ee2fcfb a8033b5f 7b0d1f47 fec9b2da
d3c9b7cf 6fa50072 567189ae 238da4f2 c13f7a80 3a8b5b5f 0c69f26e b8d40de1
4fe158fe 5340135e 78e9bc8f 234cb5fb 363a1e28 039db0d1 2f6f46e8 e2c45ff3
d4f0b401 a565e1bb 4b8bafb2 ff006cc3 f683f744 485c1fc6 8034f40d 2adad75b
824b1d56 dae7670c 9f74ff00 f5e803d0 2800a002 80168012 80386f1c e9773e64
7aa5be7f 74bce3f8 71401ccf fc249ab1 ff0097a3 da803d23 c33234fa 15b3ce9b
58fb6280 35e800a0 0cbfec0d 24aedfec db5ffbf3 8a00ce93 c17a3347 fea8a7be
fa00c6d6 bc2fa3e8 d682695e ef6938e3 1400e8fe 1f24aa1d 2f9e353f c2f17340
142dbc0f 7538565b cb478bfb ca734012 7fc216bf dac34efb 773e4f99 feae8035
53e1ee9d b7e6b8b9 cfe1fe14 0172dfc0 da2c6b82 924a7d59 ff00c280 346dbc3f
a55aff00 aab38fa7 71401a51 c6a91848 c0550380 050054d4 34f8b51b 3fb3cbd2
80385bad 4fc41a37 fa2f9696 f1a74f2a 3f97f0a0 093c13a1 ddaeac2e a78de158
47f12e33 401e8940 05001400 b4009400 50042904 48772a2e 4fa5004d 40050014
00500140 1ce78bf4 d9b54d36 182d87cd e6ff004a 00e8e803 03c11ff2 2ada7e3f
fa150032 6d3eebfe 132b4bd8 97fd1960 d87fcfe5 401d1500 14005001 40050014
00500140 05001400 b4009400 50014005 00140050 01400500 14005006 3785ed65
b1d06082 71b241da 80366800 a002800a 002800a0 02800a00 2800a002 80168012
800a0028 00a00280 0a002800 a002800a 002800a0 02800a00 2800a002 800a0028
00a00280 0a005a00 ffd90000
">>
   GRAPH_LEN = 0
   CLOSE = 0
   MIN_WIDOWS = 1
   MIN_ORPHAN = 0
   MAX_LINES = -1
   TEXT_WRAP = 1
   ALIGNMENT = 0
   ARCFILL = 0
   ARROWSTYLE = 0
   ROTANGLE = 0
   SPACING = 0
   LINKEDFILE = NULLP
   POINTSLFID = (BLONG) NULLP
   OLE_LFID = (BLONG) NULLP
   OLE_LEN = 0
   BIDI_DIR = 0
   ASSOCOBJ = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 0
   FRAME_ID = 0
   ALTXT = NULLP
   HEADERS = NULLP
   LABFIELD = 0
   ACCKEY = NULLP
END

DEFINE  SRW2_BOILERPLATE
BEGIN
   ITEMID = 571
   NAME = <<"B_9">>
   TAG = 226
   DISP_ORDER = 37
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 9877
   Y = 5242
   WD = 3375
   HT = 1365
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00002695 0000147a 00000d2f 00000555 
">>
   GRAPH_TYPE = 0
   GRAPH_LFID = (BLONG) NULLP
   GRAPH_LEN = 0
   CLOSE = 0
   MIN_WIDOWS = 1
   MIN_ORPHAN = 0
   MAX_LINES = -1
   TEXT_WRAP = 1
   ALIGNMENT = 12
   ARCFILL = 0
   ARROWSTYLE = 0
   ROTANGLE = 0
   SPACING = 0
   LINKEDFILE = NULLP
   POINTSLFID = (BLONG) NULLP
   OLE_LFID = (BLONG) NULLP
   OLE_LEN = 0
   BIDI_DIR = 0
   ASSOCOBJ = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 0
   FRAME_ID = 0
   ALTXT = NULLP
   HEADERS = NULLP
   LABFIELD = 0
   ACCKEY = NULLP
END

DEFINE  SRW2_BOILERPLATE
BEGIN
   ITEMID = 586
   NAME = <<"B_14">>
   TAG = 226
   DISP_ORDER = 38
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 207
   Y = 15250
   WD = 18943
   HT = 1365
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
000000cf 00003b92 000049ff 00000555 
">>
   GRAPH_TYPE = 0
   GRAPH_LFID = (BLONG) NULLP
   GRAPH_LEN = 0
   CLOSE = 0
   MIN_WIDOWS = 1
   MIN_ORPHAN = 0
   MAX_LINES = -1
   TEXT_WRAP = 1
   ALIGNMENT = 68
   ARCFILL = 0
   ARROWSTYLE = 0
   ROTANGLE = 0
   SPACING = 0
   LINKEDFILE = NULLP
   POINTSLFID = (BLONG) NULLP
   OLE_LFID = (BLONG) NULLP
   OLE_LEN = 0
   BIDI_DIR = 0
   ASSOCOBJ = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 0
   FRAME_ID = 0
   ALTXT = NULLP
   HEADERS = NULLP
   LABFIELD = 0
   ACCKEY = NULLP
END

