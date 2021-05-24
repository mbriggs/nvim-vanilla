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


setup_tools:
	GO111MODULE=on go install github.com/go-delve/delve/cmd/dlv@latest
	GO111MODULE=on go get golang.org/x/tools/cmd/goimports@latest

setup_lsp: setup_lsp_html setup_lsp_css setup_lsp_lua setup_lsp_json
	npm install -g yaml-language-server
	GO111MODULE=on go get golang.org/x/tools/gopls@latest
	brew install hashicorp/tap/terraform-ls
	npm install -g typescript typescript-language-server
	npm install -g dockerfile-language-server-nodejs
	npm install -g vls

setup_lsp_html:
	curl -L -o vscode.tar.gz https://update.code.visualstudio.com/latest/linux-x64/stable
	rm -rf vscode
	mkdir vscode
	tar -xzf vscode.tar.gz -C vscode --strip-components 1
	rm vscode.tar.gz
	rm -rf vscode-html
	mkdir vscode-html
	cp -r vscode/resources/app/extensions/node_modules vscode-html
	cp -r vscode/resources/app/extensions/html-language-features vscode-html
	rm -rf vscode

setup_lsp_css:
	curl -o vscode.tar.gz -L https://update.code.visualstudio.com/latest/linux-x64/stable
	rm -rf vscode
	mkdir vscode
	tar -xzf vscode.tar.gz -C vscode --strip-components 1
	rm vscode.tar.gz
	rm -rf vscode-css
	mkdir vscode-css
	cp -r vscode/resources/app/extensions/node_modules vscode-css
	cp -r vscode/resources/app/extensions/css-language-features vscode-css
	rm -rf vscode

setup_lsp_lua:
	rm -rf lua-language-server
	git clone https://github.com/sumneko/lua-language-server
	cd lua-language-server && git submodule update --init --recursive
	cd lua-language-server/3rd/luamake && ./compile/install.sh
	cd lua-language-server && ./3rd/luamake/luamake rebuild

setup_lsp_json:
	curl -L -o vscode.tar.gz https://update.code.visualstudio.com/latest/linux-x64/stable
	rm -rf vscode
	mkdir vscode
	tar -xzf vscode.tar.gz -C vscode --strip-components 1
	rm vscode.tar.gz
	rm -rf vscode-json
	mkdir vscode-json
	cp -r vscode/resources/app/extensions/node_modules vscode-json
	cp -r vscode/resources/app/extensions/json-language-features vscode-json
	rm -rf vscode

link:
	mkdir -p ~/.config
	ln -s ~/nvim ~/.config/nvim
