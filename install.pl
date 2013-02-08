#!/usr/bin/env perl
use strict;
use warnings;
use feature "say";

my $backup_dir = "$ENV{HOME}/dotfiles_old";

opendir DH, $ENV{PWD};

while (my $file = readdir DH) {
    next if $file =~ /^\.*$/;
    next if $file =~ /\.bak$/;
    next if $file =~ /^\.git/;
    next if $0 =~ /$file/;

    if (-e "$ENV{HOME}/$file") {
        mkdir $backup_dir;

        say "Backing up old $file to $backup_dir";
        rename "$ENV{HOME}/$file", "$backup_dir/$file";
    }

    say "Creating symlink to $file in home directory";
    symlink "$ENV{PWD}/$file", "$ENV{HOME}/$file";

    say "";
}

closedir DH;

