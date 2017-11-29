#!/usr/bin/env python3
"""
Inverts the order of a graph file that is outputted by Terraform
"""


import argparse
import os
import re


def main():
    """main function"""
    parser = argparse.ArgumentParser()
    parser.add_argument('--file', action='store', dest='file', required=True)
    args = parser.parse_args()

    filepath = os.path.join("./", args.file)
    update_file(filepath)


def update_file(filepath):
    """update_file goes through andd updates the graph file"""
    with open(filepath, 'r+') as file:
        lines = file.readlines()
        file.seek(0)
        file.truncate()
        for line in lines:
            checked_line = line_checker(line)
            file.write(line.replace(line, checked_line))


def line_checker(line):
    """line_checker swaps dependencies"""
    if re.match("(.*)->(.*)", line):
        linesplit = line.split("->")
        return "\t\t" + linesplit[1].strip() + " -> " + linesplit[0].strip() + "\n"

    return line


if __name__ == "__main__":
    main()
