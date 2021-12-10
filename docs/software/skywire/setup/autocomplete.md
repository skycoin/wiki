# Autocompletion

### Bash Autocompletion
 
```bash
$ make build
```
```
$ ./skywire-cli completion bash  > /etc/bash_completion.d/skywire-cli-completion
```
```
$ source /etc/bash_completion.d/skywire-cli-completion
```
Restart the shell for the completions to become available.

### Zsh Autocompletion

```bash
$ make build
```
```
$ ./skywire-cli completion zsh  > $ZSH/_skywire-cli
```
```
$ source $ZSH/_skywire-cli
```
Restart the shell for the completions to become available.

### Fish Autocompletion

```bash
$ make build
```
```
$ ./skywire-cli completion fish  > ~/.config/fish/completions/skywire-cli.fish
```
```
$ source ~/.config/fish/completions/skywire-cli.fish
```
Restart the shell for the completions to become available.

### Powershell Autocompletion

The script is designed to support all three PowerShell completion modes:

* TabCompleteNext (default windows style - on each key press the next option is displayed)
* Complete (works like bash)
* MenuComplete (works like zsh)

Set the mode with `Set-PSReadLineKeyHandler -Key Tab -Function <mode>`. Descriptions are only displayed when using the `Complete` or `MenuComplete` mode.

Users need PowerShell version 5.0 or above, which comes with Windows 10 and can be downloaded separately for Windows 7 or 8.1. They can then write the completions to a file and source this file from their PowerShell profile, which is referenced by the `$Profile` environment variable. See `Get-Help about_Profiles` for more info about PowerShell profiles.

```bash
$ make build
```
```
$ ./skywire-cli completion powershell  > skywire-cli.ps1
```
Restart the shell for the completions to become available.