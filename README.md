# FIGsay

> 👀 **Look here**
>
> Can't read Spanish? [Click here to read this in English](/README.en.md).

La aplicación `figsay` es un herramienta CLI que produce texto en la forma de
arte de ASCII con fuentes compatible con FIGlet. Las fuentes incluidas con
`figsay` fueron copiadas desde `patorjk/figlet.js` en GitHub.

## Uso

Aquí ay un ejemplo de como se usa `figsay` pa' producir texto (`hola`) en base
ASCII con una fuente llamada `Larry 3D` con un ancho de `80` caracteres y
alineación de el centro (`c`).

```sh
>_ figsay -t "hola" -f "Larry 3D" -w 80 -c

# produce lo siguiente
                       __              ___
                      /\ \            /\_ \
                      \ \ \___     ___\//\ \      __
                       \ \  _ `\  / __`\\ \ \   /'__`\
                        \ \ \ \ \/\ \L\ \\_\ \_/\ \L\.\_
                         \ \_\ \_\ \____//\____\ \__/.\_\
                          \/_/\/_/\/___/ \/____/\/__/\/_/
```

Ejecutando `figsay -h` te muestra la ayuda incluida y que lo que cada opción
configura. El interfaz es similar al comando original de `figlet`.

```sh
>_ figsay

figsay usage:
        t) # Custom text is required to display anything
        w) # Allow for the width of the figlet to be defined too
        f) # Allow for a custom font to be defined too. This disables iterating
        d) # Allow for font directory
        c | l | r) # Allow for justification
        h | *) # Display help
```

### Consejo

Cuando no se incluye `-f` pa' escoger la fuente pa' mostrar, `figsay` muestra
todas las fuentes que se encuentra en la carpeta de fuentes — _294 fuentes están
incluidas en la carpeta de fuentes configurada por defector al tiempo de
escribir esto_. Por que este gran numero de fuentes tu ordenador se puede
abrumar con lo que produce `figsay`. Por esta razón, se recomienda usar un
`PAGER` como `less` pa' controlar la salida a tu ordenador.

```sh
>_ figsay -t "quiubo pues" | less
```

## Construyendo `figsay` con Nix

> ℹ️ **Aviso**
>
> Este proyecto usa a Nix pa' construir y instalar a FIGsay. Pa' saber más sobre
> Nix, lea la documentación de como instalarlo en tu computadora.

Pa' construir a FIGsay en tu computadora incluyendo todo las dependencias,
ejecute el siguiente comando usando `just`.

```sh
>_ just build
```

Pa' instalar a FIGsay en tu computadora, ejecute el siguiente comando usando
`just`.

```sh
>_ just install
```
