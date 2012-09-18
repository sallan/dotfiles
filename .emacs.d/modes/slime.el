; this is the location where the Aquamacs SLIME package got installed.
(add-to-list 'load-path "~/lisp/slime/")  ; your SLIME directory
(add-to-list 'load-path "~/lisp/slime/contrib")  ; your SLIME contrib directory
(setq inferior-lisp-program "/opt/local/bin/sbcl") ; your Lisp system
(if (require 'slime "slime" t)
    (slime-setup '(slime-fancy)))

; (setq common-lisp-hyperspec-root
; (concat "file:" (expand-file-name "~/doc/hyperspec-6/")))

;; (setq slime-autodoc-use-multiline-p t)
;; (setq slime-repl-history-size 1000)
;; (setq slime-startup-animation nil)
;; (setq slime-default-lisp 'openmcl)
;; (setq slime-truncate-lines nil)
;; (setq slime-lisp-implementations
;;       `((ccl     ("/usr/bin/ccl")                :coding-system		 utf-8-unix)
;;         (cmucl   ("/usr/bin/cmucl" "-quiet")     :coding-system		 iso-latin-1-unix)
;;         (clisp   ("/opt/local/bin/clisp")        :coding-system		 utf-8-unix)
;;         (ecl     ("/usr/local/bin/ecl")          :coding-system		 iso-latin-1-unix)
;;         (sbcl    ("/opt/local/bin/sbcl")         :coding-system		 utf-8-unix)
;; 	))
; do m-- m-x slime ccl to start Clozure Common Lisp from the list
; above
