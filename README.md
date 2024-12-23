
# Snowing

[![pipeline status](http://lab.ottorohenkohl.de/infrastruktur/nix/snowing/badges/main/pipeline.svg)](http://lab.ottorohenkohl.de/infrastruktur/nix/snowing/-/commits/main) [![coverage report](http://lab.ottorohenkohl.de/infrastruktur/nix/snowing/badges/main/coverage.svg)](http://lab.ottorohenkohl.de/infrastruktur/nix/snowing/-/commits/main) [![Latest Release](http://lab.ottorohenkohl.de/infrastruktur/nix/snowing/-/badges/release.svg)](http://lab.ottorohenkohl.de/infrastruktur/nix/snowing/-/releases)

**Snowing** ist ein Nix-Repository, das die Flake-Konfiguration für ein macOS-System mit **Nix-Darwin** bereitstellt. Es enthält die grundlegenden Konfigurationsdateien `flake.nix` und `flake.lock`, die die gesamte Systemkonfiguration definieren.

## 1. Projektbeschreibung

Dieses Repository dient als zentrale Quelle für die Verwaltung der **Nix-Darwin**-Konfiguration eines macOS-Systems. Es bietet:

- **Modularität**: Alle Konfigurationen werden in einer Flake definiert und können leicht angepasst oder erweitert werden.
- **Reproduzierbarkeit**: Die `flake.lock` stellt sicher, dass alle Abhängigkeiten auf denselben Versionen bleiben.
- **Nix-Darwin-Integration**: Die Konfiguration ist speziell auf macOS-Systeme zugeschnitten und nutzt die Möglichkeiten von Nix-Darwin.

Das Ziel ist es, eine einfache und reproduzierbare Konfigurationsbasis für dein macOS-System zu schaffen.

## 2. Installation/Einrichtung

### Voraussetzungen

- **Nix** ist installiert.  
  Anleitung: [Nix installieren](https://nixos.org/download.html)  
- **Nix-Darwin** ist installiert und konfiguriert.  
  Anleitung: [Nix-Darwin einrichten](https://github.com/LnL7/nix-darwin)

### Nutzung

1. Klone das Repository:
   ```bash
   git clone https://lab.ottorohenkohl.de/infrastruktur/nix/snowing.git
   cd snowing
   ```

2. Wende die Konfiguration an:
   ```bash
   darwin-rebuild switch --flake .
   ```

3. Optional: Flake-Cache aktualisieren:
   ```bash
   nix flake update
   ```

## 3. Nutzung/Beispiele

### Beispiel: Hinzufügen eines Pakets

Um ein Paket zu deiner Konfiguration hinzuzufügen, öffne die `flake.nix` und füge es in den entsprechenden Abschnitt hinzu.  

Beispiel:  
```nix
environment.systemPackages = with pkgs; [
  vim
  git
];
```

Danach führe `darwin-rebuild switch --flake .` aus, um die Änderungen zu übernehmen.

### Beispiel: Ändern der Systemoptionen

Die `flake.nix` erlaubt es dir, macOS-spezifische Optionen wie **Dock-Konfiguration**, **Hot Corners** oder **Launch Agents** zu definieren.  

Beispiel:
```nix
programs.dock.enable = true;
programs.dock.settings.show-recents = false;
```

## 4. Weiterführende Links

- [Nix](https://nixos.org/) – Dokumentation zu Nix.
- [Nix-Darwin](https://github.com/LnL7/nix-darwin) – Nix-Darwin GitHub-Repository.
- [Nix Flakes](https://nixos.wiki/wiki/Flakes) – Einführung in Nix Flakes.
