{
	description = "snowing away my personal setup hustle";

	inputs = {
		darwin.url = "github:lnl7/nix-darwin";
	};

	outputs = inputs@{ darwin, ... }: {
		darwinConfigurations.MacBook-Otto = darwin.lib.darwinSystem {
			system = "aarch64-darwin";

			modules = [
				({ pkgs, lib, ... }: {
					environment.systemPackages = with pkgs; [
						dart
						ghostscript
						gimp
						go
						inkscape
						insomnia
						kotlin
						kubectl
						k9s
						jdk
						jetbrains.goland
						jetbrains.idea-ultimate
						jetbrains.pycharm-professional
						jetbrains.webstorm
						nmap
						obsidian
						texliveFull
					];

					networking = {
						computerName = "MacBook-Otto";
						hostName = "MacBook-Otto";
					};

					nix.extraOptions = "\nexperimental-features = nix-command flakes\n";

					nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
						"goland"
						"idea-ultimate"
						"insomnia"
						"obsidian"
						"pycharm-professional"
						"webstorm"
					];

					power.sleep = {
						computer = 10;
						display = 5;
					};

					programs.zsh = {
						enable = true;
						enableSyntaxHighlighting = true;
					};
					
					security.pam.enableSudoTouchIdAuth = true;

					services.nix-daemon.enable = true;

					system = {
						defaults = {
							dock = {
								dashboard-in-overlay = false;
								expose-group-apps = true;
								minimize-to-application = true;
								show-process-indicators = false;
								show-recents = false;
			 
								wvous-bl-corner = 1;
								wvous-br-corner = 1;

								persistent-apps = [
									"/Applications/Safari.app"
									"/System/Applications/App Store.app"
									"/System/Applications/Mail.app"
									"/System/Applications/FaceTime.app"
									"/System/Applications/Messages.app"
									"/System/Applications/Notes.app"
									"/System/Applications/Calendar.app"
									"/System/Applications/Reminders.app"
									"/Applications/Nix Apps/GoLand.app"
									"/Applications/Nix Apps/IntelliJ IDEA.app"
									"/Applications/Nix Apps/Webstorm.app"
									"/System/Applications/Photos.app"
									"/System/Applications/TV.app"
									"/System/Applications/Podcasts.app"
									"/System/Applications/Music.app"
								];
							};

							finder = {
								_FXSortFoldersFirst = true;

								NewWindowTarget = "Home";
								FXDefaultSearchScope = "SCcf";
								FXPreferredViewStyle = "Nlsv";

								FXRemoveOldTrashItems = true;
								QuitMenuItem = true;
								ShowPathbar = true;
							};

							NSGlobalDomain = {
								AppleInterfaceStyle = "Dark";

								NSAutomaticCapitalizationEnabled = false;
								NSAutomaticDashSubstitutionEnabled = false;
								NSAutomaticSpellingCorrectionEnabled = false;
								NSNavPanelExpandedStateForSaveMode = true;
							};
						};

						stateVersion = 5;
					};
				})
			];
		};
	};
}
