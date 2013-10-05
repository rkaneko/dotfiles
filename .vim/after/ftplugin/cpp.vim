" filetype cpp config

" switch cpp and hpp file
call altr#remove_all()
call altr#define('%.hpp', '%.cpp')

nmap <Space>a <Plug>(altr-forward)
