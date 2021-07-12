;;パッケージ管理の初期化
(require 'package)
;;(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(setq package-archives
      '(
        ("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")
        ))


(package-initialize)

;;野良elispのためのディレクトリを読み込む
(add-to-list 'load-path "~/.emacs.d/elisp")

;;背景色と文字色を変更 material-themeに切り替えたため
;;(set-background-color "black")
;;(set-foreground-color "#ffffff")

;;C-tでウィンドウを切り替える。初期値はtranspose-chars
(define-key global-map (kbd "C-t") 'other-window)

;;カラム番号も表示
(column-number-mode t)

;;左に行番号表示
(require 'linum)
(global-linum-mode)

;;ファイルサイズを表示
(size-indication-mode t)

;;時計を表示(好みに応じてフォーマットを変更可能)
;;(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time-mode t)

;;タイトルバーにファイルのフルパスを表示
(setq frame-title-format "%f")

;;paren-mode:対応する括弧を強調して表示する
(setq show-paren-delay 0)
(show-paren-mode t)

;;TABの無効化とインデント幅を4にする
(setq-default c-basic-offset 4 tab-width 4 indent-tabs-mode nil)

;;自動インデントを実施する
(global-set-key "\C-m" 'newline-and-indent)

;;クリップボードを他のアプリと共有
(setq x-select-enable-clipboard t)

;;undo-tree+の設定
(require 'undo-tree)
(global-undo-tree-mode t)
(global-set-key (kbd "C-.") 'undo-tree-redo)

;;メニューバー、ツールバー有り、スクロールバー無し
(menu-bar-mode t)
(tool-bar-mode t)
(scroll-bar-mode 0)

;; ファイルを開いた位置を保存する
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory "places"))

;;;括弧の対応を保持して編集する設定
;;(require 'paredit)
;;(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
;;(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
;;(add-hook 'lisp-mode-hook 'enable-paredit-mode)
;;(add-hook 'ielm-mode-hook 'enable-paredit-mode)

;;neotree ディレクトリーツリーを表示
(global-set-key [f8] 'neotree-toggle)

;; 隠しファイルをデフォルトで表示
(setq neo-show-hidden-files t)

;; neotree ウィンドウを表示する毎に current file のあるディレクトリを表示する
(setq neo-smart-open t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(package-selected-packages
   '(undo-tree zotelo ivy counsel nyan-mode spaceline php-mode ac-php company-php docker docker-compose-mode docker-tramp dockerfile-mode rainbow-delimiters mozc company company-lsp lsp-ui ## use-package lsp-mode lsp-java neotree))
 '(show-paren-mode t)
 '(size-indication-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ricty" :foundry "PfEd" :slant normal :weight normal :height 121 :width normal)))))

;;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)

;;ペースト時選択範囲を上書きするよ
(delete-selection-mode t)

;;command-log-mode C-c o
(require 'command-log-mode)

;; 警告音もフラッシュも全て無効(警告音が完全に鳴らなくなるので注意)
(setq ring-bell-function 'ignore)

;;company
;;(require 'company)
;;(global-company-mode) ; 全バッファで有効にする
;;(global-set-key (kbd "C-f") 'company-complete)
;;(setq company-idle-delay 0) ; デフォルトは0.5
;;(setq company-minimum-prefix-length 2) ; デフォルトは4
;;(setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る

;;; mozc
(require 'mozc)                                 ; mozcの読み込み
(set-language-environment "Japanese")           ; 言語環境を"japanese"に
(setq default-input-method "japanese-mozc")     ; IMEをjapanes-mozcに
(prefer-coding-system 'utf-8)                   ; デフォルトの文字コードをUTF-8に
;;(global-set-key [?\S-\ ] 'toggle-input-method) ;; Ctrl + \

;; rainbow-delimiters を使うための設定
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; 括弧の色を強調する設定
(require 'cl-lib)
(require 'color)
(defun rainbow-delimiters-using-stronger-colors ()
  (interactive)
  (cl-loop
   for index from 1 to rainbow-delimiters-max-face-count
   do
   (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
     (cl-callf color-saturate-name (face-foreground face) 30))))
(add-hook 'emacs-startup-hook 'rainbow-delimiters-using-stronger-colors)

;;docker用
(require 'docker)

;;dockerfileの編集用
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;;docker-composeファイル編集用
(require 'docker-compose-mode)

;;Trampを使用してコンテナ内に入れる。以下はコンテナIDではなく名前でアクセス出来るようにする設定
(require 'docker-tramp-compat)
(set-variable 'docker-tramp-use-names t)

;;material-theme
(defvar myPackages
  '(
    material-theme
    )
  )
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)
(load-theme 'material t)

;;phpの補完、定義ジャンプ
(defun php-company-hook ()
  (require 'company-php)
  (company-mode t)
  (ac-php-core-eldoc-setup) ;; enable eldoc
  (make-local-variable 'company-backends)
  (add-to-list 'company-backends 'company-ac-php-backend)
  ;; 定義にジャンプ
  (define-key php-mode-map  (kbd "M-.") 'ac-php-find-symbol-at-point)
  ;; ジャンプ先から戻る
  (define-key php-mode-map  (kbd "M-,") 'ac-php-location-stack-back))
(add-hook 'php-mode-hook 'php-company-hook)

;;modelineをいい感じに
(require 'spaceline-config)
(spaceline-spacemacs-theme)

;;nyan-mode 猫ちゃん
(nyan-mode t)

;; ivy設定
(require 'ivy)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq ivy-height 30) ;; minibufferのサイズを拡大
(setq ivy-extra-directories nil)
(setq ivy-re-builders-alist
      '((t . ivy--regex-plus)))

;; counsel設定
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file) ;; find-fileもcounsel任せ！
(setq counsel-find-file-ignore-regexp (regexp-opt '("./" "../")))

;; swiper設定
(global-set-key "\C-s" 'swiper)
(setq swiper-include-line-number-in-search t) ;; line-numberでも検索可能

;; カーソルをずらさずに全体のインデントを実施するための関数
;; 野良elのpoint-undoを追加している
(require 'point-undo)
(defun all-indent ()
  (interactive)
  (mark-whole-buffer)
  (indent-region (region-beginning)(region-end))
  (point-undo))
(global-set-key (kbd  "C-x C-]") 'all-indent)



