(dotted_identifier_list) @string

; Methods
; --------------------
;; TODO: does not work
;(function_type
  ;name: (identifier) @method)
(super) @function

; Annotations
; --------------------
(annotation
  name: (identifier) @attribute)

; Operators and Tokens
; --------------------
(template_substitution
  "$" @punctuation.special
  "{" @punctuation.special
  "}" @punctuation.special
) @none

(template_substitution
  "$" @punctuation.special
  (identifier_dollar_escaped) @variable
) @none

(escape_sequence) @string.escape

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
]  @punctuation.bracket

(type_arguments
  "<" @punctuation.bracket
  ">" @punctuation.bracket)

(type_parameters
  "<" @punctuation.bracket
  ">" @punctuation.bracket)

[
 "@"
 "=>"
 ".."
 "??"
 "=="
 "?"
 ":"
 "&&"
 "%"
 "<"
 ">"
 "="
 ">="
 "<="
 "||"
 (increment_operator)
 (is_operator)
 (prefix_operator)
 (equality_operator)
 (additive_operator)
] @operator

; Delimiters
; --------------------
[
  ";"
  "."
  ","
] @punctuation.delimiter

; Types
; --------------------
(class_definition
  name: (identifier) @type)
(constructor_signature
  name: (identifier) @type)
;; TODO: does not work
;(type_identifier
  ;(identifier) @type)
(scoped_identifier
  scope: (identifier) @type)
(function_signature
  name: (identifier) @method)
(getter_signature
  (identifier) @method)
(setter_signature
  name: (identifier) @method)
(enum_declaration
  name: (identifier) @type)
(enum_constant
  name: (identifier) @type)
(type_identifier) @type
(void_type) @type

((scoped_identifier
  scope: (identifier) @type
  name: (identifier) @type)
 (#match? @type "^[a-zA-Z]"))

(type_identifier) @type

; Variables
; --------------------
; var keyword
(inferred_type) @keyword

(const_builtin) @constant.builtin
(final_builtin) @constant.builtin

((identifier) @type
 (#match? @type "^_?[A-Z]"))

("Function" @type)

(this) @variable.builtin

; properties
; TODO: add method/call_expression to grammar and
; distinguish method call from variable access
(unconditional_assignable_selector
  (identifier) @property)

; assignments
(assignment_expression
  left: (assignable_expression) @variable)

(this) @variable.builtin

; Parameters
; --------------------
(formal_parameter
    name: (identifier) @parameter)

(named_argument
  (label (identifier) @parameter))

; Literals
; --------------------
[
    (hex_integer_literal)
    (decimal_integer_literal)
    (decimal_floating_point_literal)
    ; TODO: inaccessbile nodes
    ; (octal_integer_literal)
    ; (hex_floating_point_literal)
] @number

(symbol_literal) @symbol
(string_literal) @string
(true) @boolean
(false) @boolean
(null_literal) @constant.builtin

(documentation_comment) @comment
(comment) @comment

; Keywords
; --------------------
["import" "library" "export"] @include

; Reserved words (cannot be used as identifiers)
; TODO: "rethrow" @keyword
[
    ; "assert"
    (case_builtin)
    "extension"
    "on"
    "class"
    "enum"
    "extends"
    "in"
    "is"
    "new"
    "return"
    "super"
    "with"
] @keyword


; Built in identifiers:
; alone these are marked as keywords
[
    "abstract"
    "as"
    "async"
    "async*"
    "yield"
    "sync*"
    "await"
    "covariant"
    "deferred"
    "dynamic"
    "external"
    "factory"
    "get"
    "implements"
    "interface"
    "library"
    "operator"
    "mixin"
    "part"
    "set"
    "show"
    "static"
    "typedef"
] @keyword

; when used as an identifier:
((identifier) @variable
 (#vim-match? @variable "^(abstract|as|covariant|deferred|dynamic|export|external|factory|Function|get|implements|import|interface|library|operator|mixin|part|set|static|typedef)$"))

["if" "else" "switch" "default"] @conditional

[
  "try"
  "throw"
  "catch"
  "finally"
  (break_statement)
] @exception

["do" "while" "continue" "for"] @repeat

; Error
(ERROR) @error