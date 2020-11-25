#!/usr/bin/env python
import argparse
import os
import subprocess
import time

parser = argparse.ArgumentParser('dotfile installer')
parser.add_argument('-i', '--interactive', action='store_true',
                    help='prompt before overriding (recommended)')
parser.add_argument('-v', '--verbose', action='store_true',
                    help='verbose output')
parser.add_argument('--vundle', action='store_true',
                    help='install vundle plugins')
args = parser.parse_args()


def confirm(prompt):
    return input(prompt + ' [Y/n] ').lower() == 'y'


def symlink_dotfiles(dots):
    ts = str(int(time.time()))

    for fn in dots:
        old = os.path.join(os.getcwd(), fn)
        link = os.path.join(os.environ['HOME'], fn)

        if os.path.exists(link) and not os.path.islink(link):
            if args.interactive and not confirm(fn + ' exists, override?'):
                continue

            os.rename(link, link + '.bak.' + ts)

        if args.verbose:
            print old, '->', link

        # Ha
        if os.path.islink(link):
            os.unlink(link)

        os.symlink(old, link)


def install_vundle():
    vundle = os.path.join(os.environ['HOME'], '.vim', 'bundle', 'Vundle.vim')

    # check if the directory is empty
    if not os.path.isdir(vundle) or os.listdir(vundle):
        return

    subprocess.call(['git', 'clone', 'https://github.com/VundleVim/Vundle.vim.git', vundle])
    subprocess.call(['vim', '+PluginInstall', '+qall'])

# These are the dotfiles that will be symlinked
dots = [
    '.bashrc',
    '.config',
    '.vimrc',
    'bin',
]

symlink_dotfiles(dots)

if args.vundle:
    install_vundle()
