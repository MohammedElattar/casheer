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
   groupid = 153
   stringid = 0
   lfid = 0
   cs = 560
   len = 7
   str = (BINARY)
<<"
c7e1e3e4 ddd00000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 155
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
   groupid = 157
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
   groupid = 175
   stringid = 0
   lfid = 0
   cs = 560
   len = 29
   str = (BINARY)
<<"
c3cce3c7 e1ec20c7 e1e3c8ed dac7ca20 cee1c7e1 20c7e1dd cad1c920 00000000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 184
   stringid = 0
   lfid = 0
   cs = 560
   len = 3
   str = (BINARY)
<<"
e3e40000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 188
   stringid = 0
   lfid = 0
   cs = 560
   len = 4
   str = (BINARY)
<<"
c7e1ec00 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 195
   stringid = 0
   lfid = 0
   cs = 560
   len = 9
   str = (BINARY)
<<"
c7e1cac7 d1edce3a 00000000 
">>
END

DEFINE  TOOL_MODULE
BEGIN
   PRODUCT = 16
     <<"SQL*ReportWriter">>
   MODTYPE = 6
     <<"REPORT">>
   OWNER = (VARCHAR) NULLP
   MODNAME = 16
     <<"rep_points_fatra">>
   MODID = 0
   TCS_VER = 16777216
   NEXT_ITEMID = 268
   CREATOR = 7
     <<"MAHROSA">>
   CREATE_DATE = <<"120104.10.30 09:44:38">>
   CREATE_VER = -1744300544
   MODIFIER = 7
     <<"MAHROSA">>
   MOD_DATE = <<"120126.11.09 01:26:50">>
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
   UNITS = 1
   ORIENT = 4
   UNITS_WID = 85000
   UNITS_HGT = 110000
   CHAR_WID = 80
   CHAR_HGT = 66
   BODY_WID = 61440
   BODY_HGT = 73728
   PAGE_WID = 69632
   PAGE_HGT = 90112
   PRINT_WID = 69632
   PRINT_HGT = 90112
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
   JUSTIFIC = 0
   ARROWSTYLE = 0
   UITAG = 260
   NEXTLISTID = 2
   IDROLESLIST = 1
   BIDI_DIR = 2
   PERS_FLAGS = 0
   HDR_UNITS_WID = 85000
   HDR_UNITS_HGT = 110000
   HDR_CHAR_WID = 80
   HDR_CHAR_HGT = 66
   HDR_BODY_WID = 61440
   HDR_BODY_HGT = 73728
   HDR_PAGE_WID = 69632
   HDR_PAGE_HGT = 90112
   HDR_PRINT_WID = 69632
   HDR_PRINT_HGT = 90112
   HDR_X_PANELS = 1
   HDR_Y_PANELS = 1
   TRL_UNITS_WID = 85000
   TRL_UNITS_HGT = 110000
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
   START_X = 4096
   START_Y = 8192
   LOC_ORDER = 0
   TYPE = 1
END

DEFINE  SRW2_BODY_LOCATION
BEGIN
   START_X = 4096
   START_Y = 8192
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
   WINDOW_X = 100
   WINDOW_Y = 0
   WINDOW_WD = 850
   WINDOW_HT = 497
   DFLT_TYPE = 5
   UIFLAGS = 8192
   GRIDINTC = 1
   GRIDSNPC = 4
   HALIGN = 0
   VALIGN = 0
   DECURREF_ID = 3
   GRPMAXROW = 0
   MOD_DATE = <<"120104.10.30 09:44:38">>
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
   XML_TAG = <<"REP_POINTS_FATRA">>
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
   UNITS = 1
   UNITS_WID = 40000
   UNITS_HGT = 40000
   FORM_WID = 32768
   FORM_HGT = 32768
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
   UITAG = 257
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
   ITEMID = 144
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
   ITEMID = 158
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
   ITEMID = 171
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
   ITEMID = 172
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
   ITEMID = 179
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
   FONTSIZE = 1400
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
   ITEMID = 183
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
   ITEMID = 185
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
   FONTSIZE = 1200
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
   ITEMID = 194
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
   FONTSIZE = 1100
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
   ITEMID = 197
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
   FONTSIZE = 1100
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
   ITEMID = 198
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
   FILLPAT = 0
   FILLFORE = 0
   FILLBACK = 194
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
   ITEMID = 199
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
   FILLBACK = 194
   FONTFACE = 0
   FONTSIZE = 1000
   FONTSTYLE = 0
   FONTWEIGHT = 7
   CHARSET = 560
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
   ITEMID = 206
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = NULLP
   PENWID = 0
   ADD_FLAGS = 16
   TEXTPAT = 0
   TEXTFORE = 0
   TEXTBACK = 0
   LINEPAT = 1
   LINEFORE = 0
   LINEBACK = 1
   FILLPAT = 0
   FILLFORE = 0
   FILLBACK = 209
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
   ITEMID = 257
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
   ITEMID = 260
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
   FILLBACK = 194
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
   ALIAS = <<"POINT_NAME">>
   EXPR = <<"POINT_TBL.POINT_NAME">>
   DESC_EXPR = <<"POINT_NAME">>
   SEL_ORDER = 1
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
   ITEMID = 262
   ALIAS = <<"sum ( INVOICE_hist.INV_TOT )">>
   EXPR = <<"sum ( INVOICE_hist.INV_TOT )">>
   DESC_EXPR = <<"SUM(INVOICE_HIST.INV_TOT)">>
   SEL_ORDER = 2
   DATA_TYPE = 0
   WIDTH = 22
   SCALE = 0
   PRECISION = 38
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_GROUP
BEGIN
   ITEMID = 104
   NAME = <<"G_POINT_CODE">>
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
   X = 10683
   Y = 15974
   WD = 11403
   HT = 11928
   DFLT_DIR = 1
   PERS_FLAGS = 0
   MAIL_TEXT = NULLP
   XML_TAG = <<"G_POINT_CODE">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   OUTER_XML_TAG = <<"LIST_G_POINT_CODE">>
   OUTER_ATTR = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 89
   NAME = <<"PRINTJOB">>
   TAG = 0
   DISP_ORDER = 13
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
   DISP_ORDER = 12
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
   DISP_ORDER = 11
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
   DISP_ORDER = 10
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
   DISP_ORDER = 7
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
   DISP_ORDER = 6
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
   DISP_ORDER = 5
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
   DISP_ORDER = 4
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
   DISP_ORDER = 3
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
   ITEMID = 108
   NAME = <<"POINT_NAME">>
   TAG = 0
   DISP_ORDER = 1
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
   ITEMID = 114
   NAME = <<"SumP_TYPPerReport">>
   TAG = 0
   DISP_ORDER = 2
   GROUP_ID = 1
   SOURCE = 1
   SOURCE_ID = 261
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
   PRECISION = 1
   SCALE = 0
   X = 25088
   Y = 16554
   WD = 6553
   HT = 1638
   DFLT_LBL = <<"Total:">>
   DFLT_WID = 30000
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
   XML_TAG = <<"SUMP_TYPPERREPORT">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 167
   NAME = <<"db">>
   TAG = 0
   DISP_ORDER = 14
   GROUP_ID = 1
   SOURCE = 3
   SOURCE_ID = 0
   COMPUTE_ID = 0
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 2
   FILE_TYPE = 1
   WIDTH = 20
   FLAGS = 160
   PRECISION = 10
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Db">>
   DFLT_WID = 0
   DEREF_ID = 2
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
   XML_TAG = <<"DB">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 168
   NAME = <<"de">>
   TAG = 0
   DISP_ORDER = 15
   GROUP_ID = 1
   SOURCE = 3
   SOURCE_ID = 0
   COMPUTE_ID = 0
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 2
   FILE_TYPE = 1
   WIDTH = 30
   FLAGS = 160
   PRECISION = 10
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"De">>
   DFLT_WID = 0
   DEREF_ID = 3
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
   XML_TAG = <<"DE">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 261
   NAME = <<"sum_INVOICE_hist_INV_TOT">>
   TAG = 0
   DISP_ORDER = 0
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 262
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
   PRECISION = 38
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Sum Invoice Hist Inv Tot">>
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
   XML_TAG = <<"SUM_INVOICE_HIST_INV_TOT">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 153
   SEG_ORDER = 0
   TAG = 172
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 155
   SEG_ORDER = 0
   TAG = 172
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 157
   SEG_ORDER = 0
   TAG = 172
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 175
   SEG_ORDER = 0
   TAG = 179
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 184
   SEG_ORDER = 0
   TAG = 185
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 188
   SEG_ORDER = 0
   TAG = 185
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 195
   SEG_ORDER = 0
   TAG = 197
END

DEFINE  SRW2_FRAME
BEGIN
   ITEMID = 147
   NAME = <<"M_G_POINT_CODE_GRPFR">>
   TAG = 144
   DISP_ORDER = 0
   FORMATFLAG = 805306636
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 0
   Y = 0
   WD = 59392
   HT = 4608
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
   TEMPL_ID = 121
   TABCAP = NULLP
END

DEFINE  SRW2_FRAME
BEGIN
   ITEMID = 148
   NAME = <<"M_G_POINT_CODE_HDR">>
   TAG = 158
   DISP_ORDER = 2
   FORMATFLAG = 1024
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 0
   Y = 0
   WD = 34816
   HT = 1536
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
   TEMPL_ID = 123
   TABCAP = NULLP
END

DEFINE  SRW2_FRAME
BEGIN
   ITEMID = 149
   NAME = <<"R_G_POINT_CODE">>
   TAG = 158
   DISP_ORDER = 1
   FORMATFLAG = 805306628
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 0
   Y = 1536
   WD = 34816
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
   TEMPL_ID = 124
   TABCAP = NULLP
END

DEFINE  SRW2_FRAME
BEGIN
   ITEMID = 156
   NAME = <<"M_G_POINT_CODE_FTR">>
   TAG = 158
   DISP_ORDER = 3
   FORMATFLAG = 2048
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 0
   Y = 3072
   WD = 34816
   HT = 1536
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
   TEMPL_ID = 125
   TABCAP = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 146
   NAME = <<"F_SumP_TYPPerReport">>
   TAG = 199
   DISP_ORDER = 4
   FORMATFLAG = 805306628
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 23552
   Y = 3072
   WD = 11264
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 114
   CONTINUED = 0
   ALIGNMENT = 4
   TEXT_WRAP = 4
   MIN_WIDOWS = 1
   MIN_ORPHAN = 1
   MAX_LINES = -1
   MASK = <<"NNNNNNNN0D00">>
   NULL_VALUE = NULLP
   SPACING = 0
   BIDI_DIR = 0
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 142
   FRAME_ID = 0
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 152
   NAME = <<"F_POINT_NAME">>
   TAG = 171
   DISP_ORDER = 5
   FORMATFLAG = 805306628
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 0
   Y = 1536
   WD = 23552
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
   TEMPL_ID = 138
   FRAME_ID = 149
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 154
   NAME = <<"F_P_TYP">>
   TAG = 171
   DISP_ORDER = 7
   FORMATFLAG = 805306628
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 23552
   Y = 1536
   WD = 11264
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 261
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
   TEMPL_ID = 139
   FRAME_ID = 149
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 180
   NAME = <<"F_1">>
   TAG = 183
   DISP_ORDER = 11
   FORMATFLAG = 805339392
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 9216
   Y = 5120
   WD = 11776
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 167
   CONTINUED = 0
   ALIGNMENT = 68
   TEXT_WRAP = 1
   MIN_WIDOWS = 1
   MIN_ORPHAN = 0
   MAX_LINES = -1
   MASK = <<"dd-mm-yyyy">>
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
   ITEMID = 187
   NAME = <<"F_2">>
   TAG = 183
   DISP_ORDER = 13
   FORMATFLAG = 805339392
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 24576
   Y = 5120
   WD = 11776
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 168
   CONTINUED = 0
   ALIGNMENT = 68
   TEXT_WRAP = 1
   MIN_WIDOWS = 1
   MIN_ORPHAN = 0
   MAX_LINES = -1
   MASK = <<"dd-mm-yyyy">>
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
   ITEMID = 191
   NAME = <<"F_DATE1">>
   TAG = 194
   DISP_ORDER = 15
   FORMATFLAG = 805339395
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 46592
   Y = 512
   WD = 9216
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 3
   CONTINUED = 0
   ALIGNMENT = 68
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

DEFINE  SRW2_QUERY
BEGIN
   ITEMID = 103
   NAME = <<"Q_1">>
   TAG = 0
   DISP_ORDER = 0
   QUERYLFID = (TLONG)
<<"SELECT ALL POINT_TBL.POINT_NAME, sum(INVOICE_hist.INV_TOT)
FROM POINT_TBL, INVOICE_hist
WHERE POINT_TBL.P_TYP = 1
 AND (INVOICE_hist.POINT_CODE = POINT_TBL.POINT_CODE)  and
(inv_date between :DB and :DE )
group by POINT_TBL.POINT_NAME">>
   NET_LOGON = NULLP
   EXT_QUERY = NULLP
   TEMP_TABLE = NULLP
   TEMP_FLAGS = 0
   EXEC_FREQ = 0
   MAX_ROWS = 0
   X = 13517
   Y = 8192
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
   ITEMID = 153
   NAME = <<"B_POINT_NAME">>
   TAG = 198
   DISP_ORDER = 6
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 0
   Y = 0
   WD = 23552
   HT = 1536
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00000000 00000000 00005c00 00000600 
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
   ASSOCOBJ = 152
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 129
   FRAME_ID = 148
   ALTXT = NULLP
   HEADERS = NULLP
   LABFIELD = 0
   ACCKEY = NULLP
END

DEFINE  SRW2_BOILERPLATE
BEGIN
   ITEMID = 155
   NAME = <<"B_P_TYP">>
   TAG = 198
   DISP_ORDER = 8
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 23552
   Y = 0
   WD = 11264
   HT = 1536
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00005c00 00000000 00002c00 00000600 
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
   ASSOCOBJ = 154
   PERS_FLAGS = 0
   GROUP_NODE = 0
   GN_TYPE = 0
   NULL_IND1 = 0
   NULL_IND2 = 0
   NULL_IND3 = 0
   TEMPL_ID = 130
   FRAME_ID = 148
   ALTXT = NULLP
   HEADERS = NULLP
   LABFIELD = 0
   ACCKEY = NULLP
END

DEFINE  SRW2_BOILERPLATE
BEGIN
   ITEMID = 157
   NAME = <<"B_Total">>
   TAG = 158
   DISP_ORDER = 9
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 17408
   Y = 3072
   WD = 6144
   HT = 1536
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00004400 00000c00 00001800 00000600 
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
   TEMPL_ID = 133
   FRAME_ID = 156
   ALTXT = NULLP
   HEADERS = NULLP
   LABFIELD = 0
   ACCKEY = NULLP
END

DEFINE  SRW2_BOILERPLATE
BEGIN
   ITEMID = 175
   NAME = <<"B_1">>
   TAG = 206
   DISP_ORDER = 10
   FORMATFLAG = 805339392
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 10752
   Y = 2048
   WD = 22528
   HT = 2048
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00002a00 00000800 00005800 00000800 
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
   ITEMID = 184
   NAME = <<"B_2">>
   TAG = 158
   DISP_ORDER = 12
   FORMATFLAG = 805339392
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 6827
   Y = 5120
   WD = 1877
   HT = 1536
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00001aab 00001400 00000755 00000600 
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
   ITEMID = 188
   NAME = <<"B_3">>
   TAG = 158
   DISP_ORDER = 14
   FORMATFLAG = 805339392
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 22187
   Y = 5120
   WD = 1877
   HT = 1536
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
000056ab 00001400 00000755 00000600 
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
   ITEMID = 195
   NAME = <<"B_4">>
   TAG = 158
   DISP_ORDER = 16
   FORMATFLAG = 805339392
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 40448
   Y = 512
   WD = 6144
   HT = 1451
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00009e00 00000200 00001800 000005ab 
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

