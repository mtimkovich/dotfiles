#!/usr/bin/env perl
use strict;
use warnings;
use POSIX qw(strftime);
use feature "say";

sub yesno {
    my ($prompt) = @_;

    print "$prompt [Y/n] ";
    chomp($_ = <>);

    /y/i;
}

sub is_folder_empty {
    opendir DH, shift or die $!;

    return not grep { not /^\.*$/ } readdir DH;
}

opendir DH, $ENV{PWD} or die $!;

while (my $file = readdir DH) {
    next if $file =~ /^\.*$/;
    next if $file =~ /README/;
    next if $file eq ".gitignore";
    next if $file eq ".git";
    next if $0 =~ /$file/;

    my $old = "$ENV{PWD}/$file";
    my $new = "$ENV{HOME}/$file";

    # Don't prompt if overwriting a symlink
    if (-e $new and not -l $new) {
        next unless yesno "$file exists, overwrite?";

        # Move the file
        my $time = strftime "%s", localtime;
        rename $file, "$file.bak.$time"
    }

    say "Creating symlink to $file in home directory";
    symlink $old, $new;
}

closedir DH;

if (is_folder_empty "$ENV{HOME}/.vim/bundle/vundle") {
    system "git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle";

    say "Installing bundles";
    system "vim +BundleInstall +qall";
}

