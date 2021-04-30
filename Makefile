DOT_FILES = .zshrc .vimrc .vim .vimrc.neocomplcache .vimrc.tab .vimrc.lightline .vimrc.indent .gitconfig .gitignore .git_commit_template .direnvrc

all: zsh vim git direnv

zsh: $(foreach f, $(filter .zsh%, $(DOT_FILES)), link-dot-file-$(f))

vim: $(foreach f, $(filter .vim%, $(DOT_FILES)), link-dot-file-$(f))

git: $(foreach f, $(filter .git%, $(DOT_FILES)), link-dot-file-$(f))

direnv: $(foreach f, $(filter .direnv%, $(DOT_FILES)), link-dot-file-$(f))
  
.PHONY: clean
clean: $(foreach f, $(DOT_FILES), unlink-dot-file-$(f))  

link-dot-file-%: %
	@echo "Create Symlink $< => $(HOME)/$<"
	@ln -snf $(CURDIR)/$< $(HOME)/$<

unlink-dot-file-%: %
	@echo "Remove Symlink $(HOME)/$<"
	@$(RM) $(HOME)/$<
