;;;;
;;;; Utilities
;;;;

;;; Functions to interact with perforce.
(defun stevea-find-branch(regex &optional flush)
  "Searches for branches matching regex"
  (interactive "sEnter regex: ")
  (stevea-p4-search-list "p4  branches" regex "*stevea-p4-branches*"))

(defun stevea-find-label(regex &optional flush)
  "Searches for labels matching regex"
  (interactive "sEnter regex: ")
  (stevea-p4-search-list "p4  labels" regex "*stevea-p4-labels*"))

(defun stevea-find-client(regex &optional flush)
  "Searches for clients matching regex"
  (interactive "sEnter regex: \np")
  (stevea-p4-search-list "p4  clients" regex "*stevea-p4-clients*"))

(defun stevea-find-user(regex &optional flush)
  "Searches for users matching regex"
  (interactive "sEnter regex: \np")
  (stevea-p4-search-list "p4  users" regex "*stevea-p4-users*"))

(defun stevea-p4-search-list (p4cmd regex p4output)
  (let ((p4results "*stevea-p4-results*")
	(matched '()))
    (save-excursion
      (unless (bufferp (get-buffer p4output))
	(message "Building list...")
	(set-buffer (get-buffer-create p4output))
	(shell-command p4cmd p4output))
      (set-buffer p4output)
      (goto-char (point-min))
      (while (re-search-forward regex nil t)
	(push (match-string 0) matched))
      (set-buffer (get-buffer-create p4results))
      (erase-buffer)
      (dolist (matched-item (nreverse matched))
	(princ (format "%s\n" matched-item) (get-buffer p4results))))
    (display-buffer p4results)
    t))

(defun stevea-p4-opened ()
  "Print out list of opened files"
  (interactive)
  (dolist (open-files (stevea-get-opened-files))
    (princ (format "%s\n" open-files))))

(defun stevea-p4-revertall ()
  "Revert all opened files"
  (interactive)
  (shell-command 
   (concat "p4 revert" 
	   (apply #'concat (mapcar #'(lambda (x) (concat " " x)) 
				   (stevea-get-opened-files))))))
(defun stevea-get-opened-files () 
  "Returns list of opened files"
  (let ((p4results "*stevea-p4-results*")
	(open-files '()))
    (save-excursion
      (message "Checking for open files...")
      (set-buffer (get-buffer-create p4results))
      (erase-buffer)
      (shell-command "p4 opened" p4results)
      (goto-char (point-min))
      (while (re-search-forward "\\(.*\\)#" nil t)
	(push (match-string 1) open-files)))
    (nreverse open-files)))


;;; Perforce ops via dired
(defun stevea-dired-p4-add ()
  "Add files marked in dired buffer to perforce"
  (interactive)
  (dolist ( file (dired-get-marked-files t))
    (shell-command (concat "p4 add " file))))

(defun stevea-dired-p4-revert ()
  "Revert files marked in dired buffer to perforce"
  (interactive)
  (dolist ( file (dired-get-marked-files t))
    (shell-command (concat "p4 revert " file))))

(defun stevea-dired-p4-delete ()
  "Delete files marked in dired buffer to perforce"
  (interactive)
  (dolist ( file (dired-get-marked-files t))
    (shell-command (concat "p4 delete " file))))


;;; misc functions
(defun stevea-insert-date ()
  "Insert today's date at point"
  (interactive "*")
  (insert (format-time-string "%m/%d/%Y")))

(defun stevea-split-buffer ()
  "Splits current buffer into two side-by-side buffers"
  (interactive)
  (delete-other-windows)
  (split-window-horizontally))

(defun delete-current-file ()
  "Delete the file associated with the current buffer."
  (interactive)
  (let ((current-file) (buffer-file-name)))
  (when (yes-or-no-p (format "Delete file %s and kill buffer? " 
			     current-file))
    (kill-buffer (current-buffer))
    (delete-file current-file)
    (message (concat "Deleted file: %s" current-file))))

(defun stevea-fetch-mail ()
  "Bring up Gnus and check only groups 1 and 2."
  (interactive)
  (require 'gnus)
  (if (gnus-alive-p)
      (gnus-group-get-new-news 2)
    (gnus))
  (switch-to-buffer "*Group*"))

(defun comment-line-and-duplicate ()
  "Comments current line after duplicating."
  (interactive)
  (let ((beg (line-beginning-position))
	(end (+ 1 (line-end-position))))
    (copy-region-as-kill beg end)
    (beginning-of-line)
    (yank)
    (comment-region beg end)))

(defun dired-do-tarball (tarfile)
  (interactive "star.gz file name: ")
  (dired-do-shell-command (format "tar czf %s *" tarfile)
                          nil
                          (dired-get-marked-files t)))
