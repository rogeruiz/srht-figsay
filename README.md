# Figsay

This repository contains code which builds a Nix derivation for a custom Shell
script which leverages `fd`, `ripgrep`, & `figlet` to aid in creating custom
text output of FIGlet fonts with provided text.

## Usage

Here's an example which uses the text `hello` and the font `larry3d` with a
width of `80` and an alignment of `center` below.

```sh
>_ figsay -t "hello" -f "larry3d" -w 80 -c

# outputs the following

                     __              ___    ___
                    /\ \            /\_ \  /\_ \
                    \ \ \___      __\//\ \ \//\ \     ___
                     \ \  _ `\  /'__`\\ \ \  \ \ \   / __`\
                      \ \ \ \ \/\  __/ \_\ \_ \_\ \_/\ \L\ \
                       \ \_\ \_\ \____\/\____\/\____\ \____/
                        \/_/\/_/\/____/\/____/\/____/\/___/


```

Running `figsay` without any arguments will show what each flag is configuring.

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

Since FIGlet installs a large number of fonts, when discovering new ones you
should pipe the output into a PAGER such as `less`.

```sh
>_ figsay -t "hi, there" | less
```

## Building the script locally with Nix

To build the script locally including all of its dependencies, you can run the
following `nix-build` command.

```sh
>_ nix-build default.nix
```

To install the script on your machine, you can run the following `nix-env`
command.

```sh
>_ nix profile install -f default.nix
```
