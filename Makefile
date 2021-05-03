default: install_plugins setup_python link

install:
	xcode-select --install
	arch -arm64 brew install --HEAD tree-sitter
	arch -arm64 brew install --HEAD luajit
	arch -arm64 brew install --HEAD neovim

install_plugins:
	nvim +PlugInstall +qa

setup_python:
	pip3 install --user --upgrade pynvim

setup_lsp:
	nvim "+LspInstall bashls" +qa
	nvim "+LspInstall cssls" +qa
	nvim "+LspInstall dockerls" +qa
	nvim "+LspInstall html" +qa
	nvim "+LspInstall jsonls" +qa
	nvim "+LspInstall tsserver" +qa
	nvim "+LspInstall yamlls" +qa
	nvim "+LspInstall vimls" +qa

link:
	mkdir -p ~/.config
	ln -s ~/nvim ~/.config/nvim
