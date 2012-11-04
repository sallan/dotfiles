;; If none of these are conditional, you can just load them all,
;; skipping this file - load.el.  If this holds up, I may just move
;; this line into init.el and then I won't need load.el anymore.
(mapc 'load-file 
      (remove-if (lambda (s) (string-match "load" s)) 
		 (file-expand-wildcards "~/.emacs.d/modes/*.el")))
