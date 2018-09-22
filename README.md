# tridactyl-mode

Major mode for editing
[Tridactyl](https://github.com/tridactyl/tridactyl) configuration, an
extension for Firefox web browser.

# Installation

Install from [MELPA](https://melpa.org/).

# Usage

If installed through package.el everything will work out of the box.
Otherwise register the mode in `auto-mode-alist`:

``` emacs-lisp
(add-to-list 'auto-mode-alist '("tridactylrc\\'" . tridactyl-mode))
```
