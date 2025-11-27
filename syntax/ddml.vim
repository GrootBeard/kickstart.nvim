" syntax/ddml.vim - basic highlighting for your DSL

if exists("b:current_syntax")
  finish
endif

syntax case match

" ----------------------------------------------------------------------
" Comments
" ----------------------------------------------------------------------
syntax match ddmlComment "//.*$"
highlight def link ddmlComment Comment

" ----------------------------------------------------------------------
" Strings
" ----------------------------------------------------------------------
syntax region ddmlString start=+"+ skip=+\\"+ end=+"+
highlight def link ddmlString String

" ----------------------------------------------------------------------
" Numbers and units
" ----------------------------------------------------------------------
" Plain numbers (int or float)
syntax match ddmlNumber "\v(\d+\.\d*|\d*\.\d+|\d+)"
highlight def link ddmlNumber Number

" Units (very rough; extend as you like)
syntax match ddmlUnit "\v<(m|deg|rad|s|min|h|ms|km|nm)>" contained
syntax match ddmlNumberWithUnit "\v(\d+\.\d*|\d*\.\d+|\d+)\s*(m|deg|rad|s|min|h|ms|km|nm)" contains=ddmlNumber,ddmlUnit
highlight def link ddmlUnit Type
highlight def link ddmlNumberWithUnit Number

" ----------------------------------------------------------------------
" Keywords
" ----------------------------------------------------------------------
syntax keyword ddmlKeyword input signal var rule when then hold let action
syntax keyword ddmlKeyword bundle fn machine in
highlight def link ddmlKeyword Keyword

" Booleans
syntax keyword ddmlBoolean true false
highlight def link ddmlBoolean Boolean

" ----------------------------------------------------------------------
" Types (extend as your type system grows)
" ----------------------------------------------------------------------
syntax keyword ddmlType Angle Length Speed Duration Bool Int Real String
syntax keyword ddmlType Geo Coord Waypoint Void
highlight def link ddmlType Type

" ----------------------------------------------------------------------
" Actions (from your docs)
" ----------------------------------------------------------------------
syntax keyword ddmlAction error freefloat hold_heading info sail_to_geo
syntax keyword ddmlAction set_speed set_throttle warning
highlight def link ddmlAction Function

" ----------------------------------------------------------------------
" Builtin functions (from your docs)
" ----------------------------------------------------------------------
" Math / general
syntax keyword ddmlFunc abs atan ceil cos deg_to_angle exp float floor int
syntax keyword ddmlFunc is_even is_odd log log10 log2 max min mod pi round
syntax keyword ddmlFunc sin sqrt tan to_deg

" Signal / nav functions
syntax keyword ddmlFunc clamp coord_length counter deadband delay
syntax keyword ddmlFunc distance_between equal_tol every falls gate
syntax keyword ddmlFunc hold_true hysteresis latch on_delay on_value_change
syntax keyword ddmlFunc rate_limit rises rotate_coord sample select separation
syntax keyword ddmlFunc since startup toggle translate_geo_by_coord within
highlight def link ddmlFunc Function

" ----------------------------------------------------------------------
" Identifiers, braces, operators
" ----------------------------------------------------------------------
syntax match ddmlIdentifier "\v<[A-Za-z_][A-Za-z0-9_]*>"
highlight def link ddmlIdentifier Identifier

syntax match ddmlBraces "[{}()\[\]]"
highlight def link ddmlBraces Delimiter

syntax match ddmlOperator "[-+/*=<>!:]"
highlight def link ddmlOperator Operator

let b:current_syntax = "ddml"
