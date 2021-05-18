# Copyright 2013-2021 Lawrence Livermore National Security, LLC and other
# Spack Project Developers. See the top-level COPYRIGHT file for details.
#
# SPDX-License-Identifier: (Apache-2.0 OR MIT)

from spack import *
from spack.pkg.builtin.amr_wind import AmrWind

class AmrWind(AmrWind):
    git      = "https://github.com/Alpine-DAV/amr-wind.git"
    version('ascent', branch='ascent', submodules=True)   
 
    # draft of changes needed to build amr-wind+ascent
    variant('ascent', default=False,
            description='Build amr-wind coupled with ascent')
    depends_on('ascent', when='+ascent')

    def cmake_args(self):
        # Grab cmake args from builtin warpx package
        args = super(AmrWind, self).cmake_args()

        if '+ascent' in self.spec:
            args += [
                self.define('AMR_WIND_ENABLE_ASCENT', True),
                self.define('ASCENT_DIR',self.spec['ascent'].prefix)
            ]

        return args
