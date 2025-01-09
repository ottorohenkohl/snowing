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
						go
						kotlin
						kubectl
						k9s
						jdk
						nmap
						texliveFull
					];

					homebrew = {
					    casks = [
					        "gimp"
                            "goland"
                            "inkscape"
                            "insomnia"
                            "intellij-idea"
                            "microsoft-outlook"
                            "pycharm"
                            "webstorm"
                        ];

                        enable = true;

                        onActivation = {
                            autoUpdate = true;
                            upgrade = true;
                        };
                    };

					networking = {
						computerName = "MacBook-Otto";
						hostName = "MacBook-Otto";
					};

					nix.extraOptions = "\nexperimental-features = nix-command flakes\n";

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

								orientation = "right";
			 
								wvous-bl-corner = 1;
								wvous-br-corner = 1;

								persistent-apps = [
									"/Applications/Safari.app"
									"/System/Applications/App Store.app"
									"/System/Applications/Mail.app"
									"/System/Applications/Notes.app"
									"/System/Applications/Calendar.app"
									"/System/Applications/Reminders.app"
									"/Applications/GoLand.app"
									"/Applications/IntelliJ IDEA.app"
									"/Applications/Webstorm.app"
									"/System/Applications/Photos.app"
									"/System/Applications/TV.app"
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

							WindowManager = {
                                GloballyEnabled = true;
                                StandardHideDesktopIcons = false;
                            };
						};

						stateVersion = 5;
					};
				})
			];
		};
	};
}
