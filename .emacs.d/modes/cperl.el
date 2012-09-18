;;;;============================================================================
;;;; Utilities and customizations for cperl mode
;;;;============================================================================
(defalias 'perl-mode 'cperl-mode)

(defun stevea-cperl-tidy ()
  "Runs perltidy on current buffer"
  (interactive)
  (shell-command (concat "perltidy " buffer-file-name)))

;;; TODO: This could do a lot more.  For one thing, currently you need to
;;; be in the .t file for this to work.  If run on a .pl or .pm buffer,
;;; you could check for a matching .t extension.
(defun stevea-cperl-test (verbose)
  "Runs prove on current buffer. With prefix arg, runs verbose mode"
  (interactive "p")
  (if (= 1 verbose)	  ; value of 1 means no prefix, so not verbose
      (shell-command (concat "prove " buffer-file-name))
    (shell-command (concat "prove -v " buffer-file-name))))

(defun stevea-cperl-run ()
  "Runs perl on current buffer."
  (interactive)
  (shell-command (concat "perl " buffer-file-name)))

(defun stevea-cperl-eval (beg end)
  "Runs perl on active region"
  (interactive "r")
  (shell-command-on-region beg end "perl"))

(defun stevea-cperl-print-hash (hash-expression) 
  "Inserts code at point to print out a Perl hash
in 'k = v' form.  Prompt the user for the hash, 
which can be any valid Perl code that evaluates to
a hash"
  (interactive "sHash Expression: ")
  (insert "while ( my ( $k, $v ) = each ")
  (insert hash-expression)
  (insert " ) { print \"$k = $v\\n\" };"))

(defun stevea-cperl-prefs ()
  (setq cperl-indent-level 4)
  (setq indent-tabs-mode nil)
  (setq cperl-merge-trailing-else nil)
  (setq cperl-invalid-face nil)
  (setq cperl-fix-hanging-brace-when-indent nil)
  (local-set-key "\C-j"  'cperl-linefeed)
  (local-set-key "\C-ct" 'stevea-cperl-tidy)
  (local-set-key "\C-cp" 'stevea-cperl-test) ; p is for prove
  (local-set-key "\C-ch" 'stevea-cperl-print-hash)
  (local-set-key "\C-cr" 'stevea-cperl-run)
  (local-unset-key "\C-c \C-k")
  (define-key cperl-mode-map (kbd "\C-c \C-c") 'compile)
  (define-key cperl-mode-map (kbd "<RET>") 'newline-and-indent))

;; add to mode hook
(add-hook 'cperl-mode-hook 'stevea-cperl-prefs)
(add-hook 'cperl-mode-hook
	  (lambda ()
	    (set (make-local-variable 'compile-command)
		 (concat "perl -cw  " buffer-file-name))))

;; Change cperl-indent-command to double as an autocomplete key
(defadvice cperl-indent-command
  (around cperl-indent-or-complete)
  "Changes \\\\[cperl-indent-command] so it autocompletes
when at the end of a word."
  (if (looking-at "\\>")
      (dabbrev-expand nil)
    ad-do-it))
(eval-after-load "cperl-mode"
  '(progn (require 'dabbrev) (ad-activate 'cperl-indent-command)))

