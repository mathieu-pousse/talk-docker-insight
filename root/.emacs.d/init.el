(require 'cl-lib)
(require 'package)

(package-initialize)

(defvar packages
  '(ox-ioslide)
  "A list of packages to ensure are installed at launch.")

(setq package-archives '(
                          ("gnu" . "https://elpa.gnu.org/packages/")
                          ("marmalade" . "https://marmalade-repo.org/packages/")
                          ("melpa" . "http://melpa.org/packages/") ;; Not HTTPS, not signed (yet).
                          ))

(defun packages-installed-p ()
  "Get all those in 'packages' that have already been installed."
  (cl-every #'package-installed-p packages))

(defun install-packages ()
  "Install all packages listed in `packages'."
  (unless (packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Emacs is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (mapc #'package-install
     (cl-remove-if #'package-installed-p packages))))

(install-packages)
(require 'ox-ioslide)
