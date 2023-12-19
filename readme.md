*at last, i've released...*

# ThatNerd's Dotfiles

A variety of configurations can be found here, from my neovim config, Ubersicht
widgets, installers, quick Python scripts, keybinds, and TWM setup.

Some of the files in here, particularly the install script, are macOS-specific.
While I have a side interest in Linux and can see Windows improving, I'm not
planning to switch to or daily-drive either of those OSes in the near future, so
I'm not adding contingencies for them at the moment.


WIDGETS CURRENTLY IN:
/Users/nathanyeung/Library/Application Support/Übersicht/widgets


## todo
- [ ] split personal information into private submodule
- [-] clean up vscode settings
- [ ] organize zshrc, extract aliases?
- [x] organize init.vim, remove unnecessary code/plugins
- [x] update brewfile
- [ ] organize scripts, archive old ones, add new ones?
- [ ] organize snippets
- [x] add gitconfig
- [ ] firefox config?
- [ ] what do i do about ubersicht widgets?
- [ ] yabai/skhd? rectangle? amethyst?
- [ ] spicetify, iterm
- [ ] move in as many config files as possible (go thru brewfile)
- [ ] use scoop on windows
- [ ] enable sudo using touchid

## philosophy
- prioritize macOS first, popos at a distant second, windows last
- spend a minimal amount of time on configuration/only configure things that
  have a nontrivial beneficial impact
---

heart hands bg?
do i still need oh-my-zsh?
is superstat in my brewfile? can i tap it somehow?
rebind hotkey window to c-` ?
rebind mdlink
automatically create desktops/set walls?


<details>
<summary>Why VSCode?</summary>
</details>

<details>
<summary>Why Firefox Developer Edition?</summary>

- good devtools
- fast

</details>

<details>
<summary>Why iTerm2 instead of the macOS Terminal?</summary>

- hotkey window
- shell integration
- better tab/title bar aesthetic, imo
- advanced paste continually saving my life
- `cmd-opt-a` to receive a notification when a command finishes running (this is
  a lifesaver when doing big package updates, cloning giant repos, etc)
- `cmd-;` to autocomplete
- split view (ever wanted to run your frontend and backend in dev and see both
  processes at once?)
    - yes, i know i could use tmux. no, i can't be bothered.

Other terminal apps are either too fancy or don't have the native feel that
iTerm has.

</details>
