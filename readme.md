# `~` is where the `dotfiles/` are

This repo contains pretty much my entire software setup - everything from my
scripts, editor configs, macOS settings, custom keyboard remaps, etc. Feel free
to take a look around! (don't mind the unhinged comments). Many configurations
may be specific to my setup, such as macOS-specific paths, but they should be
easily adaptable to other platforms (at least *nixes - Windows may be a
different story).

Generally, I don't want to spent too much time maintaining my config, so you
won't find anything particularly complex in here - no TWMs, big configuration
frameworks (*cough* oh-my-zsh *cough*), giant custom editor setups, etc. I've
tried to keep things minimal, but whether or not I've succeeded at that is an
exercise left to the reader :)

## points of interest

- find a comprehensive list of the tools I use in the
  [Brewfile](https://github.com/ThatNerdSquared/dotfiles/blob/main/Brewfile)
- check out my
  [vim config](https://github.com/ThatNerdSquared/dotfiles/blob/main/vim)
  and laugh at my feeble attempt to avoid the vim rabbit hole
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

- default macOS terminal doesn't properly display nvim colourschemes
- hotkey window feature allows you to summon a terminal window anywhere
- `cmd-opt-a` to receive a notification when a command finishes running (this is
  a lifesaver when doing big package updates, cloning giant repos, etc)
- advanced paste feature to quickly edit pasted commands before running them
- shell integration (view images in the terminal!)
- split view (ever wanted to run your frontend and backend in dev and see both
  processes at once?)
    - yes, i know i could use tmux. no, i can't be bothered.
- better tab/title bar aesthetic, imo

Other terminal apps are either too fancy or don't have the native feel that
iTerm has.
</details>
