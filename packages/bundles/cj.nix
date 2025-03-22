{ config, lib, pkgs, ... }:{

  # mkEnableOption is mkOption of bool, defaulted to false
  #   https://github.com/NixOS/nixpkgs/blob/master/lib/options.nix?plain=1#L182
  options.bundles.cj = lib.mkEnableOption "CJ Bundle";

  config = lib.mkIf config.bundles.cj {
    
    packages.google-chrome = true;
  
    environment.systemPackages = with pkgs;[
      maven
      jetbrains.idea-ultimate
      slack
    ];
  
    # https://github.com/NixOS/nix/issues/8081
    # security export -t certs -f pemseq -k /Library/Keychains/System.keychain -o /tmp/certs-system.pem
    # security export -t certs -f pemseq -k /System/Library/Keychains/SystemRootCertificates.keychain -o /tmp/certs-root.pem
    # cat /tmp/certs-root.pem /tmp/certs-system.pem > /tmp/ca_cert.pem
    # sudo mv /tmp/ca_cert.pem /etc/nix/
    # 
    # ssl-cert-file = /etc/nix/ca_cert.pem
    #
    # sudo launchctl unload /Library/LaunchDaemons/org.nixos.nix-daemon.plist
    # sudo launchctl load /Library/LaunchDaemons/org.nixos.nix-daemon.plist
    # sudo -i nix-channel --update nixpkgs
    security.pki.certificateFiles = [ "/etc/nix/ca_cert.pem" ];
  };
}
