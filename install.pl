#!/usr/bin/env perl
use strict;
use warnings;
use POSIX qw(strftime);
use Getopt::Std;
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

sub help {
    say <<EOF;
Usage: $0 [OPTION]
Symlink dotfiles to the home folder. Prompts if there are conflicts.

  -i ask before symlinking each file (recommended)
  -h display this help and exit
EOF
    exit;
}

my %opts;

getopts("ih", \%opts);

if ($opts{h}) {
    help;
}

opendir DH, $ENV{PWD} or die $!;

while (my $file = readdir DH) {
    next if $file =~ /^\.*$/;
    next if $file =~ /README/;
    next if $file =~ /LICENSE/;
    next if $file eq ".gitignore";
    next if $file eq ".git";
    next if $file eq $0;

    my $old = "$ENV{PWD}/$file";
    my $new = "$ENV{HOME}/$file";

    # Don't prompt if overwriting a symlink
    if (-e $new and not -l $new) {
        next unless yesno "$file exists, overwrite?";

        # Move the file
        my $time = strftime "%s", localtime;
        rename $new, "$new.bak.$time"
    }

    if ($opts{i}) {
        next unless yesno "Symlink $file?";
    }

    say "Creating symlink to $file in home directory";
    symlink $old, $new;
}

closedir DH;

if ($opts{i}) {
    exit unless yesno "Install vundle and plugins?";
}

my $vundle = "$ENV{HOME}/.vim/bundle/vundle";
if (is_folder_empty $vundle) {
    system "git clone https://github.com/gmarik/vundle.git $vundle";

    say "Installing bundles";
    system "vim +BundleInstall +qall";
}

