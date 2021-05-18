![research](https://pantheonscience.github.io/states/research.png)

# Pantheon Workflow Template v <noop name="version">1.2</noop>

A repository template for the Pantheon project workflows.
<p align="center">
    <img width="750" src="doc/workflow.png"/>
</p>
<p align="center">Diagram of the workflow in this example.</p>

A repository for examples using `ExaWind-AMRWind` and `Ascent` for creation of `Cinema` databases.

Instructions for building Exawind-AMRWind with Ascent can be found [here](https://github.com/Alpine-DAV/ascent/wiki/Building-AMRWind). These instructions were adapted into custom Spack package files.

The embedded example run is derived from a regression test, and can be found in the Alpine-DAV AMRWind source [here](https://github.com/Alpine-DAV/amr-wind/tree/ascent/test/test_files/abl_godunov).

<p align="center">
<table>
<tr>
<td><img width="200" src="validate/data/pantheon.cdb/0.0/0.0_90.0_pantheon.cdb.png"</td>
<td><img width="200" src="validate/data/pantheon.cdb/2.0/0.0_90.0_pantheon.cdb.png"</td>
<td><img width="200" src="validate/data/pantheon.cdb/5.0/0.0_90.0_pantheon.cdb.png"</td>
</tr>
</table>
</p>
<p align="center">Images from the resulting Cinema database (used to validate run)</p>

The workflow does the following:

- Creates a [Pantheon](http://pantheonscience.org/) environment and build location
- Clones a specific commit of [Spack](https://github.com/spack/spack)
- Uses `spack` to build [ExaWind-AMRWind](https://amr-wind.readthedocs.io/en/latest/)
- Runs a regression test, and produces a `Cinema` database in-situ with [Ascent](https://ascent.readthedocs.io/en/latest/)
- Installs a `Cinema` viewer, then packages up the results
- Validates the `Cinema` database

## Using this repository

The main loop is in the `execute` script. From there, you can see the steps taken, and can follow the scripts to create your own examples.

## Edit these files
| file | what to do |
|------|---------|
|`bootstrap.env` | edit the `COMPUTE_ALLOCATION` and `PANTHEON_BASE_PATH` to match your environment |
|`pantheon/pantheon.yaml` | edit this to reflect the information from Pantheon for your workflow. If you do not have Pantheon settings information, you may leave this file unedited. |
|`postprocess/postprocess.sh` | edit this to call your postprocessing scripts, if you have them. |
|`readme.md` | edit the top line to indicate what type of Pantheon pipeline this is. |
|`run/run.sh` | edit this to copy files as needed by the application. |
|`run/submit.sh` | edit this to properly submit your job. |
|`setup/install-deps.sh` | edit to install dependencies |
|`setup/install-app.sh` | edit to install application  |


## DO NOT edit these files

1. `pantheon/pantheon.env`
