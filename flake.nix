{
    description = "snowing away my personal setup hustle";

    inputs = {
        darwin.url = "github:lnl7/nix-darwin";
    };

    outputs = inputs@{ darwin, ... }: {
        darwinConfigurations.MacBook-Air-von-Otto = darwin.lib.darwinSystem {
            system = "aarch64-darwin";

            modules = [
                ({ pkgs, lib, ... }: {
                    environment.systemPackages = with pkgs; [
                        dart
                        gimp
                        go
                        kotlin
                        kubectl
                        k9s
                        jetbrains.goland
                        jetbrains.idea-ultimate
                        jetbrains.pycharm-professional
                        jetbrains.webstorm
                        nmap
                    ];

                    networking = {
                        computerName = "MacBook-Air-von-Otto";
                        hostName = "MacBook-Air-von-Otto";
                    };

                    nix.extraOptions = "\nexperimental-features = nix-command flakes\n";

		    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
                        "goland"
                        "idea-ultimate"
                        "pycharm-professional"
                        "webstorm"
                    ];

                    power.sleep = {
                        computer = 10;
                        display = 5;
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

                                wvous-bl-corner = 11;
                                wvous-br-corner = 11;

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
                                NewWindowTarget = "Home";

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
