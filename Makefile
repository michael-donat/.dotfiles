mkfile_path := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

install:
	echo "source $(mkfile_path).zshrc" > ~/.zshrc