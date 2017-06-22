#!/usr/bin/env perl
use strict;
use warnings;
use POSIX qw(strftime);
use File::Path qw(make_path);
use Getopt::Std;
use feature "say";

sub yesno {
    my ($prompt) = @_;

    print "$prompt [Y/n] ";
    chomp($_ = <>);

    /^y$/i;
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

# Dot files to install
my @DOTS = qw(
    .vimrc
    .bashrc
    .zshrc
    bin
);

my $time = strftime "%s", localtime;

for my $file (@DOTS) {
    my $old = "$ENV{PWD}/$file";
    my $new = "$ENV{HOME}/$file";

    # Don't prompt if overwriting a symlink
    if (-e $new and not -l $new) {
        next unless yesno "$file exists, overwrite?";

        # Move the file
        rename $new, "$new.bak.$time"
    }

    if ($opts{i}) {
        next unless yesno "Symlink $file?";
    }

    say "Creating symlink to $file in home directory";
    symlink $old, $new;
}

# Install vundle
if ($opts{i}) {
    exit unless yesno "Install vundle and plugins?";
}

my $vundle = "$ENV{HOME}/.vim/bundle/Vundle.vim";
make_path $vundle;
if (is_folder_empty $vundle) {
    system "git clone https://github.com/VundleVim/Vundle.vim.git $vundle";

    say "Installing bundles";
    system "vim +PluginInstall +qall";
}
