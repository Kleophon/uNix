{pkgs,inputs,fenix,...}:
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
      fastfetch
      # pkgs.nerd-fonts.jetbrains-mono
     #  pkgs.nerd-fonts.fira-code
      git
      ayugram-desktop
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
      jdk21
      jetbrains.idea
      inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
      wl-clipboard
      cliphist
      mpv
      zed-editor
      godot-mono
      aseprite
      davinci-resolve
      fenix.packages.x86_64-linux.stable.toolchain
      obs-studio
      brightnessctl
  ];
  fonts.packages = with pkgs; [
  nerd-fonts.jetbrains-mono
  nerd-fonts.fira-code
];
}
