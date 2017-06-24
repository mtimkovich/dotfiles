#!/usr/bin/env python
import argparse
import os
import subprocess
import time

DOTS = [
    '.vimrc',
    '.zshrc',
    '.bashrc',
    'bin',
]

parser = argparse.ArgumentParser('dotfile installer')
parser.add_argument('-i', '--interactive', action='store_true',
                    help='prompt before overriding (recommended)')
parser.add_argument('-v', '--verbose', action='store_true',
                    help='verbose output')
parser.add_argument('--vundle', action='store_true',
                    help='install vundle plugins')
args = parser.parse_args()


def confirm(prompt):
    return raw_input(prompt + ' [Y/n] ').lower() == 'y'


def symlink_dotfiles():
    ts = str(int(time.time()))

    for fn in DOTS:
        old = os.path.join(os.getcwd(), fn)
        link = os.path.join(os.environ['HOME'], fn)

        if os.path.exists(link) and not os.path.islink(link):
            if args.interactive and confirm(fn + ' exists, override?'):
                os.rename(link, link + '.bak.' + ts)
            else:
                continue

        if args.verbose:
            print old, '->', link

        # Ha
        if os.path.islink(link):
            os.unlink(link)

        os.symlink(old, link)


def install_vundle():
    vundle = os.path.join(os.environ['HOME'], '.vim/bundle/Vundle.vim')
    subprocess.call('git clone https://github.com/VundleVim/Vundle.vim.git ' + vundle, shell=True)

    if args.verbose:
        print "Installing bundles"
    subprocess.call('vim +PluginInstall +qall', shell=True)

symlink_dotfiles()

if args.vundle:
    install_vundle()
