#!/usr/bin/env perl
use strict;
use warnings;
use feature "say";

my $backup_dir = "$ENV{HOME}/dotfiles_old";

opendir DH, $ENV{PWD};

while (my $file = readdir DH) {
    next if $file =~ /^\.*$/;
    next if $file =~ /README/;
    next if $file =~ /^\.git/;
    next if $0 =~ /$file/;

    my $old = "$ENV{PWD}/$file";
    my $new = "$ENV{HOME}/$file";

    if (-e $new and not -l $new) {
        mkdir $backup_dir;

        say "Backing up new $file to $backup_dir";
        rename $new, "$backup_dir/$file";
    }

    say "Creating symlink to $file in home directory";
    symlink $old, $new;
}

closedir DH;

