{
  programs.starship = {
    enable = true;
    settings = {
      scan_timeout = 10;
      command_timeout = 10000;
      add_newline = false;
      line_break.disabled = true;
      cmd_duration.disabled = true;

      format = ''
        $directory$time
        $character'';

      right_format = ''

        $username
        $hostname
        $localip
        $shlvl
        $singularity
        $kubernetes
        $vcsh
        $fossil_branch
        $git_branch
        $git_commit
        $git_state
        $git_metrics
        $git_status
        $hg_branch
        $pijul_channel
        $docker_context
        $package
        $c
        $cmake
        $cobol
        $daml
        $dart
        $deno
        $dotnet
        $elixir
        $elm
        $erlang
        $fennel
        $golang
        $guix_shell
        $haskell
        $haxe
        $helm
        $java
        $julia
        $kotlin
        $gradle
        $lua
        $nim
        $nodejs
        $ocaml
        $opa
        $perl
        $php
        $pulumi
        $purescript
        $python
        $raku
        $rlang
        $red
        $ruby
        $rust
        $scala
        $solidity
        $swift
        $terraform
        $vlang
        $vagrant
        $zig
        $buf
        $nix_shell
        $conda
        $meson
        $spack
        $memory_usage
        $aws
        $gcloud
        $openstack
        $azure
        $env_var
        $crystal
        $custom
        $sudo
        $cmd_duration
        $line_break
        $jobs
        $battery
        $status
        $os
        $container
        $shell'';

      character = {
        success_symbol = "[](green)";
        error_symbol = "[](red)";
        vimcmd_symbol = "[](teal)";
      };

      directory = {
        format = "[$path]($style)( [$read_only]($read_only_style)) ";
        style = "blue";
        disabled = false;
      };
      time = {
        format = "[$time]($style)";
        style = "blue";
        disabled = false;
      };

      status = {
        format = "[$symbol]($style)";
        symbol = "[](red)";
        success_symbol = "[](green)";
        disabled = true;
      };

      git_branch = {
        style = "purple";
        symbol = "";
      };

      git_metrics = {
        disabled = false;
        added_style = "bold yellow";
        deleted_style = "bold red";
      };

      aws.symbol = "  ";
      conda.symbol = " ";
      dart.symbol = " ";
      directory.read_only = " ";
      docker_context.symbol = " ";
      elixir.symbol = " ";
      elm.symbol = " ";
      gcloud.symbol = " ";
      golang.symbol = " ";
      java.symbol = " ";
      julia.symbol = " ";
      lua.symbol = " ";
      memory_usage.symbol = " ";
      nim.symbol = " ";
      nix_shell.symbol = " ";
      nodejs.symbol = " ";
      package.symbol = " ";
      perl.symbol = " ";
      php.symbol = " ";
      python.symbol = " ";
      ruby.symbol = " ";
      rust.symbol = " ";
      scala.symbol = " ";
      swift.symbol = "ﯣ ";
      terraform.symbol = "行 ";
    };

  };
}
