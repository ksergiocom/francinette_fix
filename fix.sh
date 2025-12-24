#!/bin/bash

# Carpeta raíz
ROOT_DIR="$HOME/francinette"

# Buscar todos los archivos .py y reemplazar la línea
find "$ROOT_DIR" -type f -name "*.py" | while read -r file; do
    if grep -q "from pipes import quote" "$file"; then
        echo "Modificando $file..."
        # Usamos sed para reemplazar la línea completa
        sed -i 's|from pipes import quote|import shlex\nquote = shlex.quote|' "$file"
    fi
done

echo "Listo! Todas las ocurrencias de 'from pipes import quote' han sido reemplazadas."

