# FIGsay

> 👀 **Pilla esto**
>
> ¿No puedes leer inglés? [Haga clic aquí pa' leerlo en español](/README.md).

The `figsay` application is a CLI-tool that produces text in ASCII-art form with
FIGlet compatible fonts. The fonts included with `figsay` were copied from
`patorjk/figlet.js` from GitHub.

## Usage

Here's an example of how to use `figsay` to produce ASCII-art text (`hello`)
with a font called `Larry 3D` with a width of `80` characters and center (`c`)
alignment.

```sh
>_ figsay -t "hello" -f "Larry 3D" -w 80 -c

# outputs the following
                     __              ___    ___
                    /\ \            /\_ \  /\_ \
                    \ \ \___      __\//\ \ \//\ \     ___
                     \ \  _ `\  /'__`\\ \ \  \ \ \   / __`\
                      \ \ \ \ \/\  __/ \_\ \_ \_\ \_/\ \L\ \
                       \ \_\ \_\ \____\/\____\/\____\ \____/
                        \/_/\/_/\/____/\/____/\/____/\/___/
```

Running `figsay -h` will show the help and what each option is configuring. The
interface is similar to the original `figlet` command.

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

### Advice

When you don't include the option `-f` to select a font to show, FIGsay will
show all the fonts that it can find in the configured font-directory — _294
fonts are included in the default font directory at the time of this writing_.
Because of this large number of fonts, your terminal can easily become
overwhelmed by what `figsay -t <TEXT>` produces. Because of this, it's
recommended you use a `PAGER` such as `less` to pipe the output.

```sh
>_ figsay -t "hi, there" | less
```

## Building the script locally with Nix

> ⚠️ **Warning**
>
> This project uses Nix to build and install FIGsay. To learn more about Nix,
> read the documentation on how to install it on your computer.

To build the script locally including all of its dependencies, you can run the
following `nix-build` command using `just`.

```sh
>_ just build
```

To install the script on your machine, you can run the following `nix-env`
command using `just`.

```sh
>_ just install
```
