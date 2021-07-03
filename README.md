[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
![CI](https://github.com/emacs-vs/hl-preproc/workflows/CI/badge.svg)

# hl-preproc
> Unhighlight invalid preprocessor region

## :floppy_disk: Quickstart

```el
(use-package hl-preproc
  :ensure t
  :hook (csharp-mode . (lambda () (hl-preproc-mode 1))))
```

## Contribution

If you would like to contribute to this project, you may either
clone and make pull requests to this repository. Or you can
clone the project and establish your own branch of this tool.
Any methods are welcome!
