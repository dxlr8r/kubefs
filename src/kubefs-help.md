Manage multiple kubeconfigs with your filesystem

# Usage

kubefs  <command1> [command2] ... [commandN] [path]

# Available commands

get
  prints the current KUBECONFIG

cd [path]
  cd to a directory containing a .kubeconfig, and lock session. If no argument
  is given it will cd to the current KUBECONFIG.

list
  prints the current KUBECONFIG as an env variable

list-all
  shows shell, session and globally locked KUBECONFIG

auth [path]
  executes `.kubeauth` in path, if path not specified it will use current
  working directory

lock
  <global/session>
    <set> [path]
      locks KUBECONFIG to path
    <toggle>
      toggles lock
    <del>
      delete lock
    <get>
      prints the current lock if any
    <list>
      prints the current lock as an env variable

# Available arguments

path  a file or directory depending on the command. If a directory is given, and
      the command does not find .kubeconfig or .kubeauth, it will search for the
      first occurence of the file in the parent tree.

# Options

KUBEFS_CD_SESSION (default: `false`)
  when using `kubefs cd` without `path` as an argument, set path to the session
  lock's directory if set, if not attempt global lock's directory.

KUBEFS_CD_SESSION_LOCK (default: `false`)
  when using `kubefs cd` with `path` as an argument, do a
  `kubefs lock session set` towards that `path`.

KUBEFS_AUTH_SESSION_LOCK (default: `false`)
  when using `kubefs auth` with `path` as an argument, do a
  `kubefs lock session set` towards that `path`.

KUBEFS_AUTH_AUTO_CD (default: `false`)
  when using `kubefs auth` with `path` as an argument, cd to that path.

KUBEFS_RECOMMENDED_ALIAS (default: `true`)
  recommended aliases that makes short aliases of long commands. Only turn off
  if you know what you are doing.
    - `kf` -> `kubefs`
    - `kubefs` -> `kubefs`, set `KUBECONFIG` to `.kubeconfig`'s path

KUBEFS_OPTIONAL_ALIAS (default: `true`)
  recommended aliases that makes short aliases of long commands.
    - `kfg` `kubefs lock global toggle`
    - `kfe` `kubefs lock session set`
    - `kfl` `kubefs lock session toggle`
    - `kfc` `kubefs cd`
    - `kfa` `kubefs auth`
    - `kfls` `kubefs list-all`
    - for each tool in `KUBEFS_TOOL` set `KUBECONFIG` to `.kubeconfig`'s path 

KUBEFS_BASE_ADDONS (default: `true`)
  enable all base addons:
    - `kx` for listing and changing context
    - `kn` for listing and changing namespace
    - `kubefs init auth` creates a .kubeauth in current directory

KUBEFS_ROOT (default: `$HOME/.kube`)
  where to search for .kubeconfig and .kubeauth. Recommended to keep unchanged.

KUBEFS_TOOL (default: `tk:helm`)
  a list of tools, separated by `:`. See `KUBEFS_OPTIONAL_ALIAS`.

KUBEFS_COMPLETION (default: `true`)
  automatic sourcing of kubefs completion (bash shell). Defaults to false if
  bash is not the current shell.

KUBEFS_DEBUG (default: `false`)
  enable debugging

# Examples
## Options

`KUBEFS_CD_SESSION`, `KUBEFS_CD_SESSION_LOCK`, `KUBEFS_AUTH_SESSION_LOCK`: while
`false` by default, `true` is recommended for heavy shell users. Add to your
~/.profile:

```
KUBEFS_CD_SESSION=true
KUBEFS_CD_SESSION_LOCK=true
KUBEFS_AUTH_SESSION_LOCK=true
```

# About
## Precedent

`kubefs` will tell `kubectl` to use a config file in the follow order:

1. lock session (`LOCK_KUBECONFIG`)
2. `.kubeconfig` in current path or first occurence in the parent tree.
3. lock global (`~/kube/config`)

# Notes
## KUBECONFIG

When using/sourcing `kubefs` with `KUBEFS_RECOMMENDED_ALIAS=true` (default) you
can no longer specify `KUBECONFIG`, use `kubectl --kubeconfig` instead, or
disable `KUBEFS_RECOMMENDED_ALIAS=false` and `unalias kubectl` in open shells.
