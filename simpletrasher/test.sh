#!/bin/sh

#  test.sh
#  simpletrasher
#
#  Created by Rasmus Sten on 1/30/13.
#  Copyright (c) 2013 Rasmus Sten. All rights reserved.
#

e="${TARGET_BUILD_DIR}/${TARGET_NAME}"

# test usage
$e && exit 42

# basic test
touch a b c
$e a b c

for f in a b c ; do if [ -f $f ] ; then echo "Error: $f not gone."; exit 1; fi; done

# test error
f=`mktemp -t foo`
$e non-existing-file-$$ && exit 42
[ -s $f ] && exit 42
rm $f

echo "Test OK." >&2





