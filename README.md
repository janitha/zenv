# Zenv

`zenv` is a shell extension designed to create isolated working environments. It allows you to run arbitrary commands and set environment variables to configure your workspace effortlessly.

Isolation is achieved by creating a new subshell when entering a zenv-aware directory or workspace, preserving the original environment. This approach differentiates `zenv` from tools like `dotenv` and `autoenv`

## Prerequisites

- Zsh

# Usage

To mark a directory as a zenv environment, create a .zenv file in that directory. This file will be sourced within the context of the new subshell.

Example `.zenv. file

```sh
# Set enviornment variables
export MY_APP_KEY=value
# Run commands
source .venv/bin/activate
```

## Activating

To enter a zenv-aware workspace, `zenv` must be activated explicitly.

```
[user@host ~]% zenv ~/foo/bar
>>> Entered a state of Zenv: /home/user/foo/bar >>>

[user@host (bar)](ž)(main±)% cd cat/dog
[user@host (bar)/cat/dog](ž)(main±)%
```

## Deactivating

To leave the zenv-aware directory:

```
[user@host (bar)](ž)(main±)% exit
<<< Exited a state of Zenv: /Users/janitha/dotfiles <<<

[user@host ~]%
```

## Misc

Once zenv is activated on a directory, the root name of the directory will be cached as a shortcut, which can be used in subsequent invocations as a shorthand.

```
[user@host ~]% zenv ~/xxx/yyy/zzz
[user@host (zzz)](ž)(main±)% exit

[user@host ~]% zenv zzz
[user@host (zzz)](ž)(main±)% exit
```

By default, the name of the zenv-aware enviornment is the base most directory. However it can be overriden by specifying a `ZENV_NAME` in the `.zenv` file. This will also be used as the shortcut name.

# Prompt Integration

## Oh-My-Zsh like Prompts

Use the `_zenv_prompt_info` in the prompt theme.

## Zen-prompt

Prompt hooks will automatically be added to the zen-prompt. A marker `(ž)` will denote that the zenv is active, with multiple markers indicating deeper levels of nesting. Additionally, the directory path will be substituted with the zenv environment path.
