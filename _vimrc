set nocompatible          " 去除VI一致性，避免冲突与副作用，必须要添加（网上参考的）
filetype off              " 必须要添加


" set rtp+=~/.vim/bundle/Vundle.vim   "  设置运行时路径，包括Vundle和初始化相关的runtime path
set rtp+=$HOME/.vim/bundle/Vundle.vim   "  设置运行时路径，包括Vundle和初始化相关的runtime path(windows下设置方法)
" 使用该配置文件前，请先安装vundle,在终端输入：git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim


" ============================= 插件安装位置与安装方法说明 =============================

" call vundle#begin()    " vundle 初始化
call vundle#begin('$HOME/.vim/bundle/')    " vundle 初始化
   " call vundle#begin('~/some/path/here')     另一种选择，指定一个vundle安装插件的路径
   " 让vundle管理插件版本，必需；将要安装的插件的安装命令放在 vundle#begin() 和 vundle#end() 之间

" 以下是被安装的插件及其安装命令：
" >>>>>>>>>>>>>>>>>>>>
Plugin 'gmarik/Vundle.vim'     " vundle对自身的管理，必须放在第一个
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/The-NERD-tree'
Plugin 'klen/python-mode'
Plugin 'vim-scripts/Syntastic'
Plugin 'vim-scripts/ctags.vim'
Plugin 'vim-scripts/taglist.vim'
" Plugin 'Valloric/YouCompleteMe'     " vim的自动补全插件
" >>>>>>>>>>>>>>>>>>>>
" Plugin 'file:///home/tarena/.vim/vimcdoc-1.8.0'
   " 其他插件：代码补全插件snipmate;语法检查插件Syntastic(支持pep8风格);编程提示插件jedi-vim(比snipmate更智能，用pip安装即可)
"  以下范例用来支持不同格式（源码来源）的插件安装：
"  插件的三种类型：Github上vim-scripts仓库的插件；Guihub上非vim-scripts仓库的插件；非Github插件
"  针对不同类型的插件，vundle在自动管理下载插件时，有不同的地址编辑方法
   " 1、来自Github上vim-scripts仓库的插件，如地址为http://vim-scripts.org/vim/scripts.html的插件：
   "    　  plugin '插件名称'　————实际上是 plugin 'vim-scripts/插件名' 只是此处的用户名可以省略
   "    　  plugin 'L8' 
   " 2、Github上的非vim-scripts仓库的插件：
   "    　  格式为 Plugin '用户名/插件仓库名'　　　　　　　　
   "        plugin 'tpope/vim-fugitive'
   " 3.1、由Git支持但不在github上的插件仓库:
   "        Plugin 'git clone 后面的地址'　————如以下二例：
   "        Plugin 'git　clone https://git.wincent.com/command-t.git'
   "        Plugin 'git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim'
   " 3.2、本地的Git仓库（例如自己的插件）：
   "        Plugin 'file:///+本地插件仓库绝对路径' ————如下：
   "        Plugin 'file:///home/gmarik/path/to/plugin'
   " 3.3、插件在本地Git仓库的子目录中：
   "  　　　正确指定路径用以设置runtimepath，如以下范例插件在sparkup/vim 目录下
   "    　  plugin 'rstacruz/sparkup',{'rtp':'vim/'}
   " 4、安装L9，如果已经安装过这个插件，可利用以下格式避免命名冲突
   "        Plugin 'ascenator/L9',{'name':'newL9'}

call vundle#end()             "  必须：你的所有插件必须在这行之前载入（插件安装）
filetype plugin indent on     "  必须　加载vim自带和插件相应的语法和文件类型相关脚本
filetype plugin on            "  忽略插件改变缩进

"  常用的命令
      "  :vim PluginInstall 插件名称/qall  ——从命令行安装插件
      "  :Pluginlist           ——列出所有已配置的插件；
      "  :PluginUpdate         ——安装插件，追加'!'用以更新或使用　
      "  :PluginInstall        ——后面跟　<指定的插件名字>　，为只安装特定插件
      "  :PluginInstall!       ——后面跟叹号！，重新安装所有插件
      "  :PluginSearch foo     ——搜索foo；追加'!'清楚本地缓存
      "  :PluginClean          ——清除未使用插件(不在.vimrc文件中，在bundle目录中的)，需要确认；追加'!'自动批准移除未使用插件
      "  :h vundle             ——获取更多细节和wiki以及FAQ
      "  "按键shift+d
      "  ——Pluginlist列出插件后，选中删除插件，然后编辑.vimrc推出，插件卸载
"  将你自己对非插件片段放在这行之后,再(:wq!)保存退出。
"  安装插件：
   "  运行vim，可视模式输入　: PluginInstall ，即可安装插件
   "  终端输入　$ vim +PluginInstall +qall ，亦可安装插件

   
" ============================= VIM基本配置与注释说明 =============================
" ===== Vim显示相关 =====

set shortmess=atI                          " 启动的时候不显示那个援助乌干达儿童的提示
winpos 5 5                                 " 设定窗口位置
set lines=40 columns=155                   " 设定窗口大小 
set nu
set ruler                                  " 显示标尺:可显示最后一行的状态
set go=                                    " 不要图形按钮
set relativenumber                         " 设置相对行号(当前行为第0行)
set cursorline                             " 突出显示当前行
set linespace=0                            " 字符间插入的像素行树木
autocmd InsertLeave * se nocul             " 用浅色高亮当前行"
autocmd InsertEnter * se cul               " 用浅色高亮当前行" 
set showcmd                                " 输入的命令显示出来,以看清楚
set showmatch                              " 高亮显示匹配的括号
set matchtime =10                          " 设置括号高亮显示的时间(单位时间为0.1s)
set scrolloff=3                            " 光标移到buffer顶部或底部时,保持的行距.
set laststatus=2                           " 总是显示状态行
set fillchars=vert:\ ,stl:\ ,stlnc:\       " 在被分割的窗口间显示空白，便于阅读
set laststatus=1                           " 启动显示状态行(1),总是显示状态行(2)  
set cmdheight=2                            " 命令行（在状态行下方）的高度设置为2,默认1
set statusline=%F%m%r%h%w\ \ \ FORMAT=%{&ff}\ \ \ TYPE=%Y\ \ \ POS=%l,%v\ %p%%\ \ \ %{strftime(\"%y/%m/%d\ \%H:%M\")} "　状态行显示的内容
set guifont=Courier_New:h10:cANSI          " 设置字体
" 显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif
" 设置配色方案
colorscheme molokai
"字体 
if (has("gui_running")) 
   set guifont=Bitstream\ Vera\ Sans\ Mono\ 10 
endif
" 禁止显示滚动条，再次显示用：+=
set guioptions-=l                          " 隐藏gvim左边的滚动栏
set guioptions-=L                          " 隐藏gvim左边滚动栏当窗口split vertically
set guioptions-=r                          " 隐藏gvim右边的滚动栏
set guioptions-=R                          " 隐藏gvim右边滚动栏当窗口split vertically
set guioptions-=T                          " 隐藏gvim工具栏
set guioptions-=m                          " 隐藏gvim菜单栏
" set guifont= font mode                   " 设置gvim的字体
syntax enable
syntax on

" ===== Vim功能相关 =====

set autowrite                              " 设置自动保存
set autoread                               " 设置文件被改动时自动载入
set noeb                                   " 去除输入错误的提示声音
set magic                                  " 设置魔术
set helplang=cn                            " 设置中文帮助文档，需下载并配置后生效
set langmenu=zh_CN.UTF-8
language messages zh_CN.utf-8

set clipboard=unnamed   " OB,unnamedplus          " 允许从vim复制到剪贴板
set foldenable                             " 允许折叠
set foldmethod=manual                      " 手动折叠
set confirm                                " 处理未保存文件或只读文件的时候，弹出确认
set autochdir                              " 自动切换到文件所在文件夹
set history=1000                           " 设置历史记录数
set hlsearch                               " 设置高亮度搜索(反白)(high light search)
set incsearch                              " 设置边搜索边出结果
set report=0                               " 设置通过使用　:commands 命令，告诉我们文件的那一行被修改过
set fileformat=unix                        " 设置成Unix格式,用于dos格式文件在Linux下的格式转换(dos文件行末添加一个(/r)
set pastetoggle=<F9>                       " 设置快捷键激活/取消paste模式,原格式黏贴.
set mouse=a                                " 开启鼠标,允许在buffer的任何地方使用鼠标
set selection=exclusive
set selectmode=mouse,key                   " 同上
set clipboard+=unnamed                     " 共享剪贴板
set report=0                               " 通过使用:commands命令，告诉我们文件的那一行被改动过
set smartindent                            " 设置智能缩进:行或段开始处使用制表符
set autoindent                             " 设置自动缩排 
set backspace=2                            " 设置退格键来删除任意字符(2-删除任意字符,0或1-仅删除刚输入字符,而无法删除原有字符
set expandtab                              " 设置Tab键替换为空格(noexpandtab 不用空格代替Tab),此时输入真正Tab则输入Ctrl+v,Tab
set smarttab                               " 解决shiftwidth和tabstop不等时的麻烦,行首时,Tab宽度为shiftwidth空白,其他地方按tabstop和softtabstop处理        
set tabstop=4                              " 设置Tab键宽度为4空格
set shiftwidth=4                           " 表示每一级缩进的长度,一般设置成跟 softtabstop 一样。此两条,设置统一缩进宽度为4
set softtabstop=4                          "表示在编辑模式的时候按退格键的时候退回缩进的长度,当使用 expandtab 时特别有用。
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936       " 此两条，设置默认解码
set fileencodings=ucs-bom,utf-8,chinese,cp936      " Vim启动时会按照该处的编码方式列表逐一检测打开文件的字符编码方式，并将fileencoding设置为检测到的编码方式。因此最好将unicode编码至于最前面。
set encoding=utf-8                         " Vim内部使用的字符编码方式(vim的缓冲区、菜单文本、消息文本等)
set termencoding=utf-8                     " 终端环境下使用Vim，设置与终端使用编码一致
set fileencoding=utf-8                     " Vim中当前编辑的文件的字符编码方式:vim保存文件时也遵循该编码方式
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" noexpandtab 则是用制表符表示一个缩进。 
" cindent:是特别针对C语言自动缩进
" expandtab：用空格代替tab


let &t_SI.= "\e[5 q"
let &t_SR.= "\e[4 q"                       " For iTerm2 on OS X (官方的名称）
let &t_EI.= "\e[1 q"                       " 此三条用于在不同的模式下更改光标的形状
" set nobackup                             " 禁止生成临时文件
" set noswapfile                           " 同上


" ===== Vim新建.c, .py, .java文件自动插入文件头 =====
" 未完成
autocmd BufNewFile *.py exec ":call SetFileTitle()"
" 定义SetFileTitle函数，自动插入文件头
func SetFileTitle()
    if &filetype == 'py'
        call setline("#! -*- coding: utf-8 -*-")
    endif
    " 新建文件后，自动定移到文件末尾
    autocmd BufNewFile * normal G
endfunc


" ===== Vim键盘命令设置 =====
let mapleader=','
nmap <leader>w :w<CR>
" 按,w保存文件
nmap <leader>f :find<cr>
" 按,f搜索
nmap <leader>r :e<Space>
" 按,r在当前tab打开文件
nmap <leader>e :tabe<Space>
" 按,e在新tab打开文件
nmap <silent> <leader>m : nohlsearch<CR>
" 按,m　取消高亮搜索结果
nmap <leader>p :!python %<CR>
" 按,p用python执行当前文件
" nmap <silent> <leader>ev :e $MYVIMRC<CR>        " 按,ev打开配置文件
" nmap <silent> <leader>sv :so $MYVIMRC<CR>       " 按,sv重载配置文件
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
" 映射全选+复制 ctrl+a
vmap <C-c> "+y
" 选中状态下 Ctrl+c 复制
map <M-F2> :tabnew<CR>
" 新建标签  
nnoremap <C-F2> :vert diffsplit
" 比较文件  
" map <F3> :tabnew .<CR>                          " 列出当前目录文件  
" map <C-F3> \be                                  " 打开树状文件目录  
" nnoremap <F2> :g/^\s*$/d<CR>                    " 去空行  


" ===== <F5>一键编译执行脚本 =====
map <F5> :call CompileRunGcc()<CR>
" 普通模式下映射
imap <F5> <ESC>:call CompileRunGcc()<CR>
" 插入模式下映射
vmap <F5> <ESC>:call CompileRunGcc()<CR>
" 可视模式下映射
func! CompileRunGcc()
    exec "w"
    if &filetype == 'python'
            exec "!clear && time python %"
    elseif &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
    elseif &filetype == 'cpp'
             exec "!g++ % -o %<"
            exec "!time ./%<"
    elseif &filetype == 'java'
            exec "!javac %"
            exec "!time java %<"
    elseif &filetype == 'sh'
            :!time bash %
    elseif &filetype == 'html'
            exec "!chrome % &"
    elseif &filetype == 'go'
            exec "!go build %<"
            exec "!time go run %"
    elseif &filetype == 'mkd'
            exec "!~/.vim/markdown.pl % > %.html &"
            exec "!chrome %.html &"
    endif
endfunc 

 
" ============================= vundle管理插件配置区 =============================

" ===== 选择solarized的主题模式设置 =====
"set background=light      " solarized的浅色模式
" set background=dark        " solarized的深色模式
"colorscheme solarized     " 开启背景颜色模式


" ==== 选择molokai的主题模式设置 ====
let g:rehash256 = 1
let g:molokai_original = 1  "  推荐模式，受众较多
highlight NonText guibg=#060606
highlight Folded guibg=#0A0A0A  guifg=#9090D0
set t_Co=256
set background=dark   
" molokai.vim主题中已经设置, molokai 中hi就是highlight, 后面的变量为函数名（函数类型），cterm指的是终端中的样式
" 比如加粗blod，下划线underline，gui指的是GUI vim中的样式, fg指的是front ground前景色，bg指的是background背景色 


" ===== NERDTree目录树管理设置 =====
""将Ctrl+n设置为开关NERDTree的快捷键
" o 打开关闭文件或者目录;   t 在标签页中打开;       T 在后台标签页中打开;       ! 执行此文件
" p 到上层目录;             P 到根目录;             K 到第一个节点;             J 到最后一个节点;
" u 打开上层目录;           m 显示文件系统菜单(添加、删除、移动操作);           r 递归刷新当前目录;
" R 递归刷新当前根目录
map <F2> :NERDTreeMirror<CR>
map <F2> :NERDTreeToggle<CR>
imap <F2> <ESC> :NERDTreeToggle<CR>
""修改树的显示图标　　▸◂▴▾
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeAutoCenter=1
""窗口位置
let g:NERDTreeWinPos='left'
""窗口尺寸
let g:NERDTreeSize=1
""窗口显示行号
let g:NERDTreeShowLineNumbers=1
""不显示隐藏文件
let g:NERDTreeHidden=1
""打开vim时如果没有文件自动打开NERDTree
autocmd vimenter * if !argc()|NERDTree|endif
""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""打开vim时自动打开NERDTree
autocmd vimenter * NERDTree</cr></f2>
let NERDSpaceDelims=1 " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1 " 多行注释时样子更好看


"===== Syntastic 配置 =====
"Syntastic设置error和warning的标志
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='►'
"总是打开Location List（相当于QuickFix）窗口，如果你发现syntastic因为与其他插件冲突而经常崩溃，将下面选项置0
let g:syntastic_always_populate_loc_list = 1
"自动打开Locaton List，默认值为2，表示发现错误时不自动打开，当修正以后没有再发现错误时自动关闭，置1表示自动打开自动关闭，0表示关闭自动打开和自动关闭，3表示自动打开，但不自动关闭
let g:syntastic_auto_loc_list = 1
"修改Locaton List窗口高度
let g:syntastic_loc_list_height = 5
"打开文件时自动进行检查
let g:syntastic_check_on_open = 1
"自动跳转到发现的第一个错误或警告处
let g:syntastic_auto_jump = 1
"进行实时检查，如果觉得卡顿，将下面的选项置为1
let g:syntastic_check_on_wq = 0
"高亮错误
let g:syntastic_enable_highlighting=1
"让syntastic支持C++11
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
"设置pyflakes为默认的python语法检查工具
let g:syntastic_python_checkers = ['pyflakes']
"修复syntastic使用:lnext和:lprev出现的跳转问题，同时修改键盘映射使用sn和sp进行跳转
function! <SID>LocationPrevious()                       
  try                                                   
    lprev                                               
  catch /^Vim\%((\a\+)\)\=:E553/                        
    llast                                               
  endtry                                                
endfunction                                             
function! <SID>LocationNext()                           
  try                                                   
    lnext                                               
  catch /^Vim\%((\a\+)\)\=:E553/                        
    lfirst                                              
  endtry                                                
endfunction                                             
nnoremap <silent> <Plug>LocationPrevious    :<C-u>exe 'call <SID>LocationPrevious()'<CR>                                        
nnoremap <silent> <Plug>LocationNext        :<C-u>exe 'call <SID>LocationNext()'<CR>
nmap <silent> sp    <Plug>LocationPrevious              
nmap <silent> sn    <Plug>LocationNext
"关闭syntastic语法检查, 鼠标复制代码时用到, 防止把错误标志给复制了
nnoremap <silent> <Leader>ec :SyntasticToggleMode<CR>
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction


"===== python-mode的配置 =====
let g:pymode_python = 'python3'
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
let g:pymode_lint_cwindow = 0


" ===== CTags管理设置 =====
let Tlist_Sort_Type = "name"           " 按照名称排序  
let Tlist_Use_Right_Window = 1         " 在右侧显示窗口，左侧为0 
let Tlist_Compart_Format = 1           " 压缩方式  
let Tlist_Exist_OnlyWindow = 1         " 如果只有一个buffer，kill窗口也kill掉buffer  
let Tlist_File_Fold_Auto_Close = 0     " 不要关闭其他文件的tags  
let Tlist_Enable_Fold_Column = 0       " 不要显示折叠树  
autocmd FileType py set tags+=~/.tools/ctags/python_tags  
autocmd FileType h,cpp,cc,c,java set tags+=~/.tools/ctags/other_tags  
let Tlist_Show_One_File=1              "不同时显示多个文件的tag，只显示当前文件的
" 设置tags  
set tags=tags  
"set autochdir


" ===== Taglist管理设置 =====
nnoremap <silent><F4> :TlistToggle<CR>
let Tlist_Auto_Open=0                  " 默认不打开Taglist,打开为1
let Tlist_Ctags_Cmd = '/usr/bin/ctags' " 设定linux系统中ctags程序的位置
let Tlist_Show_One_File = 1            " 不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidth=24                  " 设置taglist窗口宽度
let Tlist_Exit_OnlyWindow = 1          " 如果taglist窗口是最后一个窗口，则退出vim 
let Tlist_Use_Right_Window = 1         " 在右侧窗口中显示taglist窗口
let Tlist_File_Fold_Auto_Close=1       " 自动折叠当前非编辑文件的方法列表
" 以下设置作用还为明白
let Tlist_Auto_Update = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 0
let Tlist_Compact_Format = 1


" ===== Minibufexpl管理设置 =====
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1   
