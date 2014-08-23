(customize-set-variable 'lisp-indent-function 'common-lisp-indent-function)
(customize-set-variable 'revert-without-query '(".*"))
;(customize-set-variable 'debug-on-error 'always) ; FIXME probably not?
(customize-set-variable 'marmalade-server-port 8005)
(customize-set-variable 'marmalade-db-dir (expand-file-name "~/marmalade/db"))
(customize-set-variable 'marmalade-package-store-dir (expand-file-name "~/marmalade/packages"))
(customize-set-variable 'marmalade-archive-dir (expand-file-name "~/marmalade/archives"))
(customize-set-variable 'marmalade-archive-port 8006)
(customize-set-variable 'marmalade-boot-onload t)
(customize-save-customized)
(toggle-debug-on-error)
(package-initialize)
(package-refresh-contents)
(package-install 'marmalade-service)
(with-temp-buffer
  (print
   '(add-hook
     'after-init-hook
     (lambda nil
       (marmalade-init)))
   (current-buffer))
  (append-to-file
   (point-min)(point-max)
   (or custom-file user-init-file)))
