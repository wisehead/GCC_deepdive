#1 main
main
--toplev_main

#2.AST node
gimplify_function_tree

#3.token
dump_a_token

#4.parser

```
c_parse_file
c_parser_translation_unit
c_parser_external_declaration
c_parser_declaration_or_fndef
c_parser_declspecs

```

#5.gimple

```
c_genericize
--gimplify_function_tree
----gimplify_body
------gimplify_parameters
------gimplify_stmt
--------gimplify_expr
----------gimplify_bind_expr
------------gimplify_stmt
--------------gimplify_expr
----------gimplify_modify_expr
------------gimplify_stmt
--------------gimplify_expr
```