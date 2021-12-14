;;; atomic-chrome.el --- Atomic Chrome for Emacs
;;; Commentary:
;;; Code:
(atomic-chrome-start-server)

(setq atomic-chrome-enable-auto-update nil) ; necessary for overleaf
(setq atomic-chrome-url-major-mode-alist
      '(("overleaf\\.com" . yatex-mode)
        ("ja.overleaf\\.com" . yatex-mode)))
(setq atomic-chrome-buffer-open-style 'full)
(define-key atomic-chrome-edit-mode-map (kbd "C-x C-s") 'send-buffer-and-send-save-notice-to-wakatime)

(defun send-buffer-and-send-save-notice-to-wakatime ()
  "call atomic-chrome-send-buffer-text and send save notice to WakaTime"
  (interactive)
  (atomic-chrome-send-buffer-text)
  (my-wakatime-call t)
  )


;; settings for wakatime
(defun my-atomic-chrome-wakatime-client-command (savep)
  "Return client command executable and arguments.
   Set SAVEP to non-nil for write action."
  (format "%s%s--file \"%s\" --entity-type \"domain\" --local-file \"%s\" --plugin \"%s/%s\" --project \"Overleaf\" --time %.2f%s%s"
	  (if (s-blank wakatime-python-bin) "" (format "\"%s\" " wakatime-python-bin))
	  (if (s-blank wakatime-cli-path) "wakatime " (format "\"%s\" " wakatime-cli-path))
	  (get-overleaf-file-name-from-buffer-name)
	  (get-overleaf-file-name-from-buffer-name)
	  wakatime-user-agent
	  wakatime-version
	  (float-time)
	  (if savep " --write" "")
	  (if (s-blank wakatime-api-key) "" (format " --key %s" wakatime-api-key))))

(defun get-overleaf-file-name-from-buffer-name ()
  (nth 0 (split-string (buffer-name) "-"))
  )

(defun my-wakatime-call (savep)
  "Call WakaTime command."
  (let*
      (
       (command (my-atomic-chrome-wakatime-client-command savep))
       (process
        (start-process
	 "Shell"
	 (generate-new-buffer " *WakaTime messages*")
	 shell-file-name
	 shell-command-switch
	 command
	 )
	)
       )

    (set-process-sentinel process
			  `(lambda (process signal)
			     (when (memq (process-status process) '(exit signal))
			       (kill-buffer (process-buffer process))
			       (let ((exit-status (process-exit-status process)))
				 (when (and (not (= 0 exit-status)) (not (= 102 exit-status)))
				   (when wakatime-disable-on-error
				     (wakatime-mode -1)
				     (global-wakatime-mode -1))
				   (cond
				    ((= exit-status 103) (error "WakaTime Error (%s) Config file parse error. Check your ~/.wakatime.cfg file." exit-status))
				    ((= exit-status 104) (error "WakaTime Error (%s) Invalid API Key. Set your api key with: (custom-set-variables '(wakatime-api-key \"XXXX\"))" exit-status))
				    ((= exit-status 105) (error "WakaTime Error (%s) Unknown wakatime-cli error. Please check your ~/.wakatime.log file and open a new issue at https://github.com/wakatime/wakatime-mode" exit-status))
				    ((= exit-status 106) (error "WakaTime Error (%s) Malformed heartbeat error. Please check your ~/.wakatime.log file and open a new issue at https://github.com/wakatime/wakatime-mode" exit-status))
				    (t (error "WakaTime Error (%s) Make sure this command runs in a Terminal: %s" exit-status (my-atomic-chrome-wakatime-client-command nil)))
				    )
				   )
				 )
			       )
			     )
			  )

    (set-process-query-on-exit-flag process nil)
    ))


;;; init-atomic-chrome.el ends here
