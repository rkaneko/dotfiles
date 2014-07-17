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

+   `,o` :
    _:Unite outline_ :unite-outline起動。メソッドなどを一覧表示する。

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
    _Ctrl+u VimFilerBufferDir -quit_ :現在開いているバッファのディレクトリを開く。

+   `\fi` :
    _Ctrl+u VimFilerBufferDir -split -simple -winwidth=35 -no-quit_ :現在開いているバッファのディレクトリをIDEっぽく開く。

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
    _Ctrl+w h :ひとつ右のウィンドウに移動。

+   `sl`:
    _Ctrl+w l :ひとつ左のウィンドウに移動。


Completion
------------------

+   `<C-s>`:
    _なし :snippet補完開始。


Basic
---------

### insert mode
+   `<C-f>`:
    _Left :左に移動。

+   `<C-b>`:
    _Right :右に移動。

+   `<C-j>`:
    _Down :下に移動。

+   `<C-k>`:
    _Up :上に移動。

+   `jj`:
    _ESC :insert ,modeを抜ける。

### normal mode
+   `<F2>`:
    _:bp :ひとつ前のバッファに移動。

+   `<F3>`:
    _:bn :ひとつ次のバッファに移動。

+   `<F4>`:
    _:bd :バッファ消去。

+   `<F9>`:
    _:set pastetoggle :ペーストモード切り替え。F9を押してinsert modeに入ると、insert mode(貼り付け)となる。この状態でペーストするとインデントをつけずにペーストすることができる。


Scala
------
+   `Space+st`:
    _StartSBT : VimShellからsbtコンソール起動。
+   `Space+vsi`:
    _VimShellInteractive --split='below split | resize 12' scala : Scala REPLを起動。

+   `SortScalaImport`:
    _なし : Scalaのimport文をsort。

### StartSBTを実行した後でfiletype scala のbuffer画面から
+   `Space+m`:
    _なし : ファイルを上書き保存してから、sbtコンソール開いているbuffer画面でcompile実行。

C++
---
+   `Space+a`:
    _altr forward : hppファイルとcppファイルを入れ替えるToggle。

+   `(on include header file) gf`
    _なし : includeしてあるheaderファイルを新しいバッファで開く。

+   `\cf`
    _ClangFormat : clang-formatで設定に従い、ファイルフォーマットを行う。

Markdown
---
+   `:PrevimOpen`:
    _:PrevimOpen : CurrentBufferのfiletype markdownのファイルのPreviewをopenbrowser#open()で設定されたブラウザで開く。


Utility
--------
+   `\c`
    _caw:toggle : caw.vimによるコメントトグル。normal modeとvisual modeで使用できる。caw.vimがサポートしているfiletypeで適切なコメントハンドリングが可能。

+   `(visual mode)gc`
    _なし : vim-commentaryによるコメントトグル。

+   `(normal mode)gcc`
    _なし : vim-commentaryによるコメントアウト。

+   `(normal mode)gcu`
    _なし : vim-commentaryによるコメントアウトを外す。

+   `:Grep {pattern} {path/to/target}`
    _なし : QFixGrepによるgrep。grep後QuickFix Windowを開く。  :Grep here_is_method ./src/main/scala/*.scala

+   `RGrep {pattern} {path/to/target}`
    _なし : QFixGrepによる再帰的にgrep。grep後QuickFix Windowを開く。

### QuickFix Windowから
+   `Qfreplace`
    _なし : QuickFixリストのバッファを開き、その画面上で編集・置換を行うことができる。  例えばQfreplaceバッファ画面で :%s/before/after/gc などで置換を行える。置換後は:wなどで完了する。

### for browser
+   `gx`
    _<Plug>(openbrowser-smart-search) : カーソル上のURLを開く。もしくはカーソル上のwordをgoogle検索する。

### syntastic
+   `:Errors`
    _:Errors : syntasticがサポートしているfiletypeにおいてsyntaxチェックを行い,error箇所をQuickFixWindowに表示する。
