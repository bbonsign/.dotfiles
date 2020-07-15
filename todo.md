# TODOs related to dotfiles/configuration

## Vim
- [ ] Find/learn a markdown plug-in that has bindings for adding links etc. Similar to org-mode
- [ ] Is there an org-mode port to vim?
- [x] Add `<leader>h` which-key prefix for help commands. Works for now. Look into how to add a space after the help prompt
- [x] Add `<leader>s` which-key prefix for spelling commands. Conflicts with s for search
- [ ] Look into reworking drag lines up/down (M-j or k), as described: <https://www.youtube.com/watch?v=X5IAdaN6IwM>
- [ ] Multiple cursors? <https://vimawesome.com/plugin/vim-multiple-cursors>
- [ ] Change default key bindings for table-mode plug-in -- conflicts with whichkey['t']. Plugin is not activated currently.
- [ ] Update Scratch() to check for current scratch buffer to open first, else create one.
- [ ] Implement persistent buffer local spell ignore lists, see <https://vi.stackexchange.com/questions/9925/ignore-word-spelling-on-a-per-file-buffer-basis>
- [ ] Vinfo plugin for reading GNU info in vim (closer behavior to emacs, hopefully): <https://sillybytes.net/vinfo/>
- [ ] Set up which-key mappings for a localleader key, maybe '\'.
- [ ] Write function to append ';' to lines in a region, if they don't have one. Currenly <leader>l; will append to one line at a time.

## TMUX
- [ ] Look into common actions that don't have bindings yet, e.g. spread panes evenly (currently leader+M1 for vertical layout)
- [ ] Look into occasional flickering in tmux
- [ ] Reinstall tmxinator to save sessions I don't need on every startup.
- [ ] Set up saving neovim sessions along with the tmux sessions, and possibly some other running programs.

## Fish
- [ ] Look into fzf man wrapper to allow searching man pages
- [ ] Add alias for grep and sed to use -E for extended reg exs, and colorized output for grep

## Cmus
- [ ] Start config file with more mnemonic key bindings

## Lazydocker
- [ ] Read docs: <https://github.com/jesseduffield/lazydocker#usage>

## tldr
- [ ] Currently installed with npm, but look into brew version: <https://github.com/tldr-pages/tldr-c-client>

## OSX
- [x] Set change workspace left/right to Cmd+H/L. Look into a way to add this to dotfiles or .macos file. Actually, Cmd+L overrides the browser mapping that focuses the url/search bar.

## Fonts
- [ ] Set up an italic font for comments, at least in vim or kitty.  FiraCode Nerd doesn't have italics

## Programs to look into or install
- Glances: cli/web-interface system status tool like htop: <https://github.com/nicolargo/glances>
- docui: <https://github.com/skanehira/docui> another docker tui with possibly different abilities than lazydocker
- ctop: <https://github.com/bcicen/ctop> like htop for running containers
- http-prompt: <https://github.com/eliangcs/http-prompt> interactive prompt for building httpie calls
- eg: similar to tldr command <https://github.com/srsudar/eg>
- dash: collects documentations sources together to avoid going to a browser so much. Downside: seems to be macos specific
- ranger: customizable terminal file browser with a lot of potential convenient key bindings
- nnn: one alternative to ranger, there are several others on the ranger wiki, thats more light weight, but with perhaps fewer features/configure-ability.
- zathura: pdf reader, seems to be recommended by people
- cheat.sh <https://github.com/chubin/cheat.sh> for programming cheat sheets.  Good integration with vim.  From maker of wttr.in
- tokei: count code: <https://github.com/XAMPPRocky/tokei>
