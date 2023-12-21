# `~` is where the `dotfiles/` are

This repo contains pretty much my entire software setup - everything from my
scripts, editor configs, macOS settings, custom keyboard remaps, etc. Feel free
to take a look around! Many configurations may be specific to my setup, such as
macOS-specific paths, but they should be easily adaptable to other platforms
(at least *nixes - Windows may be a different story).

Generally, I don't want to spent too much time maintaining my config, so you
won't find anything particularly complex in here - no TWMs, big configuration
frameworks (*cough* oh-my-zsh *cough*), giant custom editor setups, etc. I've
tried to keep things minimal, but whether or not I've succeeded at that is an
exercise left to the reader :)

## points of interest

- find a comprehensive list of the tools I use in the
  [Brewfile](https://github.com/ThatNerdSquared/dotfiles/blob/main/Brewfile)
- check out my
  [init.vim](https://github.com/ThatNerdSquared/dotfiles/blob/main/nvim/init.vim)
  and laugh at my feeble attempt to avoid the neovim rabbit hole
- the answer to how I can type $\LaTeX$ so fast can be found in
  [latex-snippets.yml](https://github.com/ThatNerdSquared/dotfiles/blob/main/espanso/match/latex-snippets.yml)
- if you've ever borrowed my laptop and wondered why the keyboard is so
  strange,
  [karabiner.json](https://github.com/ThatNerdSquared/dotfiles/blob/main/bindings/karabiner.json)
  contains all of the funky little remaps I've applied
- some useful scripts:
    - [`fastgit`](https://github.com/ThatNerdSquared/dotfiles/blob/main/scripts/fastgit)
      helps you quickly review changes in a git repo and stage, discard, or
      commit them
        - requires [`gum`](https://github.com/charmbracelet/gum)
    - [`rdgf`](https://github.com/ThatNerdSquared/dotfiles/blob/main/scripts/rdgf)
      allows you to easily **R**ecover any **D**eleted **G**it repo **F**ile at any point
      in time
        - requires [`fzf`](https://github.com/junegunn/fzf)
    - [`fmt-mdlink`](https://github.com/ThatNerdSquared/dotfiles/blob/main/scripts/fmt-mdlink)
      converts a URL on your clipboard into a nicely-formatted markdown URL
        - requires `python3`
    - [`compress-pdf`](https://github.com/ThatNerdSquared/dotfiles/blob/main/scripts/compress-pdf)
      compresses PDFs - this can be a little unreliable though, and doesn't
      always work
        - requires [`gum`](https://github.com/charmbracelet/gum), `gs`
          (ghostscript)

## faq
<details>
<summary>Why iTerm2 instead of the default macOS Terminal?</summary>

- hotkey window feature allows you to summon a terminal window anywhere
- `cmd-opt-a` to receive a notification when a command finishes running (this
  is a lifesaver when doing big package updates, cloning giant repos, etc)
- advanced paste feature to quickly edit commands before running them
- shell integration (view images in the terminal!)
- split view (ever wanted to run your frontend and backend in dev and see both
  processes at once?)
    - yes, i know i could use tmux. no, i can't be bothered.
- better tab/title bar aesthetic, imo

Other terminal apps are either too fancy or don't have the native feel that
iTerm has.
</details>
<details>
<summary>Why is your neovim config in vimscript instead of lua?</summary>

I actually started out on vim, so this used to be a `.vimrc`. Later when I
swapped to neovim (mainly for LSP), I couldn't be bothered to rewrite the
config in lua. That's also why a lot of the plugins I use are vimscript plugins
rather than newer lua-based ones. To this day, I still like keeping my config
in vimscript - I think it might be less performant but I feel it's simpler and
doesn't encourage overconfiguration in the same way a lua config would. I do
still do some configuration in lua, though, mainly for plugins that can't be
configured any other way - I just keep it in a separate file.

</details>
