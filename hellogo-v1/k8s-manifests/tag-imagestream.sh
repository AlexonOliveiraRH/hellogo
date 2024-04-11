#!/bin/bash
for i in 1 2 3; do oc tag hellogo hellogo:v$i -n demo; done
