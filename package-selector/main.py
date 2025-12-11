#!/usr/bin/env python3
import os
import subprocess
from pathlib import Path
from textual.app import App, ComposeResult
from textual.widgets import Header, Footer, Static
from textual.containers import Vertical, Horizontal, ScrollableContainer
from textual.reactive import reactive
from textual.binding import Binding


PACKAGES = [
    "awscli",
    "terraform",
    "sops",
    "neovim",
    "nvm",
    "lazygit",
    "opencode",
    "alacritty",
    "tmux",
    "neofetch",
    "xh",
    "fzf",
    "starship",
    "bat",
    "exa",
    "xcp",
    "rip",
    "zoxide",
    "ripgrep",
    "fd",
    "procs",
    "topgrade",
    "tokei",
    "yazi",
    "zellij",
]
CURRENT_DIR = Path(__file__).parent.resolve()


class PackageSelector(App):
    """Interactive package selection CLI tool."""

    CSS = """
    Screen {
        layout: vertical;
    }
    
    .title {
        text-align: center;
        text-style: bold;
        color: $accent;
        margin: 1 0;
    }
    
    .instructions {
        text-align: center;
        color: $text-muted;
        margin: 0 0 1 0;
    }
    
    .package-row {
        height: 3;
        margin: 0 1;
    }
    
    .package-item {
        height: 3;
        margin: 0 1;
        border: solid $primary;
        width: 1fr;
        min-width: 20;
    }
    
    .package-item:hover {
        background: $surface;
    }
    
    .package-item.-selected {
        background: $primary;
        color: $text;
    }
    
    .status-bar {
        height: 3;
        background: $surface;
        content-align: center middle;
        color: $text-muted;
        margin: 1 0 0 0;
    }
    """

    BINDINGS = [
        Binding("up,k", "cursor_up", "Move up"),
        Binding("down,j", "cursor_down", "Move down"),
        Binding("left,h", "cursor_left", "Move left"),
        Binding("right,l", "cursor_right", "Move right"),
        Binding("space", "toggle_selection", "Toggle selection"),
        Binding("a", "toggle_all", "Toggle all packages"),
        Binding("enter", "quit_and_show", "Confirm and quit"),
        Binding("escape", "quit", "Quit without selection"),
    ]

    selected_packages = reactive(set())
    current_index = reactive(0)

    def get_grid_position(self, index: int) -> tuple[int, int]:
        """Convert linear index to (row, col) grid position."""
        return index // 3, index % 3

    def get_linear_index(self, row: int, col: int) -> int:
        """Convert (row, col) grid position to linear index."""
        return row * 3 + col

    def compose(self) -> ComposeResult:
        yield Header()
        with Vertical():
            yield Static("📦 Package Selector 📦", classes="title")
            yield Static(
                "Use ↑↓←→ or hjkl to navigate, SPACE to select, A to toggle all, ENTER to confirm",
                classes="instructions",
            )
            with ScrollableContainer():
                # Create rows of 3 packages each
                for row_idx in range(0, len(PACKAGES), 3):
                    with Horizontal(classes="package-row"):
                        for col_idx in range(3):
                            pkg_idx = row_idx + col_idx
                            if pkg_idx < len(PACKAGES):
                                yield Static(
                                    "", classes="package-item", id=f"package-{pkg_idx}"
                                )
                            else:
                                # Empty placeholder for incomplete rows
                                yield Static("", classes="package-item")
            yield Static("", classes="status-bar", id="status")
        yield Footer()

    def on_mount(self) -> None:
        """Initialize app when mounted."""
        self.update_display()
        self.update_status()

    def update_display(self) -> None:
        """Update display of all package items."""
        for i, package in enumerate(PACKAGES):
            is_current = i == self.current_index
            is_selected = package in self.selected_packages

            checkbox = "✓" if is_selected else " "
            highlight = "→" if is_current else " "

            package_widget = self.query_one(f"#package-{i}", Static)
            package_widget.update(f"{highlight} [{checkbox}] {package}")

            # Update styling
            if is_current:
                package_widget.add_class("-selected")
            else:
                package_widget.remove_class("-selected")

    def update_status(self) -> None:
        """Update status bar."""
        status_widget = self.query_one("#status", Static)
        selected_count = len(self.selected_packages)
        if selected_count == 0:
            status_text = "No packages selected"
        elif selected_count == 1:
            status_text = "1 package selected"
        else:
            status_text = f"{selected_count} packages selected"
        status_widget.update(status_text)

    def action_cursor_up(self) -> None:
        """Move cursor up in grid."""
        row, col = self.get_grid_position(self.current_index)
        if row > 0:
            new_index = self.get_linear_index(row - 1, col)
            if new_index < len(PACKAGES):
                self.current_index = new_index
                self.update_display()
                self.scroll_to_current()

    def action_cursor_down(self) -> None:
        """Move cursor down in grid."""
        row, col = self.get_grid_position(self.current_index)
        new_index = self.get_linear_index(row + 1, col)
        if new_index < len(PACKAGES):
            self.current_index = new_index
            self.update_display()
            self.scroll_to_current()

    def action_cursor_left(self) -> None:
        """Move cursor left in grid."""
        row, col = self.get_grid_position(self.current_index)
        if col > 0:
            new_index = self.get_linear_index(row, col - 1)
            self.current_index = new_index
            self.update_display()
            self.scroll_to_current()

    def action_cursor_right(self) -> None:
        """Move cursor right in grid."""
        row, col = self.get_grid_position(self.current_index)
        if col < 2:  # Maximum 3 columns (0, 1, 2)
            new_index = self.get_linear_index(row, col + 1)
            if new_index < len(PACKAGES):
                self.current_index = new_index
                self.update_display()
                self.scroll_to_current()

    def scroll_to_current(self) -> None:
        """Scroll to make current item visible."""
        current_widget = self.query_one(f"#package-{self.current_index}", Static)
        current_widget.scroll_visible()

    def action_toggle_selection(self) -> None:
        """Toggle selection of current package."""
        current_package = PACKAGES[self.current_index]
        if current_package in self.selected_packages:
            self.selected_packages.remove(current_package)
        else:
            self.selected_packages.add(current_package)
        self.update_display()
        self.update_status()

    def action_toggle_all(self) -> None:
        """Toggle selection of all packages."""
        if len(self.selected_packages) == len(PACKAGES):
            # If all packages are selected, deselect all
            self.selected_packages.clear()
        else:
            # Select all packages
            self.selected_packages = set(PACKAGES)
        self.update_display()
        self.update_status()

    def action_quit_and_show(self) -> None:
        """Quit and install selected packages."""
        if not self.selected_packages:
            self.exit(set())

        self.exit(self.selected_packages)


def run_install_script(package: str) -> bool:
    """Run install script for a package and return success status."""
    script_path = f"{CURRENT_DIR}/scripts/install_{package}.sh"

    if not os.path.exists(script_path):
        print(f"❌ Script not found: {script_path}")
        return False

    try:
        print(f"📦 Installing {package}...")
        print("-" * 40)

        # Run subprocess with real-time output
        with subprocess.Popen(
            ["bash", script_path],
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
            universal_newlines=True,
            bufsize=1,
        ) as process:
            # Stream output in real-time
            if process.stdout:
                for line in iter(process.stdout.readline, ""):
                    if line.strip():
                        print(f"  {line.rstrip()}")

            process.wait()
            print("-" * 40)

        if process.returncode == 0:
            print(f"✅ Successfully installed {package}")
            return True
        else:
            print(f"❌ Failed to install {package} (exit code: {process.returncode})")
            return False

    except Exception as e:
        print(f"💥 Error installing {package}: {e}")
        return False


if __name__ == "__main__":
    app = PackageSelector()
    selected = app.run()

    if selected:
        print("\n🎉 Selected packages:")
        for package in sorted(selected):
            print(f"  • {package}")

        print("\n🚀 Starting installation process...")
        print("=" * 50)

        successful_installs = []
        failed_installs = []

        for package in sorted(selected):
            success = run_install_script(package)
            if success:
                successful_installs.append(package)
            else:
                failed_installs.append(package)
            print()  # Add spacing between installations

        print("=" * 50)
        print("\n📊 Installation Summary:")
        print(f"✅ Successful: {len(successful_installs)} packages")
        if successful_installs:
            for pkg in successful_installs:
                print(f"  • {pkg}")

        if failed_installs:
            print(f"❌ Failed: {len(failed_installs)} packages")
            for pkg in failed_installs:
                print(f"  • {pkg}")

    else:
        print("\n❌ No packages selected.")
