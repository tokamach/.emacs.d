;; some stupid emacs trash
;; basically ignore anything below

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#ffffff" "#d8137f" "#17ad98" "#dc8a0e" "#775dff" "#aa17e6" "#775dff" "#6c696e"])
 '(ansi-term-color-vector
   [unspecified "#ffffff" "#d8137f" "#17ad98" "#dc8a0e" "#775dff" "#aa17e6" "#775dff" "#6c696e"] t)
 '(blink-cursor-mode nil)
 '(company-clang-arguments (quote ("-I/usr/local/include/" "--std=c++11")))
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-safe-themes
   (quote
    ("d2bd16a8bcf295dce0b70e1d2b5c17bb34cb28224a86ee770d56e6c22a565013" "7a2ac0611ded83cdd60fc4de55ba57d36600eae261f55a551b380606345ee922" "cbd8e65d2452dfaed789f79c92d230aa8bdf413601b261dbb1291fb88605110c" "4a91a64af7ff1182ed04f7453bb5a4b0c3d82148d27db699df89a5f1d449e2a4" "6271fc9740379f8e2722f1510d481c1df1fcc43e48fa6641a5c19e954c21cc8f" "986e7e8e428decd5df9e8548a3f3b42afc8176ce6171e69658ae083f3c06211c" "444238426b59b360fb74f46b521933f126778777c68c67841c31e0a68b0cc920" "7a1190ad27c73888f8d16142457f59026b01fa654f353c17f997d83565c0fc65" "3fa81193ab414a4d54cde427c2662337c2cab5dd4eb17ffff0d90bca97581eb6" "021720af46e6e78e2be7875b2b5b05344f4e21fad70d17af7acfd6922386b61e" "b050365105e429cb517d98f9a267d30c89336e36b109a1723d95bc0f7ce8c11d" "7366916327c60fdf17b53b4ac7f565866c38e1b4a27345fe7facbf16b7a4e9e8" "42b9d85321f5a152a6aef0cc8173e701f572175d6711361955ecfb4943fe93af" "ed0b4fc082715fc1d6a547650752cd8ec76c400ef72eb159543db1770a27caa7" "bea5fd3610ed135e6ecc35bf8a9c27277d50336455dbdd2969809f7d7c1f7d79" "d46d14636f375c786c0e06dcad2de2c25464fe69e41234860e33da3a12fbe32c" "e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" "9c738f7435796d8943e1507e23b2a6153b35e1e33c75cde899cbf3c8683a0731" "ad16a1bf1fd86bfbedae4b32c269b19f8d20d416bd52a87cd50e355bf13c2f23" "d83e34e28680f2ed99fe50fea79f441ca3fddd90167a72b796455e791c90dc49" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "f2057733672d3b119791f5b7d1a778bf8880121f22ea122a21d221b45081f49e" "0e0c37ee89f0213ce31205e9ae8bce1f93c9bcd81b1bcda0233061bb02c357a8" "086970da368bb95e42fd4ddac3149e84ce5f165e90dfc6ce6baceae30cf581ef" "a85e40c7d2df4a5e993742929dfd903899b66a667547f740872797198778d7b5" "4bf5c18667c48f2979ead0f0bdaaa12c2b52014a6abaa38558a207a65caeb8ad" "8cf1002c7f805360115700144c0031b9cfa4d03edc6a0f38718cef7b7cabe382" "60e09d2e58343186a59d9ed52a9b13d822a174b33f20bdc1d4abb86e6b17f45b" "9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" "ffe80c88e3129b2cddadaaf78263a7f896d833a77c96349052ad5b7753c0c5a5" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "0ee3fc6d2e0fc8715ff59aed2432510d98f7e76fe81d183a0eb96789f4d897ca" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a1382d7377687da344ab290dc6718839031ddd5989cb1e756f7f7d575201ea63" "2997ecd20f07b99259bddba648555335ffb7a7d908d8d3e6660ecbec415f6b95" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "9d91458c4ad7c74cf946bd97ad085c0f6a40c370ac0a1cbeb2e3879f15b40553" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "44eec3c3e6e673c0d41b523a67b64c43b6e38f8879a7969f306604dcf908832c" "10e231624707d46f7b2059cc9280c332f7c7a530ebc17dba7e506df34c5332c4" "47aa6e82734866b2915781c6e1d9517bd897d45fe8aec360dd4b6294fec73068" "5cd0afd0ca01648e1fff95a7a7f8abec925bd654915153fb39ee8e72a8b56a1f" default)))
 '(eclim-executable
   "/Applications/Eclipse\\ Java.app/Contents/Eclipse/plugins/org.eclim_2.7.2/bin/eclim")
 '(eclimd-executable nil)
 '(electric-pair-mode t)
 '(fci-rule-color "#383838")
 '(hl-paren-background-colors (quote ("#e8fce8" "#c1e7f8" "#f8e8e8")))
 '(hl-paren-colors (quote ("#40883f" "#0287c8" "#b85c57")))
 '(markdown-command "/usr/local/bin/markdown")
 '(menu-bar-mode nil)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (geiser crystal-mode company-php php-mode weechat evil-lispy lispy rust-mode all-the-icons svg-clock tao-theme evil-org evil-vimish-fold exec-path-from-shell evil-magit flycheck json-mode buffer-move yaml-mode smooth-scrolling xah-fly-keys irony sudoku symon rainbow-delimiters imenu-list swift3-mode auctex base16-theme lua-mode web-mode zenburn-theme solarized-theme birds-of-paradise-plus-theme fill-column-indicator projectile company-auctex latex-pretty-symbols gruvbox-theme slime-company slime which-key smart-tabs-mode evil-leader xkcd fireplace company parinfer darktooth-theme selectric-mode markdown-mode anti-zenburn-theme magit 2048-game smex ido-vertical-mode olivetti fountain-mode creamsody-theme ## evil-visual-mark-mode)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#1A3734")
 '(pos-tip-foreground-color "#FFFFC8")
 '(safe-local-variable-values
   (quote
    ((c-default-style . "linux")
     (olivetti-body-width . 94)
     (olivetti-body-width . 100)
     (company-clang-arguments "-I/usr/local/include/" "-I/usr/local/include/GLFW/" "--std=c++11")
     (company-clang-arguments
      ("-I/usr/local/include/")
      ("-I/usr/local/include/GLFW/")
      ("--std=c++11"))
     (company-clang-arguments "-I/usr/local/include/")
     (eval turn-on-orgtbl))))
 '(sml/active-background-color "#98ece8")
 '(sml/active-foreground-color "#424242")
 '(sml/inactive-background-color "#4fa8a8")
 '(sml/inactive-foreground-color "#424242")
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 
