#!/usr/bin/env python
# done to share with a friend and demonstrate how python code is compact

def move(n, startPole, endPole):
    if n == 0:
        return
    intermediatePole = 6 - startPole - endPole
    move(n-1, startPole, intermediatePole)
    print("Move %d from %d to %d" % (n, startPole, endPole))
    move(n-1, intermediatePole, endPole);
    
move(5, 3, 1)

