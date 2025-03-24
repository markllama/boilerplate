#!/usr/bin/env python
#
"""
What is this program about?
"""
#
#
import argparse
import sys


# ==============================================================
# 
# ==============================================================
def main(opt):
    """
    TBD
    """


# ==============================================================
#
# ==============================================================
def parse_args():
    """
    Parse Command-line Options
    """
    parser = argparse.ArgumentParser()
    parser.add_argument('--debug', '-d', action=argparse.BooleanOptionalAction)
    parser.add_argument('--verbose', '-v', action=argparse.BooleanOptionalAction)

    # Add more options
    return parser.parse_args()

def messages(opts):

    debug_switch = opts.debug
    verbose_switch = opts.verbose

    debug = lambda message : debug_switch and print(message)
    verbose = lambda message : verbose_switch and print(message)

    return (verbose, debug)

if __name__ == "__main__":

    opts = parse_args()

    (verbose, debug) = messages(opts)

    verbose("this is a verbose message")
    debug("This is a debug message")

    
