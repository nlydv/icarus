[ "." ";" ":" "," ] @punctuation.delimiter
[ "(" ")" "[" "]" "{" "}" ] @punctuation.bracket

; Keywords
"break" @keyword
"case" @keyword
"const" @keyword
"continue" @keyword
"default" @keyword
"do" @keyword
"else" @keyword
"enum" @keyword
"extern" @keyword
"for" @keyword
"if" @keyword
"inline" @keyword
"return" @keyword
"sizeof" @keyword
"static" @keyword
"struct" @keyword
"switch" @keyword
"typedef" @keyword
"union" @keyword
"volatile" @keyword
"while" @keyword
"goto" @keyword

; Operators
[
  "--"
  "-"
  "-="
  "->"
  "="
  "!="
  "*"
  "&"
  "&&"
  "+"
  "++"
  "+="
  "<"
  "=="
  ">"
  "||"
  "<="
  ">="
  "<<"
  ">>"
  "~"
  "!"
  "."
  ":"
] @operator

(conditional_expression "?" @operator ":" @operator)

"." @punctuation.delimiter
";" @punctuation.delimiter

; Literals
(string_literal) @string
(system_lib_string) @string

(null) @value.null
(number_literal) @value.number
(char_literal) @value.entity
[
  (true)
  (false)
] @value.boolean

; Identifiers
(call_expression
  function: (identifier) @identifier.function)
(call_expression
  function: (field_expression
    field: (field_identifier) @identifier.function))
(function_declarator
  declarator: (identifier) @identifier.function)
(parameter_declaration (identifier) @identifier.argument)
(parameter_declaration
    (_ declarator: (identifier)? @identifier.argument
        (_ declarator: (identifier)? @identifier.argument
            (_ declarator: (identifier)? @identifier.argument)?
        )?
    )
)

(statement_identifier) @identifier.label
(type_identifier) @identifier.type
(primitive_type) @identifier.type
(sized_type_specifier) @identifier.type
(field_identifier) @identifier.property
((identifier) @identifier.constant
    (#match? @identifier.constant "^[A-Z0-9_-]+[A-Z]+[A-Z0-9]*$")
)

; Declarations

(struct_specifier name: (type_identifier) @identifier.type.declare)
(union_specifier name: (type_identifier) @identifier.type.declare)
(enum_specifier name: (type_identifier) @identifier.type.declare)
(type_definition declarator: (type_identifier) @identifier.type.declare)

; Comments
(comment) @comment
