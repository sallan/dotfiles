(require 'smtpmail)
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "mail.f5net.com"
      smtpmail-local-domain "f5.com"
      smtpmail-sendto-domain "f5.com"
      smtpmail-debug-info t)
(setq send-mail-function 'smtpmail-send-it)
(setq mail-host-address "f5.com")
(setq user-full-name "Steve Allan")
(setq user-mail-address "sallan@f5.com")
(setq mail-signature t)

;; This has to be here instead of in .gnus because it's a gnus-startup-hook
;;(require 'bbdb-autoloads)
;;(require 'bbdb)
;;(load "bbdb-com" t)
;;(bbdb-initialize 'gnus 'message)
;;(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
