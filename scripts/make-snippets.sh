#!/bin/bash
set -e

# Usage function
usage() {
    echo "Usage: $0 <project_path> <subject> <description>"
    echo ""
    echo "Parameters:"
    echo "  project_path  - Path where the project snippets will be created"
    echo "  subject       - Subject name (e.g., 'Complejidad Computacional')"
    echo "  description   - Project description (e.g., '3 Funciones Recursivas')"
    echo ""
    echo "Example:"
    echo "  $0 . 'Complejidad Computacional' '3 Funciones Recursivas'"
    echo "  $0 /path/to/project 'Algoritmos' '2 Grafos'"
    exit 1
}

# Check if correct number of arguments provided
if [ $# -ne 3 ]; then
    echo "Error: Invalid number of arguments"
    usage
fi

PROJECT_PATH="$1"
SUBJECT="$2" 
DESCRIPTION="$3"

echo "Description: $DESCRIPTION"

# Create directories
mkdir -p "$PROJECT_PATH/.vscode"

# Create cpp.json with proper JSON format
cat > "$PROJECT_PATH/.vscode/headers.code-snippets" << EOF
{
  "comentarios_cabecera": {
    "prefix": "comen_cab",
    "body": [
      "/**",
      " * @fileoverview Universidad de La Laguna",
      " * Escuela Superior de Ingeniería y Tecnología",
      " * Grado en Ingeniería Informática",
      " * $SUBJECT",
      " * $DESCRIPTION - \${1:short description}",
      " *",
      " * @author Samuel Rodríguez <alu0101545714@ull.edu.es>",
      " * @since \$CURRENT_DAY_NAME_SHORT \$CURRENT_DATE/\$CURRENT_MONTH/\$CURRENT_YEAR",
      " * @see {@link https://github.com/Samuel9645/\$WORKSPACE_NAME}",
      " */",
      "",
      "\$0"
    ],
    "description": "Header comment for current project"
  },
  "comentarios_cab_def_clase": {
    "prefix": "comen_cab_def_clase",
    "body": [
      "/**",
      " * Universidad de La Laguna",
      " * Escuela Superior de Ingeniería y Tecnología",
      " * Grado en Ingeniería Informática",
      " * $SUBJECT",
      " * $DESCRIPTION - Definition for \${TM_FILENAME_BASE/^(.*)\$/\${1:/pascalcase}/} class",
      " *",
      " * @author Samuel Rodríguez <alu0101545714@ull.edu.es>",
      " * @since \$CURRENT_DAY_NAME_SHORT \$CURRENT_DATE \$CURRENT_MONTH_NAME_SHORT \$CURRENT_YEAR",
      " * @see {@link https://github.com/Samuel9645/\$WORKSPACE_NAME}",
      " */",
      "",
      "#include \"\${RELATIVE_FILEPATH}\"",
      "",
      "\$0"
    ],
    "description": "Definition class header"
  },
  "comentarios_cab_dec_clase": {
    "prefix": "comen_cab_dec_clase",
    "body": [
      "/**",
      " * Universidad de La Laguna",
      " * Escuela Superior de Ingeniería y Tecnología",
      " * Grado en Ingeniería Informática",
      " * $SUBJECT",
      " * $DESCRIPTION - Declaration for \${TM_FILENAME_BASE/^(.*)\$/\${1:/pascalcase}/} class",
      " *",
      " * @author Samuel Rodríguez <alu0101545714@ull.edu.es>",
      " * @since \$CURRENT_DAY_NAME_SHORT \$CURRENT_DATE \$CURRENT_MONTH_NAME_SHORT \$CURRENT_YEAR",
      " * @see {@link https://github.com/Samuel9645/\$WORKSPACE_NAME}",
      " */",
      "",
      "#ifndef \${TM_DIRECTORY/(?:^.*?src[\\\\\\\\/])?([^\\\\/-]+)([\\\\/-]?)/\${1:/upcase}\${2:+_}/g}_\${TM_FILENAME_BASE/([^.\\\\-]+)([\\\\.\\\\-]?)/\${1:/upcase}\${2:+_}/g}_H",
      "#define \${TM_DIRECTORY/(?:^.*?src[\\\\\\\\/])?([^\\\\/-]+)([\\\\/-]?)/\${1:/upcase}\${2:+_}/g}_\${TM_FILENAME_BASE/([^.\\\\-]+)([\\\\.\\\\-]?)/\${1:/upcase}\${2:+_}/g}_H",
      "",
      "class \${TM_FILENAME_BASE/^(.*)\$/\${1:/pascalcase}/} {",
      "public:",
      "  \${TM_FILENAME_BASE/^(.*)\$/\${1:/pascalcase}/}(\$1);",
      "",
      "private:",
      "  \$0 ",
      "};",
      "",
      "#endif // \${TM_DIRECTORY/(?:^.*?src[\\\\\\\\/])?([^\\\\/-]+)([\\\\/-]?)/\${1:/upcase}\${2:+_}/g}_\${TM_FILENAME_BASE/([^.\\\\-]+)([\\\\.\\\\-]?)/\${1:/upcase}\${2:+_}/g}_H"
    ],
    "description": "Declaration class header"
  }
}
EOF
# 
echo "Snippets created successfully in $PROJECT_PATH/.vscode/snippets/"
echo "Settings created in $PROJECT_PATH/.vscode/headers.code-snippets"