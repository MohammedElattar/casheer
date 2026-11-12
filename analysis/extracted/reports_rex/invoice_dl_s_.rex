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
   groupid = 304
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

DEFINE  TOOL_MODULE
BEGIN
   PRODUCT = 16
     <<"SQL*ReportWriter">>
   MODTYPE = 6
     <<"REPORT">>
   OWNER = (VARCHAR) NULLP
   MODNAME = 10
     <<"invoice_dl">>
   MODID = 0
   TCS_VER = 16777216
   NEXT_ITEMID = 549
   CREATOR = 7
     <<"MAHROSA">>
   CREATE_DATE = <<"120104.10.10 09:04:26">>
   CREATE_VER = -1744300544
   MODIFIER = 7
     <<"MAHROSA">>
   MOD_DATE = <<"120126.11.09 01:26:09">>
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
   ZOOMPOWER = 0
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
   UITAG = 519
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
   WINDOW_X = 198
   WINDOW_Y = 0
   WINDOW_WD = 774
   WINDOW_HT = 306
   DFLT_TYPE = 3
   UIFLAGS = 8193
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
   XML_TAG = <<"INVOICE_DL">>
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
   DFLT_TITLE = <<"Report Parameters">>
   DFLT_HINT = <<"Enter values for the parameters">>
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
   ITEMID = 352
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = <<"Courier New">>
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
   ITEMID = 508
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
   ITEMID = 519
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
   ITEMID = 520
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
   ITEMID = 521
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
   ITEMID = 522
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
   ITEMID = 545
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
   ITEMID = 546
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
   ITEMID = 548
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = <<"Simplified Arabic">>
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 84
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
   SCALE = 2
   PRECISION = 8
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
   SCALE = 2
   PRECISION = 10
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
   SCALE = 2
   PRECISION = 10
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
   PRECISION = 6
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
   ITEMID = 525
   ALIAS = <<"DELVERY_Q">>
   EXPR = <<"INVOICE.DELVERY_Q">>
   DESC_EXPR = <<"DELVERY_Q">>
   SEL_ORDER = 20
   DATA_TYPE = 0
   WIDTH = 22
   SCALE = 2
   PRECISION = 8
   QUERYID = 103
   ODATA_TYPE = 0
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
   X = 17170
   Y = 40221
   WD = 15769
   HT = 11928
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
   DFLT_LBL = <<"Show Print Job Dialog">>
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
   DFLT_LBL = <<"Output Mode">>
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
   DFLT_LBL = <<"Run in Background">>
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
   DFLT_LBL = <<"Orientation">>
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
   DFLT_LBL = <<"Decimal Indicator">>
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
   DFLT_LBL = <<"Thousands Indicator">>
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
   DFLT_LBL = <<"Currency Symbol">>
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
   DFLT_LBL = <<"Number of Copies">>
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
   DFLT_LBL = <<"Destination Format">>
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
   DFLT_LBL = <<"Destination Name">>
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
   DFLT_LBL = <<"Destination Type">>
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
   DFLT_LBL = <<"Pt Code">>
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
   DFLT_LBL = <<"Inv Dt">>
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
   DFLT_LBL = <<"Ser No">>
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
   DISP_ORDER = 2
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
   DISP_ORDER = 6
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
   DISP_ORDER = 3
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
   PRECISION = 8
   SCALE = 2
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
   DISP_ORDER = 4
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
   PRECISION = 10
   SCALE = 2
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
   DISP_ORDER = 5
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
   PRECISION = 10
   SCALE = 2
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
   X = 46165
   Y = 12374
   WD = 6553
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
   DISP_ORDER = 1
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
   PRECISION = 6
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
   DISP_ORDER = 0
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
   ITEMID = 524
   NAME = <<"DELVERY_Q">>
   TAG = 0
   DISP_ORDER = 15
   GROUP_ID = 153
   SOURCE = 0
   SOURCE_ID = 525
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
   PRECISION = 8
   SCALE = 2
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Delvery Q">>
   DFLT_WID = 100000
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
   XML_TAG = <<"DELVERY_Q">>
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
   TAG = 392
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 217
   SEG_ORDER = 0
   TAG = 392
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 219
   SEG_ORDER = 0
   TAG = 392
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 221
   SEG_ORDER = 0
   TAG = 392
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 223
   SEG_ORDER = 0
   TAG = 521
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 257
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
   ITEMID = 268
   SEG_ORDER = 0
   TAG = 522
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 269
   SEG_ORDER = 0
   TAG = 522
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
   ITEMID = 304
   SEG_ORDER = 0
   TAG = 392
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 425
   SEG_ORDER = 0
   TAG = 352
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 426
   SEG_ORDER = 0
   TAG = 545
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
   WD = 19642
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
   WD = 19559
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
   Y = 14226
   WD = 19537
   HT = 7147
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
   Y = 14226
   WD = 19340
   HT = 2560
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
   Y = 16786
   WD = 19340
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
   TAG = 226
   DISP_ORDER = 5
   FORMATFLAG = 2048
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 15
   Y = 18322
   WD = 19537
   HT = 2962
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
   TAG = 508
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
   TAG = 520
   DISP_ORDER = 7
   FORMATFLAG = 536871940
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 83
   Y = 6747
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
   MASK = <<"DD-MON-RR HH24:MI:SS">>
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
   TAG = 548
   DISP_ORDER = 8
   FORMATFLAG = 536871940
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 110
   Y = 4900
   WD = 16837
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
   TAG = 546
   DISP_ORDER = 9
   FORMATFLAG = 536871940
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 110
   Y = 11575
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
   ITEMID = 202
   NAME = <<"F_Delvery_q">>
   TAG = 519
   DISP_ORDER = 10
   FORMATFLAG = 536880132
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 7682
   Y = 22938
   WD = 10459
   HT = 2289
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 524
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
   TAG = 519
   DISP_ORDER = 11
   FORMATFLAG = 536871940
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 7680
   Y = 25725
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
   TAG = 519
   DISP_ORDER = 12
   FORMATFLAG = 536871940
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 7681
   Y = 28175
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
   ITEMID = 210
   NAME = <<"F_SumI_QPerSERIAL_NO">>
   TAG = 520
   DISP_ORDER = 13
   FORMATFLAG = 805306628
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 13464
   Y = 18954
   WD = 5909
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
   DISP_ORDER = 14
   FORMATFLAG = 805306628
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 15
   Y = 16786
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
   DISP_ORDER = 16
   FORMATFLAG = 805306628
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 8729
   Y = 16786
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
   TAG = 391
   DISP_ORDER = 18
   FORMATFLAG = 805306628
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 10474
   Y = 16786
   WD = 3242
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
   TAG = 391
   DISP_ORDER = 20
   FORMATFLAG = 805306628
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 13809
   Y = 16786
   WD = 5536
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
   TAG = 519
   DISP_ORDER = 24
   FORMATFLAG = 536871940
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 14312
   Y = 9125
   WD = 4590
   HT = 1961
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
INVOICE.SERV_Q, INVOICE.DISC_Q, INVOICE.TABLE_NO, INVOICE.SER_NO, 
INVOICE.INV_TYP, INVOICE.EMP_CODE, INVOICE.H_NO, INVOICE.DELVERY_Q
FROM INVOICE, INV_DTL, ITEM_TBL, POINT_TBL, MEM_VIEW
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
   TAG = 226
   DISP_ORDER = 15
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 15
   Y = 14226
   WD = 6695
   HT = 1536
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
0000000f 00003792 00001a27 00000600 
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
   TAG = 226
   DISP_ORDER = 17
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 8921
   Y = 14226
   WD = 1973
   HT = 1536
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
000022d9 00003792 000007b5 00000600 
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
   TAG = 226
   DISP_ORDER = 19
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 11278
   Y = 14226
   WD = 2237
   HT = 1536
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00002c0e 00003792 000008bd 00000600 
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
   TAG = 226
   DISP_ORDER = 21
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 15433
   Y = 14226
   WD = 3320
   HT = 1536
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00003c49 00003792 00000cf8 00000600 
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
   DISP_ORDER = 22
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 9332
   Y = 19346
   WD = 3545
   HT = 1825
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00002474 00004b92 00000dd9 00000721 
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
   DISP_ORDER = 23
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
   ITEMID = 261
   NAME = <<"B_5">>
   TAG = 226
   DISP_ORDER = 25
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 10040
   Y = 9326
   WD = 4244
   HT = 1365
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00002738 0000246e 00001094 00000555 
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
   ITEMID = 268
   NAME = <<"B_7">>
   TAG = 226
   DISP_ORDER = 26
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 1812
   Y = 26127
   WD = 4931
   HT = 2034
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00000714 0000660f 00001343 000007f2 
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
   DISP_ORDER = 27
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 1163
   Y = 28376
   WD = 6091
   HT = 2048
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
0000048b 00006ed8 000017cb 00000800 
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
   ITEMID = 300
   NAME = <<"B_10">>
   TAG = 226
   DISP_ORDER = 28
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 408
   Y = 18322
   WD = 18947
   HT = 1365
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00000198 00004792 00004a03 00000555 
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
   ITEMID = 304
   NAME = <<"B_11">>
   TAG = 226
   DISP_ORDER = 29
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 408
   Y = 15250
   WD = 18943
   HT = 1365
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00000198 00003b92 000049ff 00000555 
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
   ITEMID = 425
   NAME = <<"B_1">>
   TAG = 226
   DISP_ORDER = 31
   FORMATFLAG = 805306627
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 4388
   Y = 311
   WD = 14336
   HT = 1365
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00001124 00000137 00003800 00000555 
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
   DISP_ORDER = 30
   FORMATFLAG = 805306627
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 6068
   Y = 1445
   WD = 9450
   HT = 1365
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
000017b4 000005a5 000024ea 00000555 
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
   ITEMID = 454
   NAME = <<"B_13">>
   TAG = 456
   DISP_ORDER = 32
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 415
   Y = 0
   WD = 3213
   HT = 4031
   PAGE = 0
   TYPE = 51
   NUM_POINTS = 32
   POINTS = (BINARY)
<<"
00000000 00000000 00000c8d 00000fbf 0000019f 00000000 00000c8d 00000fbf 
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
e800a002 800a0028 00a00280 0a002800 a002800a 002800a0 02800a00 2800a002
800a0028 00a005a0 04a00280 0a002800 a002800a 002800a0 02800a00 2800a002
800a0028 00a00280 0a002800 a0028016 8012800a 002800a0 02800a00 2800a002
800a0028 00a00280 0a002800 a002800a 002800a0 02800a00 5a004a00 2800a002
800a0028 00a00a77 97d6fa74 68d73208 d5be4068 02e50073 53789162 f13c5a59
4f97ee96 f7ed401b f2cc96d6 e657f951 05006578 7b5e875b 8e6f2d3c b31f1f87
6a00dba0 02800a00 2800a002 800a0028 00a00280 16801280 0a002800 a002800a
00e4f59b dd5b42bb fb667ed5 a79fe0c6 3cba00cf d7b518fc 49e1c1f6 2ff5b09f
3668ff00 ba280343 c11aaa4d a179721c 1b4ea7da 803cefed b71f6ffb 6eefdf6e
f333401d af8db536 9f45d3c0 4da2e879 dd7dba7e b4015fc2 d3ff00c2 3da5dc5e
de71f685 5f217bbd 002bf88b 53f114b1 59e9711b 5fef6d6f ebda803b 0d1b4f3a
75a79466 69a4ea5f d68034a8 00a00280 0a002800 a002800a 005a004a 002800a0
02800a00 28018634 78fcb7c6 dc608a00 f22d5aca 4f0feb38 53f77e78 9bda803a
5b5d534e 9b4bd46e 98c76cf7 50ec9507 5ddec3fe 05401e7f 401d54ba de9f73fd
92b34329 4b08beee 07cedc71 fa500626 a3a8cfaa 5d79f707 9a00f48f 04e9634f
d1d25ff9 6972031f a76a00e9 2800a002 800a0028 00a00280 0a002801 68012800
a002800a 002800a0 028038ef 8856225d 2d2ef67e f23382de d401e6b4 00500140
17f47884 fab5ac2d f75a45a0 0f6ca002 800a0028 00a00280 0a002800 a0028016
8012800a 0028039e f13ebffd 8b6c9b13 74f27ddf 4a00c9d2 bc51a96a 5617a522
81ae620a 638d4751 de8019a7 78fe26e3 50836fbc 7cd00769 6f3453c2 af0baba7
622802be a9179ba4 dd45fde8 b1fa5007 0ba5e85a 68b4f32f 9bfdcf35 fca56fa6
79fd2802 bdb3e991 c186934a ddcf5b79 9a8027b5 d3b4ed4a 7942fd9e 4f9b8166
e627ff00 be5e802f 7867c39f 64d70dc1 6f921e91 f71401dd d00721e2 1f18c7a7
1fb3da7e f6e075fe e8a00ab7 dae6a91f 8561d437 79334d3f 61db1400 df096b7a
d6a5aaec 95bcdb71 feb381f2 d0077740 05001400 50014005 002d0025 00140050
0676ada5 41abda7d 9ee3381d 0ad0079d fda66f0b ea1b3fb3 edfce5e8 cd934014
a7d6ae2e 64df72b6 f337fb51 0a00e9fc 25e23d3d 76d8f906 d49e17f7 85813fd2
803b3ba8 4cb68f0a 3f944ae3 70ed401e 2f7d1cf1 5dba5d83 e70eb9a0 0a940050
07a47807 edb2db6e b8ff008f 78d7643c 5006a78a 357b6d2a c364f179 de7fcbe5
7b77a00f 3f4d7668 06db28ad ed477d89 d7f3a00b 11ebface a73456ef b2f3b885
a04c7f2a 00f41d13 47b7d2a1 fdcc4a92 b01bf9fe 5401ad40 05001400 50014005
002d0025 00140050 0140146f b4db4d46 3d97702b fa7b5007 317bf0fe d48ff429
9e26f46f 9850067c 7e05d56d ee16582e 2dfe5fba d401d4db 788ade4b ff00b0cd
14d69276 f3c6dddf 4a005d63 c3963ac9 df36e120 1d568038 8d47c1f7 76261ccd
1379d308 93f1a00d 7d2bc02a 3e6d4df3 ed19a00e b2eaeadb 49b1df26 238e25f9
47f41401 c95fe9da b78b765d a7976f6b ff002c52 43c9fd28 025b4f87 90472eeb
9bbf357f ba136d00 74da7e8d 61a67fc7 adb053fd eef401a3 40050014 00500140
05001400 b4009400 50014005 00140050 014019ba 9e950ea7 061fe591 7fd538ea
868022d0 6e6e27b3 2979ff00 1f10bf97 27bd0057 f157fcc1 bfec250f f5a00dfa
00e693fe 279ae9ce efb2696f c7a3c9ff 00d6a00e 96800a00 2800a002 800a0028
00a00280 0a005a00 4a002800 a0028018 ccb1c7b9 be551401 c2eb1e3c 3feaf4a5
e3a798c2 802841e3 cd4d36f9 a9148bc7 18c50077 3a36b16b ac5befb5 cfcbd55b
b500578b e5f17ca8 a170f68a cdf9d004 7e2aff00 9837fd84 a1feb401 bf401ccf
8131ff00 08d26d3c ee6cd001 e23f14c5 a37ee221 e6dcfa76 5a00e487 8b3c42f1
6e497e58 fefb7942 8035bc3f e376deb0 6ab8f413 7a50077b 40050014 00500140
05001400 b4009400 50014005 00713f11 ae8c7a7d b5a8e921 dd4015fe 1e69d6d2
a4d7726d 79908c03 fc3ef401 d95de9f6 77c9b6ea dd251db8 a00f33f0 44e61f12
5bfa3fcb 401dc7fc d41ffb85 ff00ecf4 012788e2 f32d6cb6 fde8eee2 23da8037
28039bf0 331fec01 1bae0c4c 52803889 c7dabc6d e5cfcab5 ef967e9b b1401ea3
158dac30 7911db44 b1375509 c7e5401c 1fc40d3e dace5b27 b68962de a461578e
31401dae 8059f43b 2327def2 5727f0a0 0d1a0028 00a00280 0a002801 68012800
a002800a 00c6f116 8dfdb3a6 7d9f76d7 53b96803 cee13aaf 85af9599 0c47fba7
eeb5005a bbf176af a9c69047 884fadbe e527f5a0 083c2d2c 1a778863 37b94dbc
7d0d0075 3e26d7ad 748d4736 f087d47c b0bbbb28 f4a00bb2 dfcd7fe1 a5bafb3f
92e668b6 2f5fe35a 0087c57e 249b4668 a2b68324 f3b9ba50 054d07c5 da7269a5
1e2fb2f9 5fc09dfe 9401c75f c9fdafac cad6b07f ac3f2a25 006b5b78 cf56d3e0
fb3b2c72 15e33303 bbf9d004 565a6ea5 e28d47cf b8de236f f96b8e05 007a5e9d
6df62d3e dedbaf95 1aa7e428 02d50014 00500140 05001400 b4009400 50014005
0014010c d0473c3e 5c918643 fc245003 6dad6ded 23d96f0c 7127fb0b b680381f
1b6ada5d f6d8ed93 cd997fe5 b0fe5401 ca58dc25 b5da4b2c 2b32aff0 35007a57
f6ad9ebd a434717c f3610b41 f95003bc 5f7f6106 98f6d75b 4cccb989 6803ca68
03bef026 a7a647b6 d8c5e5de 371e67f7 e803b9d8 876f1f77 a5004940 05001400
50014005 00140050 02d00250 01400500 14005001 40050072 e7c17a77 f68fda46
4275f27f 86800f10 5bd86aba 841a64e3 cbb874dc 93719e3b 50079e47 35c6957b
fe8d3fcc bfc519eb 4000fb46 afa8aef6 ccd70d8c 9a00f48d 034fd2ec fcfd3a35
f3678957 cf62bd73 da8019a6 7842cac3 53377d47 58e3feed 0074d400 50014005
00140050 01400500 1400b400 94005001 40152ffe d42c9bec 0b1b5c7f 0efe9401
c349e3dd 450ecfb1 c498ec68 03a3f0a6 af75acd8 493dc88c 61b1f2ad 00743401
5ee668ac ed8cf33e c8d07340 1e65e24f 134fab3b 470964b2 e3e5a00c 6d3ec26d
46e96081 72c68019 7767358d c1b79d76 3ad00741 a178beeb 4ddb05c7 efad4718
ee2803d2 6d278aee d927b77d f1b0e0d0 058a00c5 f13dfdce 99a5fda6 d111b69f
9b77a500 72b63e3a d4e6b948 becd03ee e368e280 3beb6dff 00678fcd c6fdbf36
da009a80 0a002800 a0028016 8012800a 0028032b 5ed51347 d31a7fe3 fba831de
803cead3 4fd47c53 2dcdd075 32201bb3 de803bcf 0869afa5 68be5cc3 6cac771a
00bbaaea d6da3db7 9b70df44 ef401e59 abebf7da c63ed2df 28fe0140 142d2da5
bb9d2181 7748d401 dcbf86a3 d2bc2b78 d247bef0 a7f0fd45 006cea5a 1d9eb3a6
27fa3793 3797fbac 8c6cf414 01e657d6 3369d73f 67b81865 a00b3a56 bb7fa47f
c7b4bf27 74ed401e 91e1cf10 41ad5be3 eedc2afc cbfe1401 6b5dd3ce a7a44968
8fb3ccc7 3401c278 8fc37fd8 10dbdddb ce4ff3cf b500761e 16d606b1 a5aeeff5
f1fcb27f 8d006f50 01400500 14005002 d0025001 40050079 77c407dd e21dbff3
ce351400 7857c4df d881a19d 0c909e78 ed401b57 5e3eb5fb 3ffa2473 097b6e03
1401c2dd 5ecf7b27 99732991 a8016c6d 5efaea3b 78bef3f1 401de68d a7ff00c2
37a969f6 bf24b2df 6ff31fd3 033c5006 ef8987fc 5377b819 fdd5005c d2e7fb56
996d337d e78d4d00 72da8d8c 9e21bbd4 eca471ba cf6f9047 1d474340 1c05cdb4
b6939826 5daebd45 0025bcef 6f2a4b1f 0e9401dc e99f1046 d54d4603 9fefc7fe
14018de2 6f1336b9 b6248fcb b75fccd0 04ff000f 2f7c8d68 dbff000c e98a00f4
da002800 a002800a 005a004a 002800a0 0f34f887 67e4eb09 381c4d1f ea38a00e
3e800a00 92346760 a9c9a00f 56d0f48b 4f0f58ef 97cb12ed fde4d9fd 28032f50
d6f496f1 169b762f 38b7dc1f 8f51c500 6a6a5776 7abf866f becb3ab8 11738edf
e7140177 4b64b3f0 fd9fda19 515204c9 ec38a00c dd127864 f13eb262 74612087
6edef85a 00b3e20f 0e5beb68 3fe59ccb d24fe940 1e61a969 f3e97766 dee07340
142800a0 0e83c190 79de24b4 f44f9a80 3d6e800a 002800a0 02801680 12800a00
28038df8 90dff125 b75ffa6d fd2803cd a800a009 11ca36e5 38c5007a 17fc275a
45c41e5d dd94cc0f 6da31401 c35fcd0d c5e3c905 b8b743d2 31da803a 7f094647
8675e90f 46876ffe 3a680363 58ff0092 651ffd7b dbff00ec 9401e6e9 8dc3774a
00f4db4f 15e876ba 64512cf2 7eed3017 67cdfe14 01c4788b 58fedad4 bed0136a
01b45006 2d001401 dffc3103 37ed8e7e 4a00ef28 00a00280 0a002801 68012801
8ccb1c7b 9be55140 0c8658a5 198a453f eed00646 afe1ab6d 665492e6 6986d18c
2918a00a ebe0ad0f 8fdcb7fd f74019f7 7f0facdc ff00a2dc b45ecc28 021ff856
bff515ff 00c97ffe ca8005f8 7032376a 59fa4540 161bc376 ba5ea1a4 bdaaee3e
7fcdbbbf 19cfe18a 00dfbcd3 d1344bbb 7b282343 2c4dc2fc b400eb0b 31fd856b
69791a9c 44a8c9db 81401cdf fc23fa6e a9af6a36 fe57902d 8478f2b8 ea3d2803
36efc017 c8dfe8b3 24ab8eff 002d0065 0f0a6b45 b1f626e3 e94016ed bc0baccb
f792383f df7ff0a0 0d7ff856 bff515ff 00c97ffe ca8035bc 39e1a7d0 a590fdb3
ce575e53 662803a5 a002800a 002800a0 05a004a0 0f3cf1b2 cd378860 b48e538b
8455c761 cd0067c3 a2de69bf bd93528a c3b49b25 f9c7e540 1e93a7b6 ed3e03e6
79b941f3 fad00477 1a958d90 ff0048b9 8a3c7ad0 0649f1ae 88bff2f0 7f08e803
21be2346 31e5d837 e2f4015e 7f88973f f2c6ce34 fa9cd005 5ff84ff5 6e311da8
c7fb1401 9b378a75 89d76b5f 4a07fb3f 2ff2a007 41e2bd66 24da2f9b f102802e
c7e37d4d 493b2dc9 3df6d005 bb7f8877 83fd7dac 2e3fd938 a00b517c 458ff8f4
edbf47ff 00eb5006 8dbf8eb4 790e1fce 87fde5ff 000a00d5 b4d7f4bb bc793791
e7d3a500 59d426fb 2d8b49bf cbd83fb9 bb1f8500 79c1b6d7 dacbed69 7cf3c51f
394bacf9 7fad006a f81f5abf 9afbec92 b19e2c67 731fb940 1df50014 005002d0
0250070d e30d5869 dadda836 76b2e112 4dcebf37 deedf950 061cfe21 8247697f
b16cf7b1 cb16f9a8 0332fb54 b9bfff00 5cff0027 f0c63eea fd05006f d87847ca
f9f5e916 d20c7cbf bd19cd00 63be9d05 deb0b67a 3486556e 8cf40146 fac9f4fb
b6b79796 434014e8 00a00280 34b4ad1e ef579b65 a47d3a9e c2800d4b 46bdd2f6
7db22f2f 774a00cd a00d1d19 d22d5ad6 499b6a2b 863401d7 f89f43fe d78d758d
37a30cbe ff009680 1fa5786e cb51f084 7c224ce7 fd7e2803 8d06fb44 bee0b413
a5006bc5 e32d451f 7f976c5b bb6ca00d 4f09eb57 97daea45 349b6211 9db1a000
50077f40 05001400 b4009401 e67f123f e43b0ffd 7b8fe668 0390a002 803a9b51
adf8c3e4 6b842b0f 3f37ca28 03752df4 4f087965 dbcdbb3d fd3d6803 2be21daf
95ac24ff 00c32a50 071d4005 00747e1d f0c5c6b1 30660d1d a8fe3a00 d5d57c4f
0d8db7f6 5683f2a0 e3cecff2 a00adfd9 3af789ec 92fa69d1 d47dccf1 fca80397
9e17b794 c520c327 1401dd78 43445874 dfed192d bceb87ff 00540d00 4fe2a9b5
d4d2a6dc 968969c0 3e593ba8 0332d26d 9e02132c fb26b6b9 fdd73dfd 3f226802
a78dc249 776d7f10 f96ee00f 401cad00 743e07ff 0091aacf fe05ff00 a0d007ad
50014005 002d0025 00799fc4 8ff90ec3 ff005ee3 f99a00e4 2802dd85 bfdaef60
b7e9e632 ae6803b4 f147f69f cba5e976 b742ca34 0bf24670 dc50053d 2fc306cd
1753d676 fd9a35dd e577a00d 1d16eb4d f10e8d0e 977bc4c9 f7547140 1137c3b3
bbf757bf 276ca500 4d71a4f8 63c3e99b cfdec9d9 18e4fe54 0187ae78 bee752dd
043b63b5 3d88eb40 1cb5007a 578266bf 4d2ffd31 122b08d7 e573c1a0 0e674eb1
5f12f89a e307644c 4cbf8668 03a3ff00 8a734cd3 cc3fda8f 70bb7fd5 8baebed8
5e28039e d7b5e8ee ada3d3f4 c43058a2 fdd3fc54 015741f0 fdd6ab73 0fee585b
1eb2638a 00bbe37b b49b54fb 3451a2a5 a2f96314 01cb5007 43e07ff9 1aacff00
e05ffa0d 007ad500 14005002 d0025007 11e30d13 edfabdac 9f6b8210 e045863c
fe1401cd cfa5e956 f7df657d 61fe5fbc df64e07f e3d40175 3c2578f0 8bdd22e9
6e13f80a fc8d4017 9f5bf16d 9fcb35a1 3efe57f8 50073bac 6b3a8ea4 fe55fb9f
94ff00ab c6314018 d4005001 401d0e8d ff0008ff 0093ff00 133171bc 73f2f434
01affdaf e16d3643 25869c66 957a1edf ad00684b 65acf895 3fd2644b 1b1c708a
77eea00c df103e9f a3e8dfd9 16255e79 76fda1be 9401c959 c4b35cc7 1b482204
e37fa500 7516969e 17d3a4dd 73a8b5eb 47fc2b17 cad40135 e78edbec fe46976b
f65c7dd3 c7f2c500 73b61a25 f5f0df14 588bfe7a b70bf9d0 06959786 ad2e6ebe
c875a87e d27ee886 32e0fe34 01a7a069 36b6bae4 12d8eab6 d75b3864 fb87ff00
af401e83 40050014 00b40094 01c378eb 4aba3247 aadb67f7 4bce3f87 1de80398
3e25d59b addb76a0 0f49f0cc af71a15b 493a6d76 ebc62803 5e800a00 cb3a0692
576ff66d affdf9c5 00674be0 ad15a3ff 0052633e a1e80317 5bf0be8f a35a09a5
92f3696c 718a0074 7f0f9265 0f1df3c6 a7f85e2e 47eb4014 2d7c0d77 38564bcb
3787fbc8 7340127f c212bfda e34dfb7f cde479b9 f2a80359 3e1ee9db 7e6b8bac
fe1fe140 172dfc0d a2c6b864 9263ead2 7f862803 46dbc3fa 55affaab 38fa7719
a00d28e3 58e30918 0aa07000 a00a9a8e 9f16a567 f6794714 01c25dea 9e21d1bf
d17cb4b7 893a7951 7cb8f6a0 093c13a1 5daeae2e ee237816 11fc6b8c d007a2d0
01400500 2d002500 14010a41 12317545 dcde9401 35001400 50014005 00739e30
d367d574 d86ded87 cde76793 ed401d1d 0060781f fe454b4f f817fe84 680193e9
f77ff099 da5ec49f e8cb06c6 39faff00 f5a803a2 a002800a 002800a0 02800a00
2800a002 80168012 800a0028 00a00280 0a002800 a002800a 00c6f0bd acb63a04
16f70bb2 51da8036 6800a002 800a0028 00a00280 0a002800 a0028016 8012800a
002800a0 02800a00 2800a002 800a0028 00a00280 0a002800 a002800a 002800a0
02800a00 5a00ffd9
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

