#!/usr/bin/env python3
import os
import subprocess
from textual.app import App, ComposeResult
from textual.widgets import Header, Footer, Static
from textual.containers import Vertical, ScrollableContainer
from textual.reactive import reactive
from textual.binding import Binding


PACKAGES = [
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
    
    .package-item {
        height: 3;
        margin: 0 2;
        border: solid $primary;
        width: 100%;
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
        Binding("space", "toggle_selection", "Toggle selection"),
        Binding("a", "toggle_all", "Toggle all packages"),
        Binding("enter", "quit_and_show", "Confirm and quit"),
        Binding("escape", "quit", "Quit without selection"),
    ]

    selected_packages = reactive(set())
    current_index = reactive(0)

    def compose(self) -> ComposeResult:
        yield Header()
        with Vertical():
            yield Static("📦 Package Selector 📦", classes="title")
            yield Static(
                "Use ↑↓ or hj to move, SPACE to select, A to toggle all, ENTER to confirm",
                classes="instructions",
            )
            with ScrollableContainer():
                for i, package in enumerate(PACKAGES):
                    yield Static("", classes="package-item", id=f"package-{i}")
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
            status_text = f"1 package selected"
        else:
            status_text = f"{selected_count} packages selected"
        status_widget.update(status_text)

    def action_cursor_up(self) -> None:
        """Move cursor up."""
        if self.current_index > 0:
            self.current_index -= 1
            self.update_display()
            self.scroll_to_current()

    def action_cursor_down(self) -> None:
        """Move cursor down."""
        if self.current_index < len(PACKAGES) - 1:
            self.current_index += 1
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
    script_path = f"scripts/install_{package}.sh"

    if not os.path.exists(script_path):
        print(f"❌ Script not found: {script_path}")
        return False

    try:
        print(f"📦 Installing {package}...")
        result = subprocess.run(
            ["bash", script_path], capture_output=True, text=True, timeout=30
        )

        if result.returncode == 0:
            print(f"✅ Successfully installed {package}")
            return True
        else:
            print(f"❌ Failed to install {package}: {result.stderr}")
            return False

    except subprocess.TimeoutExpired:
        print(f"⏰ Timeout installing {package}")
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
