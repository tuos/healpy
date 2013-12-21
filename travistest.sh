#!/bin/env bash
cd build/lib*/healpy/test/data
. get_wmap_maps.sh
cd ../..
py.test -v --doctest-modules
nosetests_returnvalue=$?
echo Run Cython extensions doctests
python run_doctest_cython.py
cython_doctest_returnvalue=$?
exit $(($nosetests_returnvalue + $cython_doctest_returnvalue))
