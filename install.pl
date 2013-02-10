#!/usr/bin/env perl
use strict;
use warnings;
use feature "say";

sub is_folder_empty {
    opendir DH, shift or die $!;

    return not grep { not /^\.*$/ } readdir DH;
}

my $backup_dir = "$ENV{HOME}/dotfiles_old";

opendir DH, $ENV{PWD} or die $!;

while (my $file = readdir DH) {
    next if $file =~ /^\.*$/;
    next if $file =~ /README/;
    next if $file =~ /^\.git/;
    next if $0 =~ /$file/;

    my $old = "$ENV{PWD}/$file";
    my $new = "$ENV{HOME}/$file";

    if (-e $new and not -l $new) {
        mkdir $backup_dir;

        say "Backing up old $file to $backup_dir";
        rename $new, "$backup_dir/$file";
    }

    say "Creating symlink to $file in home directory";
    symlink $old, $new;
}

closedir DH;

if (is_folder_empty "$ENV{HOME}/.vim/bundle/vundle") {
    system "git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle";
}

say "Installing bundles";
system "vim +BundleInstall +qall";
