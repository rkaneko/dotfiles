Vim key mappings cheet sheet
=======================

### 表記説明

+   `key mapping` :
    _key mappingに相応するコマンド_ 説明

のように記述。

+ オレオレなキーマッピングもある。


Unite
--------

+   `,` :
    _:Unite_ Unite モード

+   `,f` :
    _:Unite buffer_ :バッファリストを開く。

### Unite開いている時
+   `s` :
    _:split_ :画面を横分割。

+   `v` :
    _:vsplit_ :画面を縦分割。

+   `f` :
    _:vimfiler_ :Vimfilerを開く。


Vimfiler
------------

+   `\fe` :
    _<C-u>VimFilerBufferDir -quit<CR>_ :現在開いているバッファのディレクトリを開く

+   `\fi` :
    _<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>_ :現在開いているバッファのディレクトリをIDEっぽく開く

### Vimfiler開いている時
+   `e` :
    _e_ :カーソル上のファイルを編集。

+   `E` :
    _E_ :カーソル上のファイルを縦分割で編集。

+   `N` :
    _N_ :ファイル新規作成。

+   `K` :
    _K_ :ディレクトリ新規作成。

+   `.` :
    _._ :隠しファイル・フォルダを表示。

+   `N` :
    _N_ :ファイル新規作成。

+   `Space` :
    _Space_ :カーソル上のファイルにマークをつける・外す。

+   `*` :
    _*_ :すべてのファイルにマークをつける・外す。

+   `c` :
    _c_ :マークしたファイルをコピー。

+   `d` :
    _d_ :マークしたファイルを削除。

+   `r` :
    _r_ :マークしたファイルをリネーム。

+   `m` :
    _m_ :マークしたファイルを移動。

+   `q` :
    _Q_ :vimfilerを閉じる(バッファに残らない)。デフォルトのキーマッピングQと入れ替えている。

+   `Q` :
    _q_ :vimfilerを閉じる(バッファに残る)。デフォルトのキーマッピングqと入れ替えている。


参考URL : [www.karakaram.com/vimfiler](http://www.karakaram.com/vimfiler)


Window移動
-----------

+   `sh`:
    _<C-w>h :ひとつ右のウィンドウに移動。

+   `sl`:
    _<C-w>l :ひとつ左のウィンドウに移動。

