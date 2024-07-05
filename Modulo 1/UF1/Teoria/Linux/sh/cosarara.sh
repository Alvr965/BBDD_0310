#!/bin/bash

# Definir el directorio del que deseas trabajar
directorio="/ruta/al/directorio"

# Función para borrar un archivo
borrar_archivo() {
    echo "Ingrese el nombre del archivo que desea borrar:"
    read nombre_archivo
    if [ -f "$directorio/$nombre_archivo" ]; then
        rm "$directorio/$nombre_archivo"
        echo "Archivo $nombre_archivo borrado exitosamente."
    else
        echo "El archivo $nombre_archivo no existe en el directorio."
    fi
}

# Función para visualizar un archivo
visualizar_archivo() {
    echo "Ingrese el nombre del archivo que desea visualizar:"
    read nombre_archivo
    if [ -f "$directorio/$nombre_archivo" ]; then
        cat "$directorio/$nombre_archivo"
    else
        echo "El archivo $nombre_archivo no existe en el directorio."
    fi
}

# Función para copiar un archivo
copiar_archivo() {
    echo "Ingrese el nombre del archivo que desea copiar:"
    read nombre_archivo
    echo "Ingrese el nombre para el nuevo archivo:"
    read nuevo_nombre
    if [ -f "$directorio/$nombre_archivo" ]; then
        cp "$directorio/$nombre_archivo" "$directorio/$nuevo_nombre"
        echo "Archivo $nombre_archivo copiado como $nuevo_nombre."
    else
        echo "El archivo $nombre_archivo no existe en el directorio."
    fi
}

# Mostrar el menú
while true; do
    echo "Seleccione una opción:"
    select opcion in "Borrar archivo" "Visualizar archivo" "Copiar archivo" "Salir"; do
        case $opcion in
            "Borrar archivo")
                borrar_archivo
                break
                ;;
            "Visualizar archivo")
                visualizar_archivo
                break
                ;;
            "Copiar archivo")
                copiar_archivo
                break
                ;;
            "Salir")
                echo "Saliendo del menú."
                exit 0
                ;;
            *)
                echo "Opción no válida. Por favor, seleccione nuevamente."
                ;;
        esac
    done
done
