[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![JCS-ELPA](https://raw.githubusercontent.com/jcs-emacs/badges/master/elpa/v/hl-preproc.svg)](https://jcs-emacs.github.io/jcs-elpa/#/hl-preproc)

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

## 💾 Quickstart

```el
(use-package hl-preproc
  :ensure t
  :hook (csharp-mode . (lambda () (hl-preproc-mode 1))))
```

## 🔨 Basic Usage

##### `(hl-preproc-mode &optional ARG)`

To enable/disable this package.

##### `hl-preproc-extra-constants`

Extra define constants, just in case if [meta-net](https://github.com/emacs-vs/meta-net)
does not parse define constants correctly.

##### `hl-preproc-delay`

Seconds of delay before highlighting invalid preprocessor regions.

##### `hl-preproc-face`

Face to highlight all invalid code.

## 🔗 References

* [C# - Preprocessor Directives](https://www.tutorialspoint.com/csharp/csharp_preprocessor_directives.htm)

## 🛠️ Contribute

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)
[![Elisp styleguide](https://img.shields.io/badge/elisp-style%20guide-purple?logo=gnuemacs&logoColor=white)](https://github.com/bbatsov/emacs-lisp-style-guide)
[![Donate on paypal](https://img.shields.io/badge/paypal-donate-1?logo=paypal&color=blue)](https://www.paypal.me/jcs090218)
[![Become a patron](https://img.shields.io/badge/patreon-become%20a%20patron-orange.svg?logo=patreon)](https://www.patreon.com/jcs090218)

If you would like to contribute to this project, you may either
clone and make pull requests to this repository. Or you can
clone the project and establish your own branch of this tool.
Any methods are welcome!

### 🔬 Development

To run the test locally, you will need the following tools:

- [Eask](https://emacs-eask.github.io/)
- [Make](https://www.gnu.org/software/make/) (optional)

Install all dependencies and development dependencies:

```sh
eask install-deps --dev
```

To test the package's installation:

```sh
eask package
eask install
```

To test compilation:

```sh
eask compile
```

**🪧 The following steps are optional, but we recommend you follow these lint results!**

The built-in `checkdoc` linter:

```sh
eask lint checkdoc
```

The standard `package` linter:

```sh
eask lint package
```

*📝 P.S. For more information, find the Eask manual at https://emacs-eask.github.io/.*

## ⚜️ License

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.

See [`LICENSE`](./LICENSE.txt) for details.
