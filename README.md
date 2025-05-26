# Installation

install.sh will install kubefs, to `KUBEFS_LIBEXEC_DIR` and `KUBEFS_PROFILE_DIR`, depending if you run the installer as root or as a regular user (non root).

|         ENV        |           USER          |        ROOT         |
|--------------------|-------------------------|---------------------|
| KUBEFS_LIBEXEC_DIR | ~/.local/libexec/kubefs | /usr/libexec/kubefs |
| KUBEFS_PROFILE_DIR | ~/.local/profile.d      | /etc/profile.d      |

It is recommended to not alter the defaults.

Install to any POSIX compliant shell, bash recommended for shell completion, execute:

```sh
curl -LSq --no-progress-meter --fail-with-body https://raw.githubusercontent.com/dxlr8r/kubefs/master/install.sh | sh -
```

Then you need to source `kubefs`, I recommend adding something like the following to your `.bashrc`, or similar:

```sh
. ~/.local/profile.d/kubefs.sh
. ~/.local/profile.d/kubefs-addons.sh
```

Or if you just want to source everything in `profile.d`, then something like this will do:

```sh
if test -d ~/.local/profile.d; then
for f in ~/.local/profile.d/*; do
. "$f"
done
```
