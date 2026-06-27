{pkgs,fenix,...}:
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
      fastfetch
      # pkgs.nerd-fonts.jetbrains-mono
     #  pkgs.nerd-fonts.fira-code
      git
      kitty
      unzip
      fuzzel
      swaybg
      btop
      swaylock
      ly
      waybar
      waypaper
      bibata-cursors
      heroic
      hyprlock
      qbittorrent
      xwayland-satellite
      peazip
      obsidian
      fzf
      kdePackages.dolphin
      gcc
      sunsetr
      wl-clipboard
      cliphist
      zed-editor
      godot-mono
      aseprite
      fenix.packages.x86_64-linux.stable.toolchain
      obs-studio
  ];
  fonts.packages = with pkgs; [
  nerd-fonts.jetbrains-mono
  nerd-fonts.fira-code
];
}
