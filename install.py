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
args = parser.parse_args()


def confirm(prompt):
    return input(f'{prompt} [Y/n] ').lower() == 'y'


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
            print(old, '->', link)

        # Ha
        if os.path.islink(link):
            os.unlink(link)

        os.symlink(old, link)

# These are the dotfiles to be symlinked.
dots = [
    '.bashrc',
    '.config',
    '.tmux.conf',
    '.vimrc',
    'bin',
]

symlink_dotfiles(dots)
