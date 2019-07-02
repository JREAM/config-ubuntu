#!/usr/bin/python
"""Import modules."""
from __future__ import print_function
import sys
import subprocess
import imp
from scripts.common import apt

try:
    import tableprint
    from colorama import Fore, Style
except ImportError:
    print("Please run: pip install -r requirements.txt")
    sys.exit()
    pass

DEPS = ['tableprint', 'colorama']
PACKAGES = [
    ['DART', 'dart'],
    ['GO', 'golang'],
    ['RUBY', 'ruby'],
    ['PHP', 'php72', 'composer'],
    ['ENVS', 'pyenv', 'pipenv', 'nvm', 'rbenv'],
    ['DEVOPS', 'docker', 'kubectl', 'minikube'],
    ['SERVERS', 'nginx', 'apache2'],
    ['COMMON', 'dotfiles', 'utils'],
]


def install_check():
    """IMPORTANT: Colorama is possibly not installed here, do not use it."""
    found = []
    try:
        for d in DEPS:
            if imp.find_module(d):
                found.append(d)
    except ImportError:
        pass

        if len(DEPS) != len(found):
            print("------------------------------------------------")
            print("[!] Stop! The following dependencies are needed:")
            print("------------------------------------------------")
            missing = set(DEPS) - set(found)
            for m in missing:
                print("- %s" % m)

            run_pip = input(
                "Would you like to Run PIP Install? [Y/n]: ").lower()
            if run_pip.startswith('n'):
                sys.exit('Exiting...')
            else:
                dependency_string = " ".join(DEPS)
                try:
                    print(subprocess.check_output([
                        "pip install {0}".format(dependency_string)],
                        shell=True
                    ))
                    sys.exit(
                        "[+] Success! Re-run this script to start installing.")
                except subprocess.CalledProcessError as e:
                    sys.exit(
                        '[!] Failed. Please ensure PIP is working. %s' % str(e.output))


def menu():
    """Display the Main menu display w/options."""
    total_sections = len(PACKAGES)
    max_str = 0
    for i in range(0, total_sections):
        output = PACKAGES[i][0] + ' | '
        PACKAGES[i].pop(0)
        output += '  '.join(PACKAGES[i])
        if len(output) > max_str:
            max_str = len(output)
        print(output)

    print('-' * max_str)
    command = input('Enter packages: ')
    """Pass array."""
    run_command(command.split(' '))


def run_command(*packages):
    """Run a command."""
    for pkg in packages:
        if pkg not in PACKAGES:
            print("Package not found: %s".format(pkg))
            sys.exit()

    """Install multiple packages."""
    apt(packages.join(' '))


def start():
    """I Forgot."""
    subprocess.call(["echo", "What we do in this life echoes in eternity"])
    menu()


if __name__ == '__main__':
    install_check()
    start()
