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
   groupid = 616
   stringid = 0
   lfid = 0
   cs = 560
   len = 4
   str = (BINARY)
<<"
4f2e4400 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 621
   stringid = 0
   lfid = 0
   cs = 560
   len = 4
   str = (BINARY)
<<"
4f2e5300 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 628
   stringid = 0
   lfid = 0
   cs = 560
   len = 3
   str = (BINARY)
<<"
49440000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 632
   stringid = 0
   lfid = 0
   cs = 560
   len = 4
   str = (BINARY)
<<"
41474500 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 670
   stringid = 0
   lfid = 0
   cs = 560
   len = 5
   str = (BINARY)
<<"
4e414d45 00000000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 685
   stringid = 0
   lfid = 0
   cs = 560
   len = 4
   str = (BINARY)
<<"
53455800 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 688
   stringid = 0
   lfid = 0
   cs = 560
   len = 18
   str = (BINARY)
<<"
4558414d 494e4941 54494f4e 20434152 44000000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 704
   stringid = 0
   lfid = 0
   cs = 560
   len = 7
   str = (BINARY)
<<"
42204441 54450000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 718
   stringid = 0
   lfid = 0
   cs = 560
   len = 10
   str = (BINARY)
<<"
4558414d 20444154 45000000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 724
   stringid = 0
   lfid = 0
   cs = 560
   len = 4
   str = (BINARY)
<<"
432f4f00 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 725
   stringid = 0
   lfid = 0
   cs = 560
   len = 4
   str = (BINARY)
<<"
48544e00 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 726
   stringid = 0
   lfid = 0
   cs = 560
   len = 5
   str = (BINARY)
<<"
4944444d 00000000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 727
   stringid = 0
   lfid = 0
   cs = 560
   len = 6
   str = (BINARY)
<<"
4e494444 4d000000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 728
   stringid = 0
   lfid = 0
   cs = 560
   len = 8
   str = (BINARY)
<<"
43414e44 49414300 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 730
   stringid = 0
   lfid = 0
   cs = 560
   len = 6
   str = (BINARY)
<<"
52454e41 4c000000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 732
   stringid = 0
   lfid = 0
   cs = 560
   len = 7
   str = (BINARY)
<<"
4f544845 52530000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 737
   stringid = 0
   lfid = 0
   cs = 560
   len = 14
   str = (BINARY)
<<"
4d454449 43414c20 44525547 53000000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 740
   stringid = 0
   lfid = 0
   cs = 560
   len = 12
   str = (BINARY)
<<"
4f504854 48204452 55475300 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 746
   stringid = 0
   lfid = 0
   cs = 560
   len = 15
   str = (BINARY)
<<"
45585452 454d2043 48414e47 45530000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 748
   stringid = 0
   lfid = 0
   cs = 560
   len = 4
   str = (BINARY)
<<"
562e4100 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 749
   stringid = 0
   lfid = 0
   cs = 560
   len = 4
   str = (BINARY)
<<"
4c494400 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 750
   stringid = 0
   lfid = 0
   cs = 560
   len = 6
   str = (BINARY)
<<"
434f4e4a 2e000000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 751
   stringid = 0
   lfid = 0
   cs = 560
   len = 4
   str = (BINARY)
<<"
4c414300 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 752
   stringid = 0
   lfid = 0
   cs = 560
   len = 4
   str = (BINARY)
<<"
53434900 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 753
   stringid = 0
   lfid = 0
   cs = 560
   len = 6
   str = (BINARY)
<<"
452e4f2e 4d000000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 754
   stringid = 0
   lfid = 0
   cs = 560
   len = 2
   str = (BINARY)
<<"
0a000000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 754
   stringid = 1
   lfid = 0
   cs = 560
   len = 2
   str = (BINARY)
<<"
0a000000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 754
   stringid = 2
   lfid = 0
   cs = 560
   len = 7
   str = (BINARY)
<<"
434f524e 45410000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 755
   stringid = 0
   lfid = 0
   cs = 560
   len = 4
   str = (BINARY)
<<"
412e4300 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 756
   stringid = 0
   lfid = 0
   cs = 560
   len = 4
   str = (BINARY)
<<"
49722e00 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 757
   stringid = 0
   lfid = 0
   cs = 560
   len = 6
   str = (BINARY)
<<"
50555049 4c000000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 758
   stringid = 0
   lfid = 0
   cs = 560
   len = 5
   str = (BINARY)
<<"
4c454e53 00000000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 759
   stringid = 0
   lfid = 0
   cs = 560
   len = 2
   str = (BINARY)
<<"
54000000 
">>
END

DEFINE  ROSSTRINGS
BEGIN
   groupid = 761
   stringid = 0
   lfid = 0
   cs = 560
   len = 2
   str = (BINARY)
<<"
4b000000 
">>
END

DEFINE  TOOL_MODULE
BEGIN
   PRODUCT = 16
     <<"SQL*ReportWriter">>
   MODTYPE = 6
     <<"REPORT">>
   OWNER = (VARCHAR) NULLP
   MODNAME = 11
     <<"pation_kard">>
   MODID = 0
   TCS_VER = 16777216
   NEXT_ITEMID = 762
   CREATOR = 2
     <<"DR">>
   CREATE_DATE = <<"120106.09.16 23:05:31">>
   CREATE_VER = -1744299520
   MODIFIER = 2
     <<"DR">>
   MOD_DATE = <<"120126.11.09 01:26:37">>
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
   ORIENT = 132
   UNITS_WID = 110000
   UNITS_HGT = 85000
   CHAR_WID = 80
   CHAR_HGT = 66
   BODY_WID = 81920
   BODY_HGT = 53248
   PAGE_WID = 90112
   PAGE_HGT = 69632
   PRINT_WID = 90112
   PRINT_HGT = 69632
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
   HALIGN = 1
   VALIGN = 0
   RRECTCNR_WD = 1130
   RRECTCNR_HT = 1130
   SPACING = 0
   JUSTIFIC = 64
   ARROWSTYLE = 0
   UITAG = 745
   NEXTLISTID = 2
   IDROLESLIST = 1
   BIDI_DIR = 1
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
   WINDOW_HT = 467
   DFLT_TYPE = 0
   UIFLAGS = 8193
   GRIDINTC = 1
   GRIDSNPC = 4
   HALIGN = 0
   VALIGN = 0
   DECURREF_ID = 2
   GRPMAXROW = 0
   MOD_DATE = <<"120106.09.16 23:05:31">>
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
   XML_TAG = <<"PATION_KARD">>
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
   UITAG = 447
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
   ITEMID = 425
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
   ITEMID = 447
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
   ITEMID = 538
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
   ITEMID = 585
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
   LINEFORE = 76
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
   ITEMID = 614
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = NULLP
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 0
   TEXTBACK = 0
   LINEPAT = 1
   LINEFORE = 78
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
   ITEMID = 626
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
   FILLBACK = 195
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
   ITEMID = 630
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
   FILLBACK = 195
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
   ITEMID = 673
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
   ITEMID = 675
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
   FILLPAT = 0
   FILLFORE = 0
   FILLBACK = 209
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
   ITEMID = 677
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
   FILLPAT = 0
   FILLFORE = 0
   FILLBACK = 214
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
   ITEMID = 680
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
   ITEMID = 683
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
   ITEMID = 684
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = <<"Courier New">>
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 4
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
   ITEMID = 693
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
   FILLPAT = 0
   FILLFORE = 0
   FILLBACK = 195
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
   ITEMID = 696
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
   FONTSIZE = 1600
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
   ITEMID = 700
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = <<"Courier New">>
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 78
   TEXTBACK = 0
   LINEPAT = 1
   LINEFORE = 0
   LINEBACK = 1
   FILLPAT = 1
   FILLFORE = 0
   FILLBACK = 1
   FONTFACE = 0
   FONTSIZE = 1200
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
   ITEMID = 701
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = <<"Courier New">>
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 77
   TEXTBACK = 0
   LINEPAT = 1
   LINEFORE = 77
   LINEBACK = 1
   FILLPAT = 1
   FILLFORE = 0
   FILLBACK = 77
   FONTFACE = 0
   FONTSIZE = 1200
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
   ITEMID = 707
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = <<"Courier New">>
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 4
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
   ITEMID = 722
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
   ITEMID = 735
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
   FILLPAT = 0
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
   ITEMID = 742
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
   ITEMID = 744
   CM_TEXT = NULLP
   CM_FILL = NULLP
   CM_BORD = <<"Courier New">>
   PENWID = 0
   ADD_FLAGS = 0
   TEXTPAT = 0
   TEXTFORE = 79
   TEXTBACK = 0
   LINEPAT = 1
   LINEFORE = 0
   LINEBACK = 1
   FILLPAT = 0
   FILLFORE = 0
   FILLBACK = 218
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
   ITEMID = 745
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

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 108
   ALIAS = <<"P_ID">>
   EXPR = <<"PATION_TBL.P_ID">>
   DESC_EXPR = <<"P_ID">>
   SEL_ORDER = 1
   DATA_TYPE = 0
   WIDTH = 22
   SCALE = 0
   PRECISION = 10
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 111
   ALIAS = <<"P_NAME">>
   EXPR = <<"PATION_TBL.P_NAME">>
   DESC_EXPR = <<"P_NAME">>
   SEL_ORDER = 2
   DATA_TYPE = 0
   WIDTH = 100
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 114
   ALIAS = <<"B_DATE">>
   EXPR = <<"PATION_TBL.B_DATE">>
   DESC_EXPR = <<"B_DATE">>
   SEL_ORDER = 3
   DATA_TYPE = 0
   WIDTH = 9
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 117
   ALIAS = <<"AGEE">>
   EXPR = <<"PATION_TBL.AGEE">>
   DESC_EXPR = <<"AGEE">>
   SEL_ORDER = 4
   DATA_TYPE = 0
   WIDTH = 22
   SCALE = 0
   PRECISION = 3
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 120
   ALIAS = <<"GENDER">>
   EXPR = <<"PATION_TBL.GENDER">>
   DESC_EXPR = <<"GENDER">>
   SEL_ORDER = 5
   DATA_TYPE = 0
   WIDTH = 22
   SCALE = 0
   PRECISION = 1
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 123
   ALIAS = <<"P_DATE">>
   EXPR = <<"HGZ_TBL.P_DATE">>
   DESC_EXPR = <<"P_DATE">>
   SEL_ORDER = 6
   DATA_TYPE = 0
   WIDTH = 9
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 126
   ALIAS = <<"HTN_R">>
   EXPR = <<"PATION_TBL.HTN_R">>
   DESC_EXPR = <<"HTN_R">>
   SEL_ORDER = 7
   DATA_TYPE = 0
   WIDTH = 50
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 129
   ALIAS = <<"IDDM_R">>
   EXPR = <<"PATION_TBL.IDDM_R">>
   DESC_EXPR = <<"IDDM_R">>
   SEL_ORDER = 8
   DATA_TYPE = 0
   WIDTH = 50
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 132
   ALIAS = <<"NIDDM_R">>
   EXPR = <<"PATION_TBL.NIDDM_R">>
   DESC_EXPR = <<"NIDDM_R">>
   SEL_ORDER = 9
   DATA_TYPE = 0
   WIDTH = 50
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 135
   ALIAS = <<"CANDIADIAC_R">>
   EXPR = <<"PATION_TBL.CANDIADIAC_R">>
   DESC_EXPR = <<"CANDIADIAC_R">>
   SEL_ORDER = 10
   DATA_TYPE = 0
   WIDTH = 50
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 138
   ALIAS = <<"RENAL_R">>
   EXPR = <<"PATION_TBL.RENAL_R">>
   DESC_EXPR = <<"RENAL_R">>
   SEL_ORDER = 11
   DATA_TYPE = 0
   WIDTH = 50
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 141
   ALIAS = <<"OTHR_R">>
   EXPR = <<"PATION_TBL.OTHR_R">>
   DESC_EXPR = <<"OTHR_R">>
   SEL_ORDER = 12
   DATA_TYPE = 0
   WIDTH = 50
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 144
   ALIAS = <<"MED">>
   EXPR = <<"PATION_TBL.MED">>
   DESC_EXPR = <<"MED">>
   SEL_ORDER = 13
   DATA_TYPE = 0
   WIDTH = 100
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 147
   ALIAS = <<"OPHTH">>
   EXPR = <<"PATION_TBL.OPHTH">>
   DESC_EXPR = <<"OPHTH">>
   SEL_ORDER = 14
   DATA_TYPE = 0
   WIDTH = 100
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 150
   ALIAS = <<"CO">>
   EXPR = <<"HGZ_TBL.CO">>
   DESC_EXPR = <<"CO">>
   SEL_ORDER = 15
   DATA_TYPE = 0
   WIDTH = 1000
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 153
   ALIAS = <<"VA">>
   EXPR = <<"HGZ_TBL.VA">>
   DESC_EXPR = <<"VA">>
   SEL_ORDER = 16
   DATA_TYPE = 0
   WIDTH = 500
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 156
   ALIAS = <<"LID">>
   EXPR = <<"HGZ_TBL.LID">>
   DESC_EXPR = <<"LID">>
   SEL_ORDER = 17
   DATA_TYPE = 0
   WIDTH = 500
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 159
   ALIAS = <<"CONJ">>
   EXPR = <<"HGZ_TBL.CONJ">>
   DESC_EXPR = <<"CONJ">>
   SEL_ORDER = 18
   DATA_TYPE = 0
   WIDTH = 500
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 162
   ALIAS = <<"LAC">>
   EXPR = <<"HGZ_TBL.LAC">>
   DESC_EXPR = <<"LAC">>
   SEL_ORDER = 19
   DATA_TYPE = 0
   WIDTH = 500
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 165
   ALIAS = <<"EOM">>
   EXPR = <<"HGZ_TBL.EOM">>
   DESC_EXPR = <<"EOM">>
   SEL_ORDER = 20
   DATA_TYPE = 0
   WIDTH = 500
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 168
   ALIAS = <<"PUPIL">>
   EXPR = <<"HGZ_TBL.PUPIL">>
   DESC_EXPR = <<"PUPIL">>
   SEL_ORDER = 21
   DATA_TYPE = 0
   WIDTH = 500
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 171
   ALIAS = <<"LENS">>
   EXPR = <<"HGZ_TBL.LENS">>
   DESC_EXPR = <<"LENS">>
   SEL_ORDER = 22
   DATA_TYPE = 0
   WIDTH = 500
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 174
   ALIAS = <<"T">>
   EXPR = <<"HGZ_TBL.T">>
   DESC_EXPR = <<"T">>
   SEL_ORDER = 23
   DATA_TYPE = 0
   WIDTH = 22
   SCALE = 3
   PRECISION = 10
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 177
   ALIAS = <<"CORNEA_L">>
   EXPR = <<"HGZ_TBL.CORNEA_L">>
   DESC_EXPR = <<"CORNEA_L">>
   SEL_ORDER = 24
   DATA_TYPE = 0
   WIDTH = 200
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 180
   ALIAS = <<"VA_OS">>
   EXPR = <<"HGZ_TBL.VA_OS">>
   DESC_EXPR = <<"VA_OS">>
   SEL_ORDER = 25
   DATA_TYPE = 0
   WIDTH = 500
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 183
   ALIAS = <<"LID_OS">>
   EXPR = <<"HGZ_TBL.LID_OS">>
   DESC_EXPR = <<"LID_OS">>
   SEL_ORDER = 26
   DATA_TYPE = 0
   WIDTH = 500
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 186
   ALIAS = <<"CONJ_OS">>
   EXPR = <<"HGZ_TBL.CONJ_OS">>
   DESC_EXPR = <<"CONJ_OS">>
   SEL_ORDER = 27
   DATA_TYPE = 0
   WIDTH = 500
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 189
   ALIAS = <<"LAC_OS">>
   EXPR = <<"HGZ_TBL.LAC_OS">>
   DESC_EXPR = <<"LAC_OS">>
   SEL_ORDER = 28
   DATA_TYPE = 0
   WIDTH = 500
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 192
   ALIAS = <<"EOM_OS">>
   EXPR = <<"HGZ_TBL.EOM_OS">>
   DESC_EXPR = <<"EOM_OS">>
   SEL_ORDER = 29
   DATA_TYPE = 0
   WIDTH = 500
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 195
   ALIAS = <<"AC_OS">>
   EXPR = <<"HGZ_TBL.AC_OS">>
   DESC_EXPR = <<"AC_OS">>
   SEL_ORDER = 30
   DATA_TYPE = 0
   WIDTH = 500
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 198
   ALIAS = <<"PUPIL_OS">>
   EXPR = <<"HGZ_TBL.PUPIL_OS">>
   DESC_EXPR = <<"PUPIL_OS">>
   SEL_ORDER = 31
   DATA_TYPE = 0
   WIDTH = 500
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 201
   ALIAS = <<"LENS_OS">>
   EXPR = <<"HGZ_TBL.LENS_OS">>
   DESC_EXPR = <<"LENS_OS">>
   SEL_ORDER = 32
   DATA_TYPE = 0
   WIDTH = 500
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 204
   ALIAS = <<"T_OS">>
   EXPR = <<"HGZ_TBL.T_OS">>
   DESC_EXPR = <<"T_OS">>
   SEL_ORDER = 33
   DATA_TYPE = 0
   WIDTH = 22
   SCALE = 3
   PRECISION = 10
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 207
   ALIAS = <<"CORNEA_R">>
   EXPR = <<"HGZ_TBL.CORNEA_R">>
   DESC_EXPR = <<"CORNEA_R">>
   SEL_ORDER = 34
   DATA_TYPE = 0
   WIDTH = 200
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 210
   ALIAS = <<"OD_SPH">>
   EXPR = <<"HGZ_TBL.OD_SPH">>
   DESC_EXPR = <<"OD_SPH">>
   SEL_ORDER = 35
   DATA_TYPE = 0
   WIDTH = 22
   SCALE = 3
   PRECISION = 10
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 213
   ALIAS = <<"OD_CYL">>
   EXPR = <<"HGZ_TBL.OD_CYL">>
   DESC_EXPR = <<"OD_CYL">>
   SEL_ORDER = 36
   DATA_TYPE = 0
   WIDTH = 22
   SCALE = 3
   PRECISION = 10
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 216
   ALIAS = <<"OD_AX">>
   EXPR = <<"HGZ_TBL.OD_AX">>
   DESC_EXPR = <<"OD_AX">>
   SEL_ORDER = 37
   DATA_TYPE = 0
   WIDTH = 22
   SCALE = 3
   PRECISION = 10
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 219
   ALIAS = <<"OD_READ">>
   EXPR = <<"HGZ_TBL.OD_READ">>
   DESC_EXPR = <<"OD_READ">>
   SEL_ORDER = 38
   DATA_TYPE = 0
   WIDTH = 22
   SCALE = 3
   PRECISION = 10
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 222
   ALIAS = <<"OD_VA">>
   EXPR = <<"HGZ_TBL.OD_VA">>
   DESC_EXPR = <<"OD_VA">>
   SEL_ORDER = 39
   DATA_TYPE = 0
   WIDTH = 22
   SCALE = 3
   PRECISION = 10
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 225
   ALIAS = <<"AC">>
   EXPR = <<"HGZ_TBL.AC">>
   DESC_EXPR = <<"AC">>
   SEL_ORDER = 40
   DATA_TYPE = 0
   WIDTH = 500
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 228
   ALIAS = <<"OD_IPD">>
   EXPR = <<"HGZ_TBL.OD_IPD">>
   DESC_EXPR = <<"OD_IPD">>
   SEL_ORDER = 41
   DATA_TYPE = 0
   WIDTH = 22
   SCALE = 3
   PRECISION = 10
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 231
   ALIAS = <<"OS_SPH">>
   EXPR = <<"HGZ_TBL.OS_SPH">>
   DESC_EXPR = <<"OS_SPH">>
   SEL_ORDER = 42
   DATA_TYPE = 0
   WIDTH = 22
   SCALE = 3
   PRECISION = 10
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 234
   ALIAS = <<"OS_CYL">>
   EXPR = <<"HGZ_TBL.OS_CYL">>
   DESC_EXPR = <<"OS_CYL">>
   SEL_ORDER = 43
   DATA_TYPE = 0
   WIDTH = 22
   SCALE = 3
   PRECISION = 10
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 237
   ALIAS = <<"OS_AX">>
   EXPR = <<"HGZ_TBL.OS_AX">>
   DESC_EXPR = <<"OS_AX">>
   SEL_ORDER = 44
   DATA_TYPE = 0
   WIDTH = 22
   SCALE = 3
   PRECISION = 10
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 240
   ALIAS = <<"OS_READ">>
   EXPR = <<"HGZ_TBL.OS_READ">>
   DESC_EXPR = <<"OS_READ">>
   SEL_ORDER = 45
   DATA_TYPE = 0
   WIDTH = 22
   SCALE = 3
   PRECISION = 10
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 243
   ALIAS = <<"OS_VA">>
   EXPR = <<"HGZ_TBL.OS_VA">>
   DESC_EXPR = <<"OS_VA">>
   SEL_ORDER = 46
   DATA_TYPE = 0
   WIDTH = 22
   SCALE = 3
   PRECISION = 10
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 246
   ALIAS = <<"OS_IPD">>
   EXPR = <<"HGZ_TBL.OS_IPD">>
   DESC_EXPR = <<"OS_IPD">>
   SEL_ORDER = 47
   DATA_TYPE = 0
   WIDTH = 22
   SCALE = 3
   PRECISION = 10
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 249
   ALIAS = <<"R">>
   EXPR = <<"HGZ_TBL.R">>
   DESC_EXPR = <<"R">>
   SEL_ORDER = 48
   DATA_TYPE = 0
   WIDTH = 1000
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 252
   ALIAS = <<"H_REM">>
   EXPR = <<"HGZ_TBL.H_REM">>
   DESC_EXPR = <<"H_REM">>
   SEL_ORDER = 49
   DATA_TYPE = 0
   WIDTH = 1000
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 255
   ALIAS = <<"SEL">>
   EXPR = <<"HGZ_TBL.SEL">>
   DESC_EXPR = <<"SEL">>
   SEL_ORDER = 50
   DATA_TYPE = 0
   WIDTH = 22
   SCALE = 0
   PRECISION = 1
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 258
   ALIAS = <<"ASBKIA">>
   EXPR = <<"HGZ_TBL.ASBKIA">>
   DESC_EXPR = <<"ASBKIA">>
   SEL_ORDER = 51
   DATA_TYPE = 0
   WIDTH = 22
   SCALE = 0
   PRECISION = 1
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 261
   ALIAS = <<"SCI_OS">>
   EXPR = <<"HGZ_TBL.SCI_OS">>
   DESC_EXPR = <<"SCI_OS">>
   SEL_ORDER = 52
   DATA_TYPE = 0
   WIDTH = 500
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 264
   ALIAS = <<"SCI">>
   EXPR = <<"HGZ_TBL.SCI">>
   DESC_EXPR = <<"SCI">>
   SEL_ORDER = 53
   DATA_TYPE = 0
   WIDTH = 500
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 267
   ALIAS = <<"IR">>
   EXPR = <<"HGZ_TBL.IR">>
   DESC_EXPR = <<"IR">>
   SEL_ORDER = 54
   DATA_TYPE = 0
   WIDTH = 500
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 270
   ALIAS = <<"OS_IR">>
   EXPR = <<"HGZ_TBL.OS_IR">>
   DESC_EXPR = <<"OS_IR">>
   SEL_ORDER = 55
   DATA_TYPE = 0
   WIDTH = 500
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 273
   ALIAS = <<"K">>
   EXPR = <<"HGZ_TBL.K">>
   DESC_EXPR = <<"K">>
   SEL_ORDER = 56
   DATA_TYPE = 0
   WIDTH = 500
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 276
   ALIAS = <<"OS_K">>
   EXPR = <<"HGZ_TBL.OS_K">>
   DESC_EXPR = <<"OS_K">>
   SEL_ORDER = 57
   DATA_TYPE = 0
   WIDTH = 500
   SCALE = 0
   PRECISION = 0
   QUERYID = 103
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 456
   ALIAS = <<"P_ID">>
   EXPR = <<"HGZ_TBL_PHOTOS.P_ID">>
   DESC_EXPR = <<"P_ID">>
   SEL_ORDER = 1
   DATA_TYPE = 0
   WIDTH = 22
   SCALE = 0
   PRECISION = 10
   QUERYID = 453
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 459
   ALIAS = <<"PHOTO">>
   EXPR = <<"HGZ_TBL_PHOTOS.PHOTO">>
   DESC_EXPR = <<"PHOTO">>
   SEL_ORDER = 2
   DATA_TYPE = 0
   WIDTH = 0
   SCALE = 0
   PRECISION = 0
   QUERYID = 453
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 462
   ALIAS = <<"E_TYPE">>
   EXPR = <<"HGZ_TBL_PHOTOS.E_TYPE">>
   DESC_EXPR = <<"E_TYPE">>
   SEL_ORDER = 3
   DATA_TYPE = 0
   WIDTH = 22
   SCALE = 0
   PRECISION = 1
   QUERYID = 453
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 465
   ALIAS = <<"P_DATE">>
   EXPR = <<"HGZ_TBL_PHOTOS.P_DATE">>
   DESC_EXPR = <<"P_DATE">>
   SEL_ORDER = 4
   DATA_TYPE = 0
   WIDTH = 9
   SCALE = 0
   PRECISION = 0
   QUERYID = 453
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 524
   ALIAS = <<"P_ID">>
   EXPR = <<"HGZ_TBL_PHOTOS.P_ID">>
   DESC_EXPR = <<"P_ID">>
   SEL_ORDER = 1
   DATA_TYPE = 0
   WIDTH = 22
   SCALE = 0
   PRECISION = 10
   QUERYID = 521
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 527
   ALIAS = <<"PHOTO">>
   EXPR = <<"HGZ_TBL_PHOTOS.PHOTO">>
   DESC_EXPR = <<"PHOTO">>
   SEL_ORDER = 2
   DATA_TYPE = 0
   WIDTH = 0
   SCALE = 0
   PRECISION = 0
   QUERYID = 521
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 530
   ALIAS = <<"E_TYPE">>
   EXPR = <<"HGZ_TBL_PHOTOS.E_TYPE">>
   DESC_EXPR = <<"E_TYPE">>
   SEL_ORDER = 3
   DATA_TYPE = 0
   WIDTH = 22
   SCALE = 0
   PRECISION = 1
   QUERYID = 521
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 533
   ALIAS = <<"P_DATE">>
   EXPR = <<"HGZ_TBL_PHOTOS.P_DATE">>
   DESC_EXPR = <<"P_DATE">>
   SEL_ORDER = 4
   DATA_TYPE = 0
   WIDTH = 9
   SCALE = 0
   PRECISION = 0
   QUERYID = 521
   ODATA_TYPE = 0
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 555
   ALIAS = <<"P_ID">>
   EXPR = <<"HGZ_TBL_PHOTOS.P_ID">>
   DESC_EXPR = <<"P_ID">>
   SEL_ORDER = 1
   DATA_TYPE = 1
   WIDTH = 22
   SCALE = 0
   PRECISION = 10
   QUERYID = 552
   ODATA_TYPE = 2
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 558
   ALIAS = <<"PHOTO">>
   EXPR = <<"HGZ_TBL_PHOTOS.PHOTO">>
   DESC_EXPR = <<"PHOTO">>
   SEL_ORDER = 2
   DATA_TYPE = 6
   WIDTH = 0
   SCALE = 0
   PRECISION = 0
   QUERYID = 552
   ODATA_TYPE = 24
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 561
   ALIAS = <<"E_TYPE">>
   EXPR = <<"HGZ_TBL_PHOTOS.E_TYPE">>
   DESC_EXPR = <<"E_TYPE">>
   SEL_ORDER = 3
   DATA_TYPE = 1
   WIDTH = 22
   SCALE = 0
   PRECISION = 1
   QUERYID = 552
   ODATA_TYPE = 2
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 564
   ALIAS = <<"P_DATE">>
   EXPR = <<"HGZ_TBL_PHOTOS.P_DATE">>
   DESC_EXPR = <<"P_DATE">>
   SEL_ORDER = 4
   DATA_TYPE = 2
   WIDTH = 9
   SCALE = 0
   PRECISION = 0
   QUERYID = 552
   ODATA_TYPE = 12
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 570
   ALIAS = <<"P_ID">>
   EXPR = <<"HGZ_TBL_PHOTOS.P_ID">>
   DESC_EXPR = <<"P_ID">>
   SEL_ORDER = 1
   DATA_TYPE = 1
   WIDTH = 22
   SCALE = 0
   PRECISION = 10
   QUERYID = 567
   ODATA_TYPE = 2
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 573
   ALIAS = <<"PHOTO">>
   EXPR = <<"HGZ_TBL_PHOTOS.PHOTO">>
   DESC_EXPR = <<"PHOTO">>
   SEL_ORDER = 2
   DATA_TYPE = 6
   WIDTH = 0
   SCALE = 0
   PRECISION = 0
   QUERYID = 567
   ODATA_TYPE = 24
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 576
   ALIAS = <<"E_TYPE">>
   EXPR = <<"HGZ_TBL_PHOTOS.E_TYPE">>
   DESC_EXPR = <<"E_TYPE">>
   SEL_ORDER = 3
   DATA_TYPE = 1
   WIDTH = 22
   SCALE = 0
   PRECISION = 1
   QUERYID = 567
   ODATA_TYPE = 2
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_ELEMENT
BEGIN
   ITEMID = 579
   ALIAS = <<"P_DATE">>
   EXPR = <<"HGZ_TBL_PHOTOS.P_DATE">>
   DESC_EXPR = <<"P_DATE">>
   SEL_ORDER = 4
   DATA_TYPE = 2
   WIDTH = 9
   SCALE = 0
   PRECISION = 0
   QUERYID = 567
   ODATA_TYPE = 12
   RELOPLST = 0
   PERS_FLAGS = 0
END

DEFINE  SRW2_GROUP
BEGIN
   ITEMID = 104
   NAME = <<"G_P_ID">>
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
   X = 10937
   Y = 3344
   WD = 12603
   HT = 46928
   DFLT_DIR = 32769
   PERS_FLAGS = 0
   MAIL_TEXT = NULLP
   XML_TAG = <<"G_P_ID">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   OUTER_XML_TAG = <<"LIST_G_P_ID">>
   OUTER_ATTR = NULLP
END

DEFINE  SRW2_GROUP
BEGIN
   ITEMID = 454
   NAME = <<"G_P_ID1">>
   TAG = 0
   DISP_ORDER = 3
   PTAG = 0
   QUERY_ID = 453
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
   X = 71499
   Y = 7356
   WD = 9169
   HT = 9128
   DFLT_DIR = 1
   PERS_FLAGS = 0
   MAIL_TEXT = NULLP
   XML_TAG = <<"G_P_ID1">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   OUTER_XML_TAG = <<"LIST_G_P_ID1">>
   OUTER_ATTR = NULLP
END

DEFINE  SRW2_GROUP
BEGIN
   ITEMID = 522
   NAME = <<"G_P_ID2">>
   TAG = 0
   DISP_ORDER = 5
   PTAG = 0
   QUERY_ID = 521
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
   X = 73206
   Y = 24508
   WD = 9169
   HT = 7728
   DFLT_DIR = 1
   PERS_FLAGS = 0
   MAIL_TEXT = NULLP
   XML_TAG = <<"G_P_ID2">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   OUTER_XML_TAG = <<"LIST_G_P_ID2">>
   OUTER_ATTR = NULLP
END

DEFINE  SRW2_GROUP
BEGIN
   ITEMID = 553
   NAME = <<"G_P_ID3">>
   TAG = 0
   DISP_ORDER = 7
   PTAG = 0
   QUERY_ID = 552
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
   X = 74145
   Y = 40550
   WD = 9169
   HT = 7728
   DFLT_DIR = 1
   PERS_FLAGS = 0
   MAIL_TEXT = NULLP
   XML_TAG = <<"G_P_ID3">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   OUTER_XML_TAG = <<"LIST_G_P_ID3">>
   OUTER_ATTR = NULLP
END

DEFINE  SRW2_GROUP
BEGIN
   ITEMID = 568
   NAME = <<"G_P_ID4">>
   TAG = 0
   DISP_ORDER = 9
   PTAG = 0
   QUERY_ID = 567
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
   X = 41461
   Y = 8806
   WD = 9169
   HT = 7728
   DFLT_DIR = 1
   PERS_FLAGS = 0
   MAIL_TEXT = NULLP
   XML_TAG = <<"G_P_ID4">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   OUTER_XML_TAG = <<"LIST_G_P_ID4">>
   OUTER_ATTR = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 89
   NAME = <<"PRINTJOB">>
   TAG = 0
   DISP_ORDER = 24
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
   DISP_ORDER = 23
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
   DISP_ORDER = 22
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
   DISP_ORDER = 21
   GROUP_ID = 1
   SOURCE = 2
   SOURCE_ID = 0
   COMPUTE_ID = 0
   PROD_ORDER = NULLP
   RESET_ID = 0
   NULL_VALUE = <<"Landscape">>
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
   DISP_ORDER = 20
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
   DISP_ORDER = 19
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
   DISP_ORDER = 18
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
   DISP_ORDER = 17
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
   DISP_ORDER = 16
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
   DISP_ORDER = 15
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
   DISP_ORDER = 14
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
   NAME = <<"P_I">>
   TAG = 0
   DISP_ORDER = 25
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
   DFLT_LBL = <<"P I">>
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
   XML_TAG = <<"P_I">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 106
   NAME = <<"P_D">>
   TAG = 0
   DISP_ORDER = 26
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
   DFLT_LBL = <<"P D">>
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
   XML_TAG = <<"P_D">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 107
   NAME = <<"P_ID">>
   TAG = 0
   DISP_ORDER = 0
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 108
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
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"P Id">>
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
   XML_TAG = <<"P_ID">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 110
   NAME = <<"P_NAME">>
   TAG = 0
   DISP_ORDER = 1
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 111
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 100
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"P Name">>
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
   XML_TAG = <<"P_NAME">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 113
   NAME = <<"B_DATE">>
   TAG = 0
   DISP_ORDER = 2
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 114
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 2
   FILE_TYPE = 1
   WIDTH = 9
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"B Date">>
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
   XML_TAG = <<"B_DATE">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 116
   NAME = <<"AGEE">>
   TAG = 0
   DISP_ORDER = 3
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 117
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
   PRECISION = 3
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Agee">>
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
   XML_TAG = <<"AGEE">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 119
   NAME = <<"GENDER">>
   TAG = 0
   DISP_ORDER = 4
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 120
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
   PRECISION = 1
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Gender">>
   DFLT_WID = 30000
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
   XML_TAG = <<"GENDER">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 122
   NAME = <<"P_DATE">>
   TAG = 0
   DISP_ORDER = 5
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 123
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 2
   FILE_TYPE = 1
   WIDTH = 9
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"P Date">>
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
   XML_TAG = <<"P_DATE">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 125
   NAME = <<"HTN_R">>
   TAG = 0
   DISP_ORDER = 6
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 126
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 50
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Htn R">>
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
   XML_TAG = <<"HTN_R">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 128
   NAME = <<"IDDM_R">>
   TAG = 0
   DISP_ORDER = 7
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 129
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 50
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Iddm R">>
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
   XML_TAG = <<"IDDM_R">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 131
   NAME = <<"NIDDM_R">>
   TAG = 0
   DISP_ORDER = 8
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 132
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 50
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Niddm R">>
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
   XML_TAG = <<"NIDDM_R">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 134
   NAME = <<"CANDIADIAC_R">>
   TAG = 0
   DISP_ORDER = 9
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 135
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 50
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Candiadiac R">>
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
   XML_TAG = <<"CANDIADIAC_R">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 137
   NAME = <<"RENAL_R">>
   TAG = 0
   DISP_ORDER = 10
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 138
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 50
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Renal R">>
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
   XML_TAG = <<"RENAL_R">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 140
   NAME = <<"OTHR_R">>
   TAG = 0
   DISP_ORDER = 11
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 141
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 50
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Othr R">>
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
   XML_TAG = <<"OTHR_R">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 143
   NAME = <<"MED">>
   TAG = 0
   DISP_ORDER = 12
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 144
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 100
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Med">>
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
   XML_TAG = <<"MED">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 146
   NAME = <<"OPHTH">>
   TAG = 0
   DISP_ORDER = 13
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 147
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 100
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Ophth">>
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
   XML_TAG = <<"OPHTH">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 149
   NAME = <<"CO">>
   TAG = 0
   DISP_ORDER = 15
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 150
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 1000
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Co">>
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
   XML_TAG = <<"CO">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 152
   NAME = <<"VA">>
   TAG = 0
   DISP_ORDER = 16
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 153
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 500
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Va">>
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
   XML_TAG = <<"VA">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 155
   NAME = <<"LID">>
   TAG = 0
   DISP_ORDER = 17
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 156
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 500
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Lid">>
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
   XML_TAG = <<"LID">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 158
   NAME = <<"CONJ">>
   TAG = 0
   DISP_ORDER = 18
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 159
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 500
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Conj">>
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
   XML_TAG = <<"CONJ">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 161
   NAME = <<"LAC">>
   TAG = 0
   DISP_ORDER = 19
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 162
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 500
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Lac">>
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
   XML_TAG = <<"LAC">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 164
   NAME = <<"EOM">>
   TAG = 0
   DISP_ORDER = 20
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 165
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 500
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Eom">>
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
   XML_TAG = <<"EOM">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 167
   NAME = <<"PUPIL">>
   TAG = 0
   DISP_ORDER = 21
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 168
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 500
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Pupil">>
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
   XML_TAG = <<"PUPIL">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 170
   NAME = <<"LENS">>
   TAG = 0
   DISP_ORDER = 22
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 171
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 500
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Lens">>
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
   XML_TAG = <<"LENS">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 173
   NAME = <<"T">>
   TAG = 0
   DISP_ORDER = 23
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 174
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
   SCALE = 3
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"T">>
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
   XML_TAG = <<"T">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 176
   NAME = <<"CORNEA_L">>
   TAG = 0
   DISP_ORDER = 24
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 177
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 200
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Cornea L">>
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
   XML_TAG = <<"CORNEA_L">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 179
   NAME = <<"VA_OS">>
   TAG = 0
   DISP_ORDER = 25
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 180
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 500
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Va Os">>
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
   XML_TAG = <<"VA_OS">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 182
   NAME = <<"LID_OS">>
   TAG = 0
   DISP_ORDER = 26
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 183
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 500
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Lid Os">>
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
   XML_TAG = <<"LID_OS">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 185
   NAME = <<"CONJ_OS">>
   TAG = 0
   DISP_ORDER = 27
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 186
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 500
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Conj Os">>
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
   XML_TAG = <<"CONJ_OS">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 188
   NAME = <<"LAC_OS">>
   TAG = 0
   DISP_ORDER = 28
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 189
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 500
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Lac Os">>
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
   XML_TAG = <<"LAC_OS">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 191
   NAME = <<"EOM_OS">>
   TAG = 0
   DISP_ORDER = 29
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 192
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 500
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Eom Os">>
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
   XML_TAG = <<"EOM_OS">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 194
   NAME = <<"AC_OS">>
   TAG = 0
   DISP_ORDER = 30
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 195
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 500
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Ac Os">>
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
   XML_TAG = <<"AC_OS">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 197
   NAME = <<"PUPIL_OS">>
   TAG = 0
   DISP_ORDER = 31
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 198
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 500
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Pupil Os">>
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
   XML_TAG = <<"PUPIL_OS">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 200
   NAME = <<"LENS_OS">>
   TAG = 0
   DISP_ORDER = 32
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 201
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 500
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Lens Os">>
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
   XML_TAG = <<"LENS_OS">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 203
   NAME = <<"T_OS">>
   TAG = 0
   DISP_ORDER = 33
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 204
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
   SCALE = 3
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"T Os">>
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
   XML_TAG = <<"T_OS">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 206
   NAME = <<"CORNEA_R">>
   TAG = 0
   DISP_ORDER = 34
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 207
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 200
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Cornea R">>
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
   XML_TAG = <<"CORNEA_R">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 209
   NAME = <<"OD_SPH">>
   TAG = 0
   DISP_ORDER = 35
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 210
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
   SCALE = 3
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Od Sph">>
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
   XML_TAG = <<"OD_SPH">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 212
   NAME = <<"OD_CYL">>
   TAG = 0
   DISP_ORDER = 36
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 213
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
   SCALE = 3
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Od Cyl">>
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
   XML_TAG = <<"OD_CYL">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 215
   NAME = <<"OD_AX">>
   TAG = 0
   DISP_ORDER = 37
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 216
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
   SCALE = 3
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Od Ax">>
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
   XML_TAG = <<"OD_AX">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 218
   NAME = <<"OD_READ">>
   TAG = 0
   DISP_ORDER = 38
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 219
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
   SCALE = 3
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Od Read">>
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
   XML_TAG = <<"OD_READ">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 221
   NAME = <<"OD_VA">>
   TAG = 0
   DISP_ORDER = 39
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 222
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
   SCALE = 3
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Od Va">>
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
   XML_TAG = <<"OD_VA">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 224
   NAME = <<"AC">>
   TAG = 0
   DISP_ORDER = 40
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 225
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 500
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Ac">>
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
   XML_TAG = <<"AC">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 227
   NAME = <<"OD_IPD">>
   TAG = 0
   DISP_ORDER = 41
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 228
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
   SCALE = 3
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Od Ipd">>
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
   XML_TAG = <<"OD_IPD">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 230
   NAME = <<"OS_SPH">>
   TAG = 0
   DISP_ORDER = 42
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 231
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
   SCALE = 3
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Os Sph">>
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
   XML_TAG = <<"OS_SPH">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 233
   NAME = <<"OS_CYL">>
   TAG = 0
   DISP_ORDER = 43
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 234
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
   SCALE = 3
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Os Cyl">>
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
   XML_TAG = <<"OS_CYL">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 236
   NAME = <<"OS_AX">>
   TAG = 0
   DISP_ORDER = 44
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 237
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
   SCALE = 3
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Os Ax">>
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
   XML_TAG = <<"OS_AX">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 239
   NAME = <<"OS_READ">>
   TAG = 0
   DISP_ORDER = 45
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 240
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
   SCALE = 3
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Os Read">>
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
   XML_TAG = <<"OS_READ">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 242
   NAME = <<"OS_VA">>
   TAG = 0
   DISP_ORDER = 46
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 243
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
   SCALE = 3
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Os Va">>
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
   XML_TAG = <<"OS_VA">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 245
   NAME = <<"OS_IPD">>
   TAG = 0
   DISP_ORDER = 47
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 246
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
   SCALE = 3
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Os Ipd">>
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
   XML_TAG = <<"OS_IPD">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 248
   NAME = <<"R">>
   TAG = 0
   DISP_ORDER = 48
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 249
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 1000
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"R">>
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
   XML_TAG = <<"R">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 251
   NAME = <<"H_REM">>
   TAG = 0
   DISP_ORDER = 49
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 252
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 1000
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"H Rem">>
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
   XML_TAG = <<"H_REM">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 254
   NAME = <<"SEL">>
   TAG = 0
   DISP_ORDER = 50
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 255
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
   PRECISION = 1
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Sel">>
   DFLT_WID = 30000
   DEREF_ID = 2
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
   XML_TAG = <<"SEL">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 257
   NAME = <<"ASBKIA">>
   TAG = 0
   DISP_ORDER = 51
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 258
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
   PRECISION = 1
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Asbkia">>
   DFLT_WID = 30000
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
   XML_TAG = <<"ASBKIA">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 260
   NAME = <<"SCI_OS">>
   TAG = 0
   DISP_ORDER = 52
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 261
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 500
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Sci Os">>
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
   XML_TAG = <<"SCI_OS">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 263
   NAME = <<"SCI">>
   TAG = 0
   DISP_ORDER = 53
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 264
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 500
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Sci">>
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
   XML_TAG = <<"SCI">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 266
   NAME = <<"IR">>
   TAG = 0
   DISP_ORDER = 54
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 267
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 500
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Ir">>
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
   XML_TAG = <<"IR">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 269
   NAME = <<"OS_IR">>
   TAG = 0
   DISP_ORDER = 55
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 270
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 500
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Os Ir">>
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
   XML_TAG = <<"OS_IR">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 272
   NAME = <<"K">>
   TAG = 0
   DISP_ORDER = 56
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 273
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 500
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"K">>
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
   XML_TAG = <<"K">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 275
   NAME = <<"OS_K">>
   TAG = 0
   DISP_ORDER = 57
   GROUP_ID = 104
   SOURCE = 0
   SOURCE_ID = 276
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 7
   FILE_TYPE = 1
   WIDTH = 500
   FLAGS = 33
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Os K">>
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
   XML_TAG = <<"OS_K">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 450
   NAME = <<"g_name">>
   TAG = 0
   DISP_ORDER = 14
   GROUP_ID = 104
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
   DFLT_LBL = NULLP
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
   XML_TAG = <<"G_NAME">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 455
   NAME = <<"P_ID1">>
   TAG = 0
   DISP_ORDER = 0
   GROUP_ID = 454
   SOURCE = 0
   SOURCE_ID = 456
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
   DFLT_LBL = <<"P Id1">>
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
   XML_TAG = <<"P_ID1">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 458
   NAME = <<"PHOTO">>
   TAG = 0
   DISP_ORDER = 1
   GROUP_ID = 454
   SOURCE = 0
   SOURCE_ID = 459
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 6
   FILE_TYPE = 10
   WIDTH = 0
   FLAGS = 0
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Photo">>
   DFLT_WID = 200000
   DEREF_ID = 0
   ODATA_TYPE = 24
   DFLT_HGT = 100000
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
   XML_TAG = <<"PHOTO">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 461
   NAME = <<"E_TYPE">>
   TAG = 0
   DISP_ORDER = 2
   GROUP_ID = 454
   SOURCE = 0
   SOURCE_ID = 462
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
   PRECISION = 1
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"E Type">>
   DFLT_WID = 30000
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
   XML_TAG = <<"E_TYPE">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 464
   NAME = <<"P_DATE1">>
   TAG = 0
   DISP_ORDER = 3
   GROUP_ID = 454
   SOURCE = 0
   SOURCE_ID = 465
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
   DFLT_LBL = <<"P Date1">>
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
   XML_TAG = <<"P_DATE1">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 523
   NAME = <<"P_ID2">>
   TAG = 0
   DISP_ORDER = 0
   GROUP_ID = 522
   SOURCE = 0
   SOURCE_ID = 524
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
   DFLT_LBL = <<"P Id2">>
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
   XML_TAG = <<"P_ID2">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 526
   NAME = <<"PHOTO1">>
   TAG = 0
   DISP_ORDER = 1
   GROUP_ID = 522
   SOURCE = 0
   SOURCE_ID = 527
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 6
   FILE_TYPE = 10
   WIDTH = 0
   FLAGS = 0
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Photo1">>
   DFLT_WID = 200000
   DEREF_ID = 0
   ODATA_TYPE = 24
   DFLT_HGT = 100000
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
   XML_TAG = <<"PHOTO1">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 529
   NAME = <<"E_TYPE1">>
   TAG = 0
   DISP_ORDER = 2
   GROUP_ID = 522
   SOURCE = 0
   SOURCE_ID = 530
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
   PRECISION = 1
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"E Type1">>
   DFLT_WID = 30000
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
   XML_TAG = <<"E_TYPE1">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 532
   NAME = <<"P_DATE2">>
   TAG = 0
   DISP_ORDER = 3
   GROUP_ID = 522
   SOURCE = 0
   SOURCE_ID = 533
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
   DFLT_LBL = <<"P Date2">>
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
   XML_TAG = <<"P_DATE2">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 554
   NAME = <<"P_ID3">>
   TAG = 0
   DISP_ORDER = 0
   GROUP_ID = 553
   SOURCE = 0
   SOURCE_ID = 555
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
   DFLT_LBL = <<"P Id3">>
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
   XML_TAG = <<"P_ID3">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 557
   NAME = <<"PHOTO2">>
   TAG = 0
   DISP_ORDER = 1
   GROUP_ID = 553
   SOURCE = 0
   SOURCE_ID = 558
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 6
   FILE_TYPE = 10
   WIDTH = 0
   FLAGS = 0
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Photo2">>
   DFLT_WID = 200000
   DEREF_ID = 0
   ODATA_TYPE = 24
   DFLT_HGT = 100000
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
   XML_TAG = <<"PHOTO2">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 560
   NAME = <<"E_TYPE2">>
   TAG = 0
   DISP_ORDER = 2
   GROUP_ID = 553
   SOURCE = 0
   SOURCE_ID = 561
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
   PRECISION = 1
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"E Type2">>
   DFLT_WID = 30000
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
   XML_TAG = <<"E_TYPE2">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 563
   NAME = <<"P_DATE3">>
   TAG = 0
   DISP_ORDER = 3
   GROUP_ID = 553
   SOURCE = 0
   SOURCE_ID = 564
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
   DFLT_LBL = <<"P Date3">>
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
   XML_TAG = <<"P_DATE3">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 569
   NAME = <<"P_ID4">>
   TAG = 0
   DISP_ORDER = 0
   GROUP_ID = 568
   SOURCE = 0
   SOURCE_ID = 570
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
   DFLT_LBL = <<"P Id4">>
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
   XML_TAG = <<"P_ID4">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 572
   NAME = <<"PHOTO3">>
   TAG = 0
   DISP_ORDER = 1
   GROUP_ID = 568
   SOURCE = 0
   SOURCE_ID = 573
   COMPUTE_ID = 1
   PROD_ORDER = NULLP
   RESET_ID = 1
   NULL_VALUE = NULLP
   INPUT_MASK = NULLP
   OPERATOR = 0
   DATA_TYPE = 6
   FILE_TYPE = 10
   WIDTH = 0
   FLAGS = 0
   PRECISION = 0
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"Photo3">>
   DFLT_WID = 200000
   DEREF_ID = 0
   ODATA_TYPE = 24
   DFLT_HGT = 100000
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
   XML_TAG = <<"PHOTO3">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 575
   NAME = <<"E_TYPE3">>
   TAG = 0
   DISP_ORDER = 2
   GROUP_ID = 568
   SOURCE = 0
   SOURCE_ID = 576
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
   PRECISION = 1
   SCALE = 0
   X = 0
   Y = 0
   WD = 0
   HT = 0
   DFLT_LBL = <<"E Type3">>
   DFLT_WID = 30000
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
   XML_TAG = <<"E_TYPE3">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_COLUMN
BEGIN
   ITEMID = 578
   NAME = <<"P_DATE4">>
   TAG = 0
   DISP_ORDER = 3
   GROUP_ID = 568
   SOURCE = 0
   SOURCE_ID = 579
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
   DFLT_LBL = <<"P Date4">>
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
   XML_TAG = <<"P_DATE4">>
   XML_ATTR = NULLP
   XML_SUPPRESS = 0
   CONTAIN_XML = 0
   RTYPE = 0
   PDSCLS = NULLP
END

DEFINE  SRW2_LINK
BEGIN
   ITEMID = 467
   TAG = 0
   DISP_ORDER = 10
   PARENT_ID = 104
   P_COLUMN = 107
   CHILD_ID = 454
   C_COLUMN = 455
   CLAUSE = 1
   OPERATOR = 2
   NUM_POINTS = 32
   POINTS = (BINARY)
<<"
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
">>
   PERS_FLAGS = 0
END

DEFINE  SRW2_LINK
BEGIN
   ITEMID = 535
   TAG = 0
   DISP_ORDER = 11
   PARENT_ID = 104
   P_COLUMN = 107
   CHILD_ID = 522
   C_COLUMN = 523
   CLAUSE = 1
   OPERATOR = 2
   NUM_POINTS = 32
   POINTS = (BINARY)
<<"
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
">>
   PERS_FLAGS = 0
END

DEFINE  SRW2_LINK
BEGIN
   ITEMID = 566
   TAG = 0
   DISP_ORDER = 12
   PARENT_ID = 104
   P_COLUMN = 107
   CHILD_ID = 553
   C_COLUMN = 554
   CLAUSE = 1
   OPERATOR = 2
   NUM_POINTS = 32
   POINTS = (BINARY)
<<"
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
">>
   PERS_FLAGS = 0
END

DEFINE  SRW2_LINK
BEGIN
   ITEMID = 581
   TAG = 0
   DISP_ORDER = 13
   PARENT_ID = 104
   P_COLUMN = 107
   CHILD_ID = 568
   C_COLUMN = 569
   CLAUSE = 1
   OPERATOR = 2
   NUM_POINTS = 32
   POINTS = (BINARY)
<<"
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
">>
   PERS_FLAGS = 0
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 616
   SEG_ORDER = 0
   TAG = 696
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 621
   SEG_ORDER = 0
   TAG = 696
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 628
   SEG_ORDER = 0
   TAG = 684
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 632
   SEG_ORDER = 0
   TAG = 683
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 670
   SEG_ORDER = 0
   TAG = 707
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 685
   SEG_ORDER = 0
   TAG = 683
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 688
   SEG_ORDER = 0
   TAG = 696
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 704
   SEG_ORDER = 0
   TAG = 707
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 718
   SEG_ORDER = 0
   TAG = 722
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 724
   SEG_ORDER = 0
   TAG = 722
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 725
   SEG_ORDER = 0
   TAG = 722
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 726
   SEG_ORDER = 0
   TAG = 722
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 727
   SEG_ORDER = 0
   TAG = 722
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 728
   SEG_ORDER = 0
   TAG = 722
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 730
   SEG_ORDER = 0
   TAG = 722
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 732
   SEG_ORDER = 0
   TAG = 722
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 737
   SEG_ORDER = 0
   TAG = 707
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 740
   SEG_ORDER = 0
   TAG = 707
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 746
   SEG_ORDER = 0
   TAG = 722
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 748
   SEG_ORDER = 0
   TAG = 722
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 749
   SEG_ORDER = 0
   TAG = 722
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 750
   SEG_ORDER = 0
   TAG = 722
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 751
   SEG_ORDER = 0
   TAG = 722
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 752
   SEG_ORDER = 0
   TAG = 722
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 753
   SEG_ORDER = 0
   TAG = 722
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 754
   SEG_ORDER = 0
   TAG = 722
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 754
   SEG_ORDER = 1
   TAG = 722
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 754
   SEG_ORDER = 2
   TAG = 722
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 755
   SEG_ORDER = 0
   TAG = 722
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 756
   SEG_ORDER = 0
   TAG = 722
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 757
   SEG_ORDER = 0
   TAG = 722
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 758
   SEG_ORDER = 0
   TAG = 722
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 759
   SEG_ORDER = 0
   TAG = 722
END

DEFINE  SRW2_TEXT_SEGMENT
BEGIN
   ITEMID = 761
   SEG_ORDER = 0
   TAG = 722
END

DEFINE  SRW2_FRAME
BEGIN
   ITEMID = 310
   NAME = <<"R_G_P_ID">>
   TAG = 425
   DISP_ORDER = 0
   FORMATFLAG = 805306628
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 0
   Y = 0
   WD = 81920
   HT = 53248
   PAGE = 0
   GROUP_ID = 104
   CONTINUED = 0
   DIRECTION = 1
   MIN_WIDOWS = 1
   MIN_ORPHAN = 1
   MAX_LINES = 1
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
   TEMPL_ID = 286
   TABCAP = NULLP
END

DEFINE  SRW2_FRAME
BEGIN
   ITEMID = 536
   NAME = <<"R_1">>
   TAG = 538
   DISP_ORDER = 57
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 71168
   Y = 22528
   WD = 10240
   HT = 7168
   PAGE = 0
   GROUP_ID = 454
   CONTINUED = 0
   DIRECTION = 1
   MIN_WIDOWS = 1
   MIN_ORPHAN = 0
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
   FRAME_TYPE = 0
   TEMPL_ID = 0
   TABCAP = NULLP
END

DEFINE  SRW2_FRAME
BEGIN
   ITEMID = 540
   NAME = <<"R_2">>
   TAG = 538
   DISP_ORDER = 61
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 40448
   Y = 22528
   WD = 8704
   HT = 7168
   PAGE = 0
   GROUP_ID = 522
   CONTINUED = 0
   DIRECTION = 1
   MIN_WIDOWS = 1
   MIN_ORPHAN = 0
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
   FRAME_TYPE = 0
   TEMPL_ID = 0
   TABCAP = NULLP
END

DEFINE  SRW2_FRAME
BEGIN
   ITEMID = 609
   NAME = <<"R_3">>
   TAG = 612
   DISP_ORDER = 97
   FORMATFLAG = 939524352
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 0
   Y = 0
   WD = 61440
   HT = 30208
   PAGE = 0
   GROUP_ID = 568
   CONTINUED = 0
   DIRECTION = 1
   MIN_WIDOWS = 1
   MIN_ORPHAN = 0
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
   FRAME_TYPE = 0
   TEMPL_ID = 0
   TABCAP = NULLP
END

DEFINE  SRW2_FRAME
BEGIN
   ITEMID = 611
   NAME = <<"R_4">>
   TAG = 614
   DISP_ORDER = 95
   FORMATFLAG = 402655232
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 0
   Y = 30208
   WD = 61440
   HT = 43520
   PAGE = 0
   GROUP_ID = 553
   CONTINUED = 0
   DIRECTION = 1
   MIN_WIDOWS = 1
   MIN_ORPHAN = 0
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
   FRAME_TYPE = 0
   TEMPL_ID = 0
   TABCAP = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 311
   NAME = <<"F_P_ID">>
   TAG = 675
   DISP_ORDER = 1
   FORMATFLAG = 805306628
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 4096
   Y = 3072
   WD = 7680
   HT = 2048
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 107
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
   TEMPL_ID = 301
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 313
   NAME = <<"F_P_NAME">>
   TAG = 675
   DISP_ORDER = 2
   FORMATFLAG = 805306628
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 16896
   Y = 3072
   WD = 32256
   HT = 2048
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 110
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 315
   NAME = <<"F_B_DATE">>
   TAG = 675
   DISP_ORDER = 3
   FORMATFLAG = 805306628
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 54784
   Y = 3072
   WD = 8704
   HT = 2048
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 113
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
   TEMPL_ID = 299
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 317
   NAME = <<"F_AGEE">>
   TAG = 675
   DISP_ORDER = 4
   FORMATFLAG = 805306628
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 67072
   Y = 3072
   WD = 4096
   HT = 2048
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 116
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
   TEMPL_ID = 301
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 319
   NAME = <<"F_GENDER">>
   TAG = 675
   DISP_ORDER = 5
   FORMATFLAG = 805306628
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 74752
   Y = 3072
   WD = 6144
   HT = 2048
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 450
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
   TEMPL_ID = 301
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 321
   NAME = <<"F_P_DATE">>
   TAG = 675
   DISP_ORDER = 6
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 8192
   Y = 5632
   WD = 11776
   HT = 2048
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 122
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
   TEMPL_ID = 299
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 323
   NAME = <<"F_HTN_R">>
   TAG = 677
   DISP_ORDER = 7
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 26624
   Y = 5632
   WD = 7680
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 125
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 325
   NAME = <<"F_IDDM_R">>
   TAG = 677
   DISP_ORDER = 8
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 26624
   Y = 7168
   WD = 7680
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 128
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 327
   NAME = <<"F_NIDDM_R">>
   TAG = 677
   DISP_ORDER = 9
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 26624
   Y = 8704
   WD = 7680
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 131
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 329
   NAME = <<"F_CANDIADIAC_R">>
   TAG = 677
   DISP_ORDER = 10
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 41472
   Y = 5632
   WD = 7680
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 134
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 331
   NAME = <<"F_RENAL_R">>
   TAG = 677
   DISP_ORDER = 11
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 41472
   Y = 7168
   WD = 7680
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 137
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 333
   NAME = <<"F_OTHR_R">>
   TAG = 677
   DISP_ORDER = 12
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 41472
   Y = 8704
   WD = 7680
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 140
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 335
   NAME = <<"F_MED">>
   TAG = 735
   DISP_ORDER = 13
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 63488
   Y = 6144
   WD = 16896
   HT = 2048
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 143
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 337
   NAME = <<"F_OPHTH">>
   TAG = 735
   DISP_ORDER = 14
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 63488
   Y = 8192
   WD = 16896
   HT = 2048
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 146
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 339
   NAME = <<"F_CO">>
   TAG = 673
   DISP_ORDER = 15
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 8192
   Y = 7680
   WD = 11776
   HT = 2560
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 149
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 341
   NAME = <<"F_VA">>
   TAG = 742
   DISP_ORDER = 16
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 13312
   Y = 13312
   WD = 35840
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 152
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 343
   NAME = <<"F_LID">>
   TAG = 742
   DISP_ORDER = 17
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 13312
   Y = 14848
   WD = 35840
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 155
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 345
   NAME = <<"F_CONJ">>
   TAG = 742
   DISP_ORDER = 18
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 13312
   Y = 16384
   WD = 35840
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 158
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 347
   NAME = <<"F_LAC">>
   TAG = 742
   DISP_ORDER = 19
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 13312
   Y = 17920
   WD = 35840
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 161
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 349
   NAME = <<"F_EOM">>
   TAG = 742
   DISP_ORDER = 20
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 13312
   Y = 20992
   WD = 35840
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 164
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 351
   NAME = <<"F_PUPIL">>
   TAG = 742
   DISP_ORDER = 21
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 13312
   Y = 32768
   WD = 35840
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 167
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 353
   NAME = <<"F_LENS">>
   TAG = 742
   DISP_ORDER = 22
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 13312
   Y = 34304
   WD = 35840
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 170
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 355
   NAME = <<"F_T">>
   TAG = 742
   DISP_ORDER = 23
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 13312
   Y = 35840
   WD = 35840
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 173
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
   TEMPL_ID = 301
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 357
   NAME = <<"F_CORNEA_L">>
   TAG = 744
   DISP_ORDER = 24
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 49152
   Y = 22528
   WD = 22016
   HT = 7168
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 176
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 359
   NAME = <<"F_VA_OS">>
   TAG = 742
   DISP_ORDER = 25
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 49152
   Y = 13312
   WD = 32256
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 179
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 361
   NAME = <<"F_LID_OS">>
   TAG = 742
   DISP_ORDER = 26
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 49152
   Y = 14848
   WD = 32255
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 182
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 363
   NAME = <<"F_CONJ_OS">>
   TAG = 742
   DISP_ORDER = 27
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 49152
   Y = 16384
   WD = 32256
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 185
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 365
   NAME = <<"F_LAC_OS">>
   TAG = 742
   DISP_ORDER = 28
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 49152
   Y = 17920
   WD = 32255
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 188
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 367
   NAME = <<"F_EOM_OS">>
   TAG = 742
   DISP_ORDER = 29
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 49152
   Y = 20992
   WD = 32256
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 191
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 369
   NAME = <<"F_AC_OS">>
   TAG = 742
   DISP_ORDER = 30
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 49152
   Y = 29696
   WD = 32256
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 194
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 371
   NAME = <<"F_PUPIL_OS">>
   TAG = 742
   DISP_ORDER = 31
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 49152
   Y = 32768
   WD = 32256
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 197
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 373
   NAME = <<"F_LENS_OS">>
   TAG = 742
   DISP_ORDER = 32
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 49152
   Y = 34304
   WD = 32256
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 200
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 375
   NAME = <<"F_T_OS">>
   TAG = 742
   DISP_ORDER = 33
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 49152
   Y = 35840
   WD = 32256
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 203
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
   TEMPL_ID = 301
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 377
   NAME = <<"F_CORNEA_R">>
   TAG = 744
   DISP_ORDER = 34
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 13312
   Y = 22528
   WD = 27136
   HT = 7168
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 206
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 379
   NAME = <<"F_OD_SPH">>
   TAG = 673
   DISP_ORDER = 35
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 8192
   Y = 46080
   WD = 7168
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 209
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
   TEMPL_ID = 301
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 381
   NAME = <<"F_OD_CYL">>
   TAG = 673
   DISP_ORDER = 36
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 15872
   Y = 46080
   WD = 7168
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 212
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
   TEMPL_ID = 301
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 383
   NAME = <<"F_OD_AX">>
   TAG = 673
   DISP_ORDER = 37
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 24064
   Y = 46080
   WD = 6144
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 215
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
   TEMPL_ID = 301
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 385
   NAME = <<"F_OD_READ">>
   TAG = 673
   DISP_ORDER = 38
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 30720
   Y = 46080
   WD = 6656
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 218
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
   TEMPL_ID = 301
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 387
   NAME = <<"F_OD_VA">>
   TAG = 673
   DISP_ORDER = 39
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 37888
   Y = 46080
   WD = 6144
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 221
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
   TEMPL_ID = 301
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 389
   NAME = <<"F_AC">>
   TAG = 742
   DISP_ORDER = 40
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 13312
   Y = 29696
   WD = 35840
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 224
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 391
   NAME = <<"F_OD_IPD">>
   TAG = 673
   DISP_ORDER = 41
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 44544
   Y = 46080
   WD = 7168
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 227
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
   TEMPL_ID = 301
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 393
   NAME = <<"F_OS_SPH">>
   TAG = 673
   DISP_ORDER = 42
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 8192
   Y = 48128
   WD = 7168
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 230
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
   TEMPL_ID = 301
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 395
   NAME = <<"F_OS_CYL">>
   TAG = 673
   DISP_ORDER = 43
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 15872
   Y = 48128
   WD = 7168
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 233
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
   TEMPL_ID = 301
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 397
   NAME = <<"F_OS_AX">>
   TAG = 673
   DISP_ORDER = 44
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 24064
   Y = 48128
   WD = 6144
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 236
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
   TEMPL_ID = 301
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 399
   NAME = <<"F_OS_READ">>
   TAG = 673
   DISP_ORDER = 45
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 30720
   Y = 48128
   WD = 6656
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 239
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
   TEMPL_ID = 301
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 401
   NAME = <<"F_OS_VA">>
   TAG = 673
   DISP_ORDER = 46
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 37888
   Y = 48128
   WD = 6144
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 242
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
   TEMPL_ID = 301
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 403
   NAME = <<"F_OS_IPD">>
   TAG = 673
   DISP_ORDER = 47
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 44544
   Y = 48128
   WD = 7168
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 245
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
   TEMPL_ID = 301
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 405
   NAME = <<"F_R">>
   TAG = 673
   DISP_ORDER = 48
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 8192
   Y = 50176
   WD = 73216
   HT = 2560
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 248
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 409
   NAME = <<"F_SEL">>
   TAG = 673
   DISP_ORDER = 49
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 512
   Y = 11264
   WD = 2048
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 254
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
   TEMPL_ID = 301
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 413
   NAME = <<"F_SCI_OS">>
   TAG = 742
   DISP_ORDER = 50
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 49152
   Y = 19456
   WD = 32255
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 260
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 415
   NAME = <<"F_SCI">>
   TAG = 742
   DISP_ORDER = 51
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 13312
   Y = 19456
   WD = 35840
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 263
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 417
   NAME = <<"F_IR">>
   TAG = 742
   DISP_ORDER = 52
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 13312
   Y = 31232
   WD = 35840
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 266
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 419
   NAME = <<"F_OS_IR">>
   TAG = 742
   DISP_ORDER = 53
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 49152
   Y = 31232
   WD = 32256
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 269
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 421
   NAME = <<"F_K">>
   TAG = 742
   DISP_ORDER = 54
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 13312
   Y = 37376
   WD = 35840
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 272
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 423
   NAME = <<"F_OS_K">>
   TAG = 742
   DISP_ORDER = 55
   FORMATFLAG = 268437508
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 49152
   Y = 37376
   WD = 32256
   HT = 1536
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 275
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
   TEMPL_ID = 300
   FRAME_ID = 310
   ALTXT = NULLP
   HEADERS = NULLP
END

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 541
   NAME = <<"F_1">>
   TAG = 680
   DISP_ORDER = 59
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 71680
   Y = 22528
   WD = 9216
   HT = 7168
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 458
   CONTINUED = 0
   ALIGNMENT = 68
   TEXT_WRAP = 1
   MIN_WIDOWS = 1
   MIN_ORPHAN = 0
   MAX_LINES = -1
   MASK = NULLP
   NULL_VALUE = NULLP
   SPACING = -1
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
   ITEMID = 542
   NAME = <<"F_2">>
   TAG = 680
   DISP_ORDER = 62
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 40448
   Y = 22812
   WD = 8192
   HT = 6884
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 526
   CONTINUED = 0
   ALIGNMENT = 68
   TEXT_WRAP = 1
   MIN_WIDOWS = 1
   MIN_ORPHAN = 0
   MAX_LINES = -1
   MASK = NULLP
   NULL_VALUE = NULLP
   SPACING = -1
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
   ITEMID = 607
   NAME = <<"F_3">>
   TAG = 585
   DISP_ORDER = 98
   FORMATFLAG = 939524352
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 512
   Y = 0
   WD = 60928
   HT = 30208
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 572
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

DEFINE  SRW2_FIELD
BEGIN
   ITEMID = 610
   NAME = <<"F_4">>
   TAG = 585
   DISP_ORDER = 96
   FORMATFLAG = 939524352
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 0
   Y = 30208
   WD = 61440
   HT = 43520
   PAGE = 0
   PGN_FLAGS = 7
   PGN_START = 1
   PGN_INCR = 1
   PGN_RESET = 1
   SOURCE_ID = 557
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

DEFINE  SRW2_LAYOUT_GROUP
BEGIN
   ITEMID = 622
   DISP_ORDER = 60
   FORMATFLAG = 0
   NCHILDREN = 2
   PERS_FLAGS = 0
END

DEFINE  SRW2_LAYOUT_GROUP
BEGIN
   ITEMID = 652
   DISP_ORDER = 58
   FORMATFLAG = 0
   NCHILDREN = 1
   PERS_FLAGS = 0
END

DEFINE  SRW2_LAYOUT_GROUP
BEGIN
   ITEMID = 653
   DISP_ORDER = 56
   FORMATFLAG = 0
   NCHILDREN = 2
   PERS_FLAGS = 0
END

DEFINE  SRW2_FORMAT_EXCEPTION
BEGIN
   OBJECT_ID = 409
   ACTIVATE = 1
   TAG = 700
   NULLVALS = -147
   DISPLAYED = 1
   EXP_LABEL = <<"(:SEL = '0')">>
   SRCCOL1 = 254
   EXCEPTION1 = 1
   LOVAL1 = <<"0">>
   HIVAL1 = NULLP
   CONJUNCT1 = 1
   SRCCOL2 = 254
   EXCEPTION2 = 7
   LOVAL2 = NULLP
   HIVAL2 = NULLP
   CONJUNCT2 = 1
   SRCCOL3 = 254
   EXCEPTION3 = 7
   LOVAL3 = NULLP
   HIVAL3 = NULLP
   CONJUNCT3 = 0
END

DEFINE  SRW2_FORMAT_EXCEPTION
BEGIN
   OBJECT_ID = 409
   ACTIVATE = 1
   TAG = 701
   NULLVALS = -147
   DISPLAYED = 1
   EXP_LABEL = <<"(:SEL = '1')">>
   SRCCOL1 = 254
   EXCEPTION1 = 1
   LOVAL1 = <<"1">>
   HIVAL1 = NULLP
   CONJUNCT1 = 1
   SRCCOL2 = 254
   EXCEPTION2 = 7
   LOVAL2 = NULLP
   HIVAL2 = NULLP
   CONJUNCT2 = 1
   SRCCOL3 = 254
   EXCEPTION3 = 7
   LOVAL3 = NULLP
   HIVAL3 = NULLP
   CONJUNCT3 = 0
END

DEFINE  TOOL_PLSQL
BEGIN
   ITEMID = 451
   NAME = <<"g_nameformula">>
   PLSLFID_EP = (BLONG) NULLP
   OBJECT_ID = 450
   TYPE = 4
   PLSLFID_ST = (TLONG)
<<"function g_nameFormula return Char is
t varchar2(20);
begin
  if :gender = 1 then 
  	 t := 'ÐßÑ';
  else
  	 t := 'ÇäËì';
  end if;
  return t;
end;">>
   STATE = 0
END

DEFINE  TOOL_PLSQL
BEGIN
   ITEMID = 547
   NAME = <<"f_selformattrigger">>
   PLSLFID_EP = (BLONG) NULLP
   OBJECT_ID = 409
   TYPE = 5
   PLSLFID_ST = (TLONG)
<<"function F_SELFormatTrigger return boolean is
begin

  -- Automatically Generated from Report Builder.
  if (:SEL = '1')
  then
    srw.set_foreground_border_color('darkred');
    srw.set_border_pattern('solid');
    srw.set_foreground_fill_color('darkred');
    srw.set_fill_pattern('solid');
    srw.set_text_color('darkred');
  end if;

  -- Automatically Generated from Report Builder.
  if (:SEL = '0')
  then
    srw.set_foreground_border_color('black');
    srw.set_border_pattern('solid');
    srw.set_foreground_fill_color('white');
    srw.set_fill_pattern('solid');
    srw.set_text_color('blue');
  end if;

  return (TRUE);
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
<<"SELECT ALL PATION_TBL.P_ID, 
PATION_TBL.P_NAME, PATION_TBL.B_DATE, PATION_TBL.AGEE, PATION_TBL.GENDER, 
HGZ_TBL.P_DATE, PATION_TBL.HTN_R, PATION_TBL.IDDM_R, PATION_TBL.NIDDM_R, 
PATION_TBL.CANDIADIAC_R, PATION_TBL.RENAL_R, PATION_TBL.OTHR_R, PATION_TBL.MED, 
PATION_TBL.OPHTH, HGZ_TBL.CO, HGZ_TBL.VA, HGZ_TBL.LID, HGZ_TBL.CONJ, 
HGZ_TBL.LAC, HGZ_TBL.EOM, HGZ_TBL.PUPIL, HGZ_TBL.LENS, HGZ_TBL.T, HGZ_TBL.CORNEA_L, 
HGZ_TBL.VA_OS, HGZ_TBL.LID_OS, HGZ_TBL.CONJ_OS, HGZ_TBL.LAC_OS, 
HGZ_TBL.EOM_OS, HGZ_TBL.AC_OS, HGZ_TBL.PUPIL_OS, HGZ_TBL.LENS_OS, HGZ_TBL.T_OS, 
HGZ_TBL.CORNEA_R, HGZ_TBL.OD_SPH, HGZ_TBL.OD_CYL, HGZ_TBL.OD_AX, 
HGZ_TBL.OD_READ, HGZ_TBL.OD_VA, HGZ_TBL.AC, HGZ_TBL.OD_IPD, HGZ_TBL.OS_SPH, 
HGZ_TBL.OS_CYL, HGZ_TBL.OS_AX, HGZ_TBL.OS_READ, HGZ_TBL.OS_VA, HGZ_TBL.OS_IPD, 
HGZ_TBL.R, HGZ_TBL.H_REM, HGZ_TBL.SEL, HGZ_TBL.ASBKIA, HGZ_TBL.SCI_OS, 
HGZ_TBL.SCI, HGZ_TBL.IR, HGZ_TBL.OS_IR, HGZ_TBL.K, HGZ_TBL.OS_K
FROM HGZ_TBL, PATION_TBL
WHERE (PATION_TBL.P_ID = HGZ_TBL.P_ID) and
PATION_TBL.P_ID = :p_i and 
HGZ_TBL.P_DATE = :p_d">>
   NET_LOGON = NULLP
   EXT_QUERY = NULLP
   TEMP_TABLE = NULLP
   TEMP_FLAGS = 0
   EXEC_FREQ = 0
   MAX_ROWS = 0
   X = 27256
   Y = 683
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

DEFINE  SRW2_QUERY
BEGIN
   ITEMID = 453
   NAME = <<"Q_2">>
   TAG = 0
   DISP_ORDER = 2
   QUERYLFID = (TLONG)
<<"SELECT ALL HGZ_TBL_PHOTOS.P_ID, 
HGZ_TBL_PHOTOS.PHOTO, HGZ_TBL_PHOTOS.E_TYPE, HGZ_TBL_PHOTOS.P_DATE
FROM HGZ_TBL_PHOTOS 
where 
HGZ_TBL_PHOTOS.P_ID = :p_i and
HGZ_TBL_PHOTOS.P_DATE = :p_d
and HGZ_TBL_PHOTOS.E_TYPE = 3">>
   NET_LOGON = NULLP
   EXT_QUERY = NULLP
   TEMP_TABLE = NULLP
   TEMP_FLAGS = 0
   EXEC_FREQ = 0
   MAX_ROWS = 0
   X = 73642
   Y = 2389
   WD = 5734
   HT = 2702
   PERS_FLAGS = 0
   DSTYPE = 0
   PLUGINXML = NULLP
   PLUGINCLZ = NULLP
   MAJORVER = 0
   MINORVER = 0
   SIGNONPRM = 0
   PLUGINXMLID = (TLONG) NULLP
END

DEFINE  SRW2_QUERY
BEGIN
   ITEMID = 521
   NAME = <<"Q_3">>
   TAG = 0
   DISP_ORDER = 4
   QUERYLFID = (TLONG)
<<"SELECT ALL HGZ_TBL_PHOTOS.P_ID, 
HGZ_TBL_PHOTOS.PHOTO, HGZ_TBL_PHOTOS.E_TYPE, HGZ_TBL_PHOTOS.P_DATE
FROM HGZ_TBL_PHOTOS 
where 
HGZ_TBL_PHOTOS.P_ID = :p_i and
HGZ_TBL_PHOTOS.P_DATE = :p_d
and HGZ_TBL_PHOTOS.E_TYPE =4">>
   NET_LOGON = NULLP
   EXT_QUERY = NULLP
   TEMP_TABLE = NULLP
   TEMP_FLAGS = 0
   EXEC_FREQ = 0
   MAX_ROWS = 0
   X = 73814
   Y = 19456
   WD = 5734
   HT = 2702
   PERS_FLAGS = 0
   DSTYPE = 0
   PLUGINXML = NULLP
   PLUGINCLZ = NULLP
   MAJORVER = 0
   MINORVER = 0
   SIGNONPRM = 0
   PLUGINXMLID = (TLONG) NULLP
END

DEFINE  SRW2_QUERY
BEGIN
   ITEMID = 552
   NAME = <<"Q_4">>
   TAG = 0
   DISP_ORDER = 6
   QUERYLFID = (TLONG)
<<"SELECT ALL HGZ_TBL_PHOTOS.P_ID, 
HGZ_TBL_PHOTOS.PHOTO, HGZ_TBL_PHOTOS.E_TYPE, HGZ_TBL_PHOTOS.P_DATE
FROM HGZ_TBL_PHOTOS 
where 
HGZ_TBL_PHOTOS.P_ID = :p_i and
HGZ_TBL_PHOTOS.P_DATE = :p_d
and HGZ_TBL_PHOTOS.E_TYPE =1">>
   NET_LOGON = NULLP
   EXT_QUERY = NULLP
   TEMP_TABLE = NULLP
   TEMP_FLAGS = 0
   EXEC_FREQ = 0
   MAX_ROWS = 0
   X = 75350
   Y = 34731
   WD = 5734
   HT = 2702
   PERS_FLAGS = 0
   DSTYPE = 0
   PLUGINXML = NULLP
   PLUGINCLZ = NULLP
   MAJORVER = 0
   MINORVER = 0
   SIGNONPRM = 0
   PLUGINXMLID = (TLONG) NULLP
END

DEFINE  SRW2_QUERY
BEGIN
   ITEMID = 567
   NAME = <<"Q_5">>
   TAG = 0
   DISP_ORDER = 8
   QUERYLFID = (TLONG)
<<"SELECT ALL HGZ_TBL_PHOTOS.P_ID, 
HGZ_TBL_PHOTOS.PHOTO, HGZ_TBL_PHOTOS.E_TYPE, HGZ_TBL_PHOTOS.P_DATE
FROM HGZ_TBL_PHOTOS 
where 
HGZ_TBL_PHOTOS.P_ID = :p_i and
HGZ_TBL_PHOTOS.P_DATE = :p_d
and HGZ_TBL_PHOTOS.E_TYPE =2">>
   NET_LOGON = NULLP
   EXT_QUERY = NULLP
   TEMP_TABLE = NULLP
   TEMP_FLAGS = 0
   EXEC_FREQ = 0
   MAX_ROWS = 0
   X = 41301
   Y = 2305
   WD = 5734
   HT = 2702
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
   ITEMID = 616
   NAME = <<"B_1">>
   TAG = 626
   DISP_ORDER = 63
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 13312
   Y = 10752
   WD = 35840
   HT = 2389
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00003400 00002a00 00008c00 00000955 
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
   ITEMID = 621
   NAME = <<"B_2">>
   TAG = 626
   DISP_ORDER = 64
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 49152
   Y = 10752
   WD = 32256
   HT = 2389
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
0000c000 00002a00 00007e00 00000955 
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
   ITEMID = 628
   NAME = <<"B_3">>
   TAG = 630
   DISP_ORDER = 65
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 597
   Y = 3584
   WD = 3413
   HT = 1365
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00000255 00000e00 00000d55 00000555 
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
   ITEMID = 632
   NAME = <<"B_4">>
   TAG = 425
   DISP_ORDER = 66
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 64085
   Y = 3584
   WD = 2816
   HT = 1365
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
0000fa55 00000e00 00000b00 00000555 
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
   ITEMID = 670
   NAME = <<"B_5">>
   TAG = 630
   DISP_ORDER = 67
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 12885
   Y = 3584
   WD = 4352
   HT = 1365
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00003255 00000e00 00001100 00000555 
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
   ITEMID = 685
   NAME = <<"B_6">>
   TAG = 425
   DISP_ORDER = 68
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 71168
   Y = 3584
   WD = 3157
   HT = 1536
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00011600 00000e00 00000c55 00000600 
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
   ITEMID = 688
   NAME = <<"B_7">>
   TAG = 693
   DISP_ORDER = 69
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 16896
   Y = 512
   WD = 39936
   HT = 1536
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00004200 00000200 00009c00 00000600 
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
   ITEMID = 704
   NAME = <<"B_8">>
   TAG = 630
   DISP_ORDER = 70
   FORMATFLAG = 805306624
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 49664
   Y = 3584
   WD = 5034
   HT = 1536
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
0000c200 00000e00 000013aa 00000600 
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
   ITEMID = 718
   NAME = <<"B_9">>
   TAG = 425
   DISP_ORDER = 71
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 597
   Y = 6144
   WD = 7083
   HT = 1536
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00000255 00001800 00001bab 00000600 
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
   ITEMID = 724
   NAME = <<"B_10">>
   TAG = 425
   DISP_ORDER = 72
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 3669
   Y = 8192
   WD = 3840
   HT = 1365
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00000e55 00002000 00000f00 00000555 
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
   ITEMID = 725
   NAME = <<"B_11">>
   TAG = 425
   DISP_ORDER = 73
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 22613
   Y = 5632
   WD = 3840
   HT = 1365
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00005855 00001600 00000f00 00000555 
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
   ITEMID = 726
   NAME = <<"B_12">>
   TAG = 425
   DISP_ORDER = 74
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 22613
   Y = 7168
   WD = 3413
   HT = 1365
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00005855 00001c00 00000d55 00000555 
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
   ITEMID = 727
   NAME = <<"B_13">>
   TAG = 425
   DISP_ORDER = 75
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 22613
   Y = 8704
   WD = 3755
   HT = 1365
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00005855 00002200 00000eab 00000555 
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
   ITEMID = 728
   NAME = <<"B_14">>
   TAG = 425
   DISP_ORDER = 76
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 35925
   Y = 5632
   WD = 4949
   HT = 1365
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00008c55 00001600 00001355 00000555 
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
   ITEMID = 730
   NAME = <<"B_15">>
   TAG = 425
   DISP_ORDER = 77
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 36437
   Y = 7168
   WD = 4267
   HT = 1365
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00008e55 00001c00 000010ab 00000555 
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
   ITEMID = 732
   NAME = <<"B_16">>
   TAG = 425
   DISP_ORDER = 78
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 35840
   Y = 8704
   WD = 5120
   HT = 1536
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00008c00 00002200 00001400 00000600 
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
   ITEMID = 737
   NAME = <<"B_17">>
   TAG = 630
   DISP_ORDER = 79
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 52821
   Y = 6656
   WD = 10325
   HT = 1451
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
0000ce55 00001a00 00002855 000005ab 
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
   ITEMID = 740
   NAME = <<"B_18">>
   TAG = 630
   DISP_ORDER = 80
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 52821
   Y = 8704
   WD = 10069
   HT = 1451
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
0000ce55 00002200 00002755 000005ab 
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
   ITEMID = 746
   NAME = <<"B_19">>
   TAG = 425
   DISP_ORDER = 81
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 3157
   Y = 10752
   WD = 6741
   HT = 2816
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00000c55 00002a00 00001a55 00000b00 
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
   ITEMID = 748
   NAME = <<"B_20">>
   TAG = 538
   DISP_ORDER = 82
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 9216
   Y = 13312
   WD = 4181
   HT = 1536
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00002400 00003400 00001055 00000600 
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
   ITEMID = 749
   NAME = <<"B_21">>
   TAG = 538
   DISP_ORDER = 83
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 9216
   Y = 14848
   WD = 4096
   HT = 1536
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00002400 00003a00 00001000 00000600 
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
   ITEMID = 750
   NAME = <<"B_22">>
   TAG = 538
   DISP_ORDER = 84
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 9216
   Y = 16384
   WD = 4352
   HT = 1536
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00002400 00004000 00001100 00000600 
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
   ITEMID = 751
   NAME = <<"B_23">>
   TAG = 538
   DISP_ORDER = 85
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 9216
   Y = 17920
   WD = 4096
   HT = 1365
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00002400 00004600 00001000 00000555 
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
   ITEMID = 752
   NAME = <<"B_24">>
   TAG = 538
   DISP_ORDER = 86
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 9216
   Y = 19456
   WD = 4096
   HT = 1536
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00002400 00004c00 00001000 00000600 
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
   ITEMID = 753
   NAME = <<"B_25">>
   TAG = 538
   DISP_ORDER = 87
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 9216
   Y = 20992
   WD = 4096
   HT = 1536
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00002400 00005200 00001000 00000600 
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
   ITEMID = 754
   NAME = <<"B_26">>
   TAG = 538
   DISP_ORDER = 88
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 9216
   Y = 22528
   WD = 4181
   HT = 7168
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00002400 00005800 00001055 00001c00 
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
   ITEMID = 755
   NAME = <<"B_27">>
   TAG = 538
   DISP_ORDER = 89
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 9216
   Y = 29696
   WD = 4096
   HT = 1536
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00002400 00007400 00001000 00000600 
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
   ITEMID = 756
   NAME = <<"B_28">>
   TAG = 538
   DISP_ORDER = 90
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 9216
   Y = 31232
   WD = 4096
   HT = 1536
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00002400 00007a00 00001000 00000600 
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
   ITEMID = 757
   NAME = <<"B_29">>
   TAG = 538
   DISP_ORDER = 91
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 9216
   Y = 32768
   WD = 4352
   HT = 1536
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00002400 00008000 00001100 00000600 
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
   ITEMID = 758
   NAME = <<"B_30">>
   TAG = 538
   DISP_ORDER = 92
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 9216
   Y = 34304
   WD = 4010
   HT = 1536
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00002400 00008600 00000faa 00000600 
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
   ITEMID = 759
   NAME = <<"B_31">>
   TAG = 538
   DISP_ORDER = 93
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 9216
   Y = 35840
   WD = 4096
   HT = 1536
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00002400 00008c00 00001000 00000600 
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
   ITEMID = 761
   NAME = <<"B_32">>
   TAG = 538
   DISP_ORDER = 94
   FORMATFLAG = 268437504
   PRE_CODE = NULLP
   POST_CODE = NULLP
   X = 9216
   Y = 37376
   WD = 4096
   HT = 1536
   PAGE = 0
   TYPE = 0
   NUM_POINTS = 16
   POINTS = (BINARY)
<<"
00002400 00009200 00001000 00000600 
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

