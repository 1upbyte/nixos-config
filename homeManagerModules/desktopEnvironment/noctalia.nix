{
  pkgs,
  config,
  inputs,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;
    settings = {
      bar = {
        density = "compact";
        position = "bottom";
        floating = true;
        showCapsule = false;
        widgets = {
          left = [
            {
              id = "ControlCenter";
              customIconPath = "";
              icon = "noctalia";
              useDistroLogo = true;
            }
            {
              id = "Bluetooth";
            }
            {
              id = "TaskbarGrouped";
            }
          ];
          center = [
            {
              id = "MediaMini";
              hideMode = "hidden";
              maxWidth = 145;
              scrollingMode = "always";
              showAlbumArt = true;
              showVisualizer = true;
              useFixedWidth = false;
              visualizerType = "mirrored";
            }
          ];
          right = [
            {
              id = "Battery";
              displayMode = "alwaysShow";
              warningThreshold = 25;
            }
            {
              id = "Clock";
              customFont = "";
              formatHorizontal = "h:mm AP";
              formatVertical = "h:mm AP";
              useCustomFont = false;
              usePrimaryColor = true;
            }
          ];
        };
      };
      colorSchemes = {
        generateTemplatesForPredefined = false;
        predefinedScheme = "Catppuccin";
      };
      controlCenter.shortcuts = {
        left = [
          { id = "WiFi"; }
          { id = "Bluetooth"; }
          { id = "ScreenRecorder"; }
          { id = "WallpaperSelector"; }
        ];
        right = [
          { id = "Notifications"; }
          { id = "PowerProfile"; }
          { id = "KeepAwake"; }
          { id = "NightLight"; }
        ];
      };
      brightness.enforceMinimum = false;
      general = {
        avatarImage = "${config.avatar}";
        radiusRatio = 0.2;
      };
      location = {
        name = "Tokyo";
        use12hourFormat = true;
        useFahrenheit = true;
        weatherEnabled = false;
      };
      network.wifiEnabled = false;
      osd.location = "right";
      setupCompleted = true;
      ui.tooltipsEnabled = false;
      wallpaper.enabled = false;
    };
  };
}
