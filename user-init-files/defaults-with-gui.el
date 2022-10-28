;;; defaults-with-gui.el --- settings for gui emacs
;;; Commentary: this file loaded in init.el via (load)
;;; Code:

(with-eval-after-load 'vterm
  (defun command-for-exit-emacs ()
    (interactive)
    (if (display-graphic-p)
        (vterm)
      (save-buffers-kill-terminal)
      )
    )
  (global-set-key (kbd "C-x C-c") 'command-for-exit-emacs)

  (defun command-for-kill-emacs ()
    (interactive)
    (if (display-graphic-p)
        (delete-frame)
      (save-buffers-kill-terminal)
      )
    )
  (global-set-key (kbd "<f11>") 'command-for-kill-emacs)
  )

;; defaults-with-gui.el ends here
