(add-hook 'emacs-lisp-mode-hook
	  (lambda () 
	    (progn
	      (auto-fill-mode 1)
	      (eldoc-mode 1))))

