PREFIX    ?= $(HOME)/.local
CONFDIR   ?= $(HOME)/.config/sessionizer

BINDIR    = $(PREFIX)/bin
LIBDIR    = $(PREFIX)/lib/sessionizer
SHAREDIR  = $(PREFIX)/share/sessionizer/completions

LIB_FILES = .local/lib/sessionizer/config.sh \
            .local/lib/sessionizer/tmux.sh \
            .local/lib/sessionizer/commands.sh \
            .local/lib/sessionizer/ui.sh

.PHONY: install uninstall help

install:
	install -Dm755 .local/bin/sessionizer "$(BINDIR)/sessionizer"
	@for f in $(LIB_FILES); do \
		install -Dm644 "$$f" "$(LIBDIR)/$$(basename $$f)"; \
	done
	install -Dm644 .local/share/sessionizer/completions/sessionizer.bash "$(SHAREDIR)/sessionizer.bash"
	install -Dm644 .local/share/sessionizer/completions/sessionizer.zsh "$(SHAREDIR)/sessionizer.zsh"
	@if [ ! -f "$(CONFDIR)/projects.conf" ]; then \
		install -Dm644 projects.conf.example "$(CONFDIR)/projects.conf"; \
		echo "Installed example config to $(CONFDIR)/projects.conf"; \
	else \
		printf "Config already exists at $(CONFDIR)/projects.conf. Overwrite? [y/N] "; \
		read ans; \
		case "$$ans" in \
			[yY]*) \
				install -Dm644 projects.conf.example "$(CONFDIR)/projects.conf"; \
				echo "Overwritten config at $(CONFDIR)/projects.conf"; \
				;; \
			*) \
				echo "Kept existing config"; \
				;; \
		esac; \
	fi
	@echo ""
	@echo "Installed sessionizer to $(BINDIR)/sessionizer"
	@echo ""
	@echo "To enable shell completions, add to your shell rc:"
	@echo "  zsh:  source $(SHAREDIR)/sessionizer.zsh"
	@echo "  bash: source $(SHAREDIR)/sessionizer.bash"

uninstall:
	rm -f "$(BINDIR)/sessionizer"
	rm -rf "$(LIBDIR)"
	rm -rf "$(PREFIX)/share/sessionizer"
	@echo "Uninstalled sessionizer (config at $(CONFDIR) was kept)"

help:
	@echo "sessionizer Makefile"
	@echo ""
	@echo "Targets:"
	@echo "  install     Install sessionizer to PREFIX (default: ~/.local)"
	@echo "  uninstall   Remove sessionizer (keeps config)"
	@echo "  help        Show this message"
	@echo ""
	@echo "Variables:"
	@echo "  PREFIX      Installation prefix  (default: ~/.local)"
	@echo "  CONFDIR     Config directory      (default: ~/.config/sessionizer)"
