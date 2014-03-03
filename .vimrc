colorscheme desert
set guifont=�䂽�ۂ�i�R�[�f�B���O�j:h14

set backspace=indent,eol,start

" WildMenu
set wildmenu

" �}�b�s���O
map <C-A> ggVG
map <C-X> "+x
map <C-C> "+y
map <C-V> "+gP
map <C-S> :w
map <C-F> :brows confirm e


"----------------------------------------------------
" �o�b�N�A�b�v�֌W
"----------------------------------------------------
" �o�b�N�A�b�v���Ƃ�Ȃ�
set nobackup
" �t�@�C���̏㏑���̑O�Ƀo�b�N�A�b�v�����
" (�������Abackup ���I���łȂ�����A�o�b�N�A�b�v�͏㏑���ɐ���������폜�����)
set writebackup
" �o�b�N�A�b�v���Ƃ�ꍇ
"set backup
" �o�b�N�A�b�v�t�@�C�������f�B���N�g��
"set backupdir=~/backup
" �X���b�v�t�@�C�������f�B���N�g��
"set directory=~/swap

"----------------------------------------------------
" �����֌W
"----------------------------------------------------
" �R�}���h�A�����p�^�[����100�܂ŗ����Ɏc��
set history=100
" �����̎��ɑ啶������������ʂ��Ȃ�
set ignorecase
" �����̎��ɑ啶�����܂܂�Ă���ꍇ�͋�ʂ��Č�������
set smartcase
" �Ō�܂Ō���������擪�ɖ߂�
set wrapscan
" �C���N�������^���T�[�`���g��Ȃ�
set noincsearch

"----------------------------------------------------
" �\���֌W
"----------------------------------------------------
" �^�C�g�����E�C���h�E�g�ɕ\������
set title
" �s�ԍ���\������
set number
" ���[���[��\��
"set ruler
" �^�u������ CTRL-I �ŕ\�����A�s���� $ �ŕ\������
"set list
" ���͒��̃R�}���h���X�e�[�^�X�ɕ\������
set showcmd
" �X�e�[�^�X���C������ɕ\��
set laststatus=2
" ���ʓ��͎��̑Ή����銇�ʂ�\��
set showmatch
" �Ή����銇�ʂ̕\�����Ԃ�2�ɂ���
set matchtime=2
" �V���^�b�N�X�n�C���C�g��L���ɂ���
syntax on
" �������ʕ�����̃n�C���C�g��L���ɂ���
set hlsearch
" �R�����g���̐F��ύX
highlight Comment ctermfg=DarkCyan
" �R�}���h���C���⊮���g�����[�h�ɂ���
set wildmenu

" ���͂���Ă���e�L�X�g�̍ő啝
" (�s�������蒷���Ȃ�ƁA���̕��𒴂��Ȃ��悤�ɋ󔒂̌�ŉ��s�����)�𖳌��ɂ���
set textwidth=0
" �E�B���h�E�̕���蒷���s�͐܂�Ԃ��āA���̍s�ɑ����ĕ\������
set wrap

" �X�e�[�^�X���C���̐F
highlight StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white

"----------------------------------------------------
" �C���f���g
"----------------------------------------------------
" �I�[�g�C���f���g�𖳌��ɂ���
"set noautoindent
" �^�u���Ή�����󔒂̐�
set tabstop=4
" �^�u��o�b�N�X�y�[�X�̎g�p���̕ҏW���������Ƃ��ɁA�^�u���Ή�����󔒂̐�
set softtabstop=4
" �C���f���g�̊e�i�K�Ɏg����󔒂̐�
set shiftwidth=4
" �^�u��}������Ƃ��A����ɋ󔒂��g��Ȃ�
set noexpandtab

"----------------------------------------------------
" �I�[�g�R�}���h
"----------------------------------------------------
if has("autocmd")
    " �t�@�C���^�C�v�ʃC���f���g�A�v���O�C����L���ɂ���
    filetype plugin indent on
    " �J�[�\���ʒu���L������
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
endif

"----------------------------------------------------
" ���̑�
"----------------------------------------------------
" �o�b�t�@��ؑւ��Ă�undo�̌��͂�����Ȃ�
set hidden
" �N�����̃��b�Z�[�W��\�����Ȃ�
set shortmess+=

"�N���b�v�{�[�h��Windows�ƘA�g
set clipboard=unnamed
"Vi�݊����I�t
set nocompatible
"�ύX���̃t�@�C���ł��A�ۑ����Ȃ��ő��̃t�@�C����\��
set hidden
"�����ʂ����͂��ꂽ�Ƃ��A�Ή����銇�ʂ�\������
set showmatch
"�V�����s��������Ƃ��ɍ��x�Ȏ����C���f���g���s��
set smartindent
"�s���̗]������ Tab ��ł����ނƁA'shiftwidth' �̐������C���f���g����B
set smarttab
"�J�[�\�����s���A�s���Ŏ~�܂�Ȃ��悤�ɂ���
set whichwrap=b,s,h,l,<,>,[,]

