"""Subprocess for running CLI commands."""
import subprocess


def apt(*packages):
    """Run apt to install."""
    pkg_list = ' '.join(packages)
    run_command = "sudo apt install -y pkg_list".format(pkg_list)
    print("-- Running --")
    print(run_command)
    subprocess.call(run_command)
