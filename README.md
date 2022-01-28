[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![CELPA](https://celpa.conao3.com/packages/hl-preproc-badge.svg)](https://celpa.conao3.com/#/hl-preproc)
[![JCS-ELPA](https://raw.githubusercontent.com/jcs-emacs/jcs-elpa/master/badges/v/hl-preproc.svg)](https://jcs-emacs.github.io/jcs-elpa/#/hl-preproc)

# hl-preproc
> Unhighlight invalid preprocessor region

![CI](https://github.com/emacs-vs/hl-preproc/workflows/CI/badge.svg)

<p align="center">
  <img src="./etc/demo.gif" width="534" height="217"/>
</p>

This package uses [meta-net](https://github.com/emacs-vs/meta-net) to parse
all define constants inside a csproj file. The output of the highlighting
should be very close to IDE but more lightweight. We only extract information
we need to do the highlighting.

## :floppy_disk: Quickstart

```el
(use-package hl-preproc
  :ensure t
  :hook (csharp-mode . (lambda () (hl-preproc-mode 1))))
```

## :hammer: Basic Usage

##### `(hl-preproc-mode &optional ARG)`

To enable/disable this package.

##### `hl-preproc-extra-constants`

Extra define constants, just in case if [meta-net](https://github.com/emacs-vs/meta-net)
does not parse define constants correctly.

##### `hl-preproc-delay`

Seconds of delay before highlighting invalid preprocessor regions.

##### `hl-preproc-face`

Face to highlight all invalid code.

## :link: References

* [C# - Preprocessor Directives](https://www.tutorialspoint.com/csharp/csharp_preprocessor_directives.htm)

## Contribute

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)
[![Elisp styleguide](https://img.shields.io/badge/elisp-style%20guide-purple)](https://github.com/bbatsov/emacs-lisp-style-guide)

If you would like to contribute to this project, you may either
clone and make pull requests to this repository. Or you can
clone the project and establish your own branch of this tool.
Any methods are welcome!
