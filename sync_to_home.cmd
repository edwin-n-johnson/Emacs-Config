robocopy .\.emacs.d %HOME%\.emacs.d /mir /XF *~
copy /y .emacs %HOME%\.emacs
copy /y .custom %HOME%\.custom
