;;; twittering-plus.el --- Monkey patch for Twittering mode

;; Copyright (C) 2015 USAMI Kenta

;; Author: USAMI Kenta <tadsan@zonu.me>
;; Created: 08 Apr 2015
;; Version: 0.0.1
;; Keywords: twitter web
;; URL: https://github.com/zonuexe/twittering-plus
;; Package-Requires: ((twittering-mode "3.0.0") (mag-menu "0.1.0"))

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; twittering-plus.el is a monkey patch for twittering-mode.
;; You can check friends timeline, and update your status on Emacs.
;;
;; To use Yorufukurou-like keybind, just add the following code into your .emacs:
;;
;;     (twittering+tern-on-yorufukurou)
;;
;; Enjoy!

;;; Code:

;; Yorufukurou(夜フクロウ) like key binds
;; https://sites.google.com/site/yorufukurou/

(defun twittering+yorufukurou-map (keymap)
  "Make Yorufukurou-like `KEYMAP' for twittering-mode."
  (define-key keymap (kbd "f")       'twittering-favorite)
  (define-key keymap (kbd "d")       'twittering-direct-message)
  (define-key keymap (kbd "h")       'twittering-user-timeline)
  (define-key keymap (kbd "<RET>")   'twittering-other-user-timeline)
  (define-key keymap (kbd "<up>")    'twittering-goto-previous-status)
  (define-key keymap (kbd "<down>")  'twittering-goto-next-status)
  (define-key keymap (kbd "<right>") 'twittering-enter)
  (define-key keymap (kbd "<left>")  'twittering-toggle-show-replied-statuses)
  keymap)

(defun twittering+yorufukurou-hook ()
  "Set Yorufukurou-like key binding to twittering-mode."
  (if (eq major-mode 'twittering-mode)
      (twittering+yorufukurou-map (current-local-map))
    (error "Current major-mode is not `twittering-mode'")))

;;;###autoload
(defun twittering+tern-on-yorufukurou ()
  "Turn on Yorufukurou-like key binding."
  (if (boundp 'twittering-mode-hook)
      (add-to-list 'twittering-mode-hook 'twittering+yorufukurou-hook)
    (error "`twittering-mode' not found"))
  t)

;;; twittering-plus.el ends here
