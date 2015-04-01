" ssp
au BufNewFile,BufRead *.ssp setf ssp.html

" gradle
au BufNewFile,BufRead *.gradle setf groovy

" markdown
au BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} setf markdown

" fxml
au BufNewFile,BufRead *.fxml setf fxml.xml

" FreeMaker
au BufNewFile,BufRead *.ftl setf ftl.html

" soy
au BufNewFile,BufRead *.soy setf soy.html

" json
au BufNewFile,BufRead *.json setf json
au BufNewFile,BufRead *.jsonnet setf json
