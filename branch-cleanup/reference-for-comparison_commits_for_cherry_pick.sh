#!/usr/bin/env bash
#git cherry-pick -x --no-commit a944e1eee #Updated copyright date and fixed a minor typo in `conf.py`
#git cherry-pick -x --no-commit e3b85df67 #Sorted dependencies and setup tools in ascending order before adding new dependencies
#git cherry-pick -x --no-commit a097840bf #Added `jupyter` as a dev dependency
#git cherry-pick -x --no-commit fa3d71995 #Added `nbconvert` as a dev dependency
#git cherry-pick -x --no-commit 2d2a32e76 #Added `nb-clean` as a dev dependency to clean unnecessary notebook and cell metadata
#git cherry-pick -x --no-commit 5300c90fc #Added `sphinx-autobuild` as a dev dependency to support live-reloading of documentation when working on it locally.
#git cherry-pick -x --no-commit db2886c69 #New tooling to support working on documentation locally
#git cherry-pick -x --no-commit f34e40595 #Update `ONBOARDING.rst` to provide instructions using `uv` instead of `conda`
#git cherry-pick -x --no-commit 1fe4380ad #Moved all databases in `examples` folder to a sub-folder `databases`
#git cherry-pick -x --no-commit 2039711ac #Organized notebooks in folders following Brandon's suggestion
#git cherry-pick -x --no-commit b993f4668 #Moved `nblink` files to new locations to better organize the documentation examples.
#git cherry-pick -x --no-commit 0b6f9ae8d #Modified menu definition for examples
#git cherry-pick -x --no-commit ff6e32902 #Adding numbering to example files in all folders to match TOC numbers
#git cherry-pick -x --no-commit ad25f96ac #Renamed folders of `examples` and `docs/examples` to match numbering of files in `website`
#git cherry-pick -x --no-commit eb21b65bc #Adjusted indexes to examples with new paths
#git cherry-pick -x --no-commit a18a28872 #Renamed nblink files to match referenced notebooks and updated each index
#git cherry-pick -x --no-commit 3a152c8cf #Removed whitespace in first header of `2_Metastability.ipynb`
#git cherry-pick -x --no-commit c58b9a28d #Fixed level of headers in `2_Metastability.ipynb` and `6_LegacyReferenceState.ipynb`
#git cherry-pick -x --no-commit d275ca65f #Added instructions to filter unintended warnings that clutter the documentation of pycalphad website and exposes individual paths of the user that last run the notebook
#git cherry-pick -x --no-commit 4ca980e84 #Removed empty line at start of a cell in `1_BinaryExamples.ipynb`
#git cherry-pick -x --no-commit 756cb044a #Improved output of results of molar ratios of linear combination calculated for Al-Cu-Y system
#git cherry-pick -x --no-commit 8dfd79745 #Split textual output from ternary plot to be clearer in Jupyter notebook and also in website
#git cherry-pick -x --no-commit efb3fae6c #Assign the return value of last statements in notebook cells to dummy variables (discard variable `_`) to avoid unnecessary outputs
#git cherry-pick -x --no-commit a84510dc9 #Split cell that printed site fractions and plotted Nb-Re Chi mixing enthalpy
#git cherry-pick -x --no-commit e6a819e71 #Renamed examples from `4_Metastability_Reference_Stages` folder to adjust numbering in sequencial way without skipping numbers
#git cherry-pick -x --no-commit 6dfbac975 #Removed folder `5_Advanced_Examples` and moved its content to other folders where examples have more fit
#git cherry-pick -x --no-commit e6efadb68 #Removed extra white space in first code cell of `2_TernaryExamples.ipynb`
#git cherry-pick -x --no-commit 427d2d969 #Moved comment of last line in cell of `4_EquilibriumWithOrdering.ipynb` to improve visualization in website
#git cherry-pick -x --no-commit 16ade4e0b #Updated all example notebooks using script `update_all_examples.sh`: Cleaning up cells's metadata
#git cherry-pick -x --no-commit 05b73703f #Updated all example notebooks using script `update_all_examples.sh`: cells were re-run automatically in the script, additional metadata update, execution counting update
#git cherry-pick -x --no-commit 5dbee01ff #Proposal of a minimal change in GitHub Action `.github/workflows/docs.yaml`to run script `update_all_examples.sh` during website build to avoid stale documentation
#git cherry-pick -x --no-commit d90e9ae20 #Adding a description in `1_Phase_Diagrams/index.rst`
#git cherry-pick -x --no-commit f2df437f9 #Added description of the content covered in `2_Computing_Properties/index.rst` section
#git cherry-pick -x --no-commit dd44241dd #Added description of the content covered in `3_High_Throughput_Analysis/index.rst` section
#git cherry-pick -x --no-commit b201449b7 #Added description of the content covered in Metastability and Reference states section
#git cherry-pick -x --no-commit 8b56f7672 #Reordering sections of example `Phase_Diagrams/1_BinaryExamples.ipynb`
#git cherry-pick -x --no-commit 118ebf00c #Indication of potential changes in `Phase_Diagrams/1_BinaryExamples.ipynb`
#git cherry-pick -x --no-commit c9e091bbc #First test of splitting one examples (`1_BinaryExamples.ipynb`)
#git cherry-pick -x --no-commit f33723b4d #Fixed sections in 1_BinaryExamples.ipynb that describe plots of Al-Fe and Nb-Re systems
#git cherry-pick -x --no-commit 3e253bf27 #Trying to cross-link Binary Examples to binplot and tdb files explanation documents
#git cherry-pick -x --no-commit b4b10a127 #List of open issues to explore
#git cherry-pick -x --no-commit a5c3344c7 #Added some notes about issues selected by `Luís Otávio` and `Dickson Souza` as being interesting to start collaborating with `pycalphad`
#git cherry-pick -x --no-commit d0cbd8738 #Added configuration to produce HTML reports of `coverage.py` using `pytest-cov` plugin, already installed
#git cherry-pick -x --no-commit 67e972900 #Configuration to debug files directly through `pycalphad` source code
#git cherry-pick -x --no-commit cdfd4c20e #`FeC` and `FeO` databases from `Hallsted, 2025`
#git cherry-pick -x --no-commit b0db9e185 #`Fe-C` and `Fe-O` notebooks for understanding `pycalphad` internals
#git cherry-pick -x --no-commit 8c57e6e64 #Simple code to test debugging functionalities in `pycalphad` repository
#git cherry-pick -x --no-commit f3c71af22 #TODO to add error handling in database.py
#git cherry-pick -x --no-commit 05fe6c925 #marimo's notebook to play with xarray along video https://www.youtube.com/watch?v=ww4EYv20Ucw
#git cherry-pick -x --no-commit 9058a70b4 #New cells on notebook created to practice xarray
#git cherry-pick -x --no-commit c7ac84a67 #Installed `cosmic-ray` as a dev dependency to run mutation testing
#git cherry-pick -x --no-commit a88459086 #Initialization of baseline for mutation testing and configuration
#git cherry-pick -x --no-commit 3ea948c09 #Modified `cosmic-ray` to be an editable source
#git cherry-pick -x --no-commit 3b4c7918a #Deleted notebook created to practice using xarray data type
#git cherry-pick -x --no-commit b4e75332f #Moved shell scripts to a separate folder `automation` to keep repository more organized
#git cherry-pick -x --no-commit 4197a4f95 #Proposal to move tests out of folder pycalphad to keep them separate and make mutation testing easier to configure
#git cherry-pick -x --no-commit 23711ff21 #Removed excluded modules after tests were extracted from package folder
#git cherry-pick -x --no-commit 5a9727683 #Reinitialized `cosmic-ray` database
#git cherry-pick -x --no-commit 625d56b11 #Modified mutation configuration to adjust for tests folder path change
#git cherry-pick -x --no-commit d1601f037 #New shell script to prepare for mutation testing
#git cherry-pick -x --no-commit b56ab81dd #Modified configuration of `cosmic-ray` to run 2 workers
#git cherry-pick -x --no-commit a18ba9e65 #Modifications of each worker's folder to create a virtual environment
#git cherry-pick -x --no-commit 844b3db1f #Modified script to generate a arbitrary number of worker's folders
#git cherry-pick -x --no-commit 02ea9eec6 #Configuration of 10 workers for mutation testing
#git cherry-pick -x --no-commit b76e40f0c #Added custom script with a defined port for each worker
#git cherry-pick -x --no-commit 28db80f31 #Added another folder to exclusion list of folders to be copied to worker's folder
#git cherry-pick -x --no-commit 52afb244e #Fixed cosmic-ray configuration for 10 workers
#git cherry-pick -x --no-commit 1e987caf4 #Partial parallel execution of cosmic-ray with 10 workers
#git cherry-pick -x --no-commit aa39bff66 #Moved `cosmic-ray` files to a dedicated folder
#git cherry-pick -x --no-commit feced95e2 #Renamed configuration file and cosmic-ray database file to enable multiple configurations in the repository
#git cherry-pick -x --no-commit 6af3ec5e7 #Renamed shell script from `automation/prepare-mutation-testing.sh` to `mutation_testing/prepare-worker-folders.sh` to better reflect its purpose in setting up worker folders for mutation testing.
#git cherry-pick -x --no-commit 6dc35abcf #Added script to run 10 workers
#git cherry-pick -x --no-commit 1fb2d6eb3 #Script for initialization of database for 10-workers
#git cherry-pick -x --no-commit e329ccd85 #Added configurations to run just 2 workers - for troubleshooting and collaboration with cosmic-ray
#git cherry-pick -x --no-commit 133b5a0be #Reinitialized database for mutation testing using 10 workers
#git cherry-pick -x --no-commit 928265d5e #Added new task to reinstall cosmic-ray from local sources
#git cherry-pick -x --no-commit 32315381c #Added another exclusion to the files copied to worker's folder
#git cherry-pick -x --no-commit e4a18e4bf #Added a new launch configuration to debug cosmic-ray execution
#git cherry-pick -x --no-commit d24624866 #Adjustments in script to prepare worker folders, removing separate virtual environment creation per worker
#git cherry-pick -x --no-commit 919294797 #Draft configuration to issue a HTML report per test run
#git cherry-pick -x --no-commit 5235212b3 #Configuration that adds a timestamp to HTML report file using conftest.py customization
#git cherry-pick -x --no-commit b97bc7f69 #Temporarily modification of `mutation_testing/cosmic-ray-02-workers.toml` to run just one worker for easier setup for debugging
#git cherry-pick -x --no-commit 48a14fced #Added a new configuration to debug Cosmic-Ray http worker
#git cherry-pick -x --no-commit ac575663a #Enabled debugging of third-party code while debugging cosmic-ray executions
#git cherry-pick -x --no-commit 5a7b2e4e2 #Removed duplicated dependencies among main groupd and dev group
#git cherry-pick -x --no-commit 5104f783e #Added new configuration to debug pytest execution
#git cherry-pick -x --no-commit a2a0da011 #Added argument stopOnEntry for all launch configurations in `launch.json`
#git cherry-pick -x --no-commit 0f238919b #Added root `__pycache__` folder from the list of exclusions in `prepare-worker-folders.sh`
#git cherry-pick -x --no-commit 7ffb8bc54 #Set stopOnEntry to true for launch configurations that debug cosmic-ray execution and worker instance
#git cherry-pick -x --no-commit 6af1e77d9 #Customization of report name by adding hard-coded job id (generated by cosmic-ray) and time stamp
#git cherry-pick -x --no-commit d23290928 #Removed hard-coded job id and adjusted report name
#git cherry-pick -x --no-commit 8c69c9e2f #Script to time execution of pytest over entire suite
#git cherry-pick -x --no-commit b79d3179a #Adjusted timeout from 30 seconds to 15 seconds
#git cherry-pick -x --no-commit 90aeefcb3 #Script to generate summary report of mutations for 02 workers
#git cherry-pick -x --no-commit 5ba015810 #Updated configurations for 10 paralell workers
#git cherry-pick -x --no-commit c32f24424 #Restore justMyCode and stonOnEntry parameters to debug cosmic-ray execution and workers
#git cherry-pick -x --no-commit fd280c7aa #Added URL for port 9005 that was missing for a true 10-worker setup
#git cherry-pick -x --no-commit cf073fd85 #Added script to get a summary of mutation testing for 10 workers and inserted date for equivalent script for 2 workers
#git cherry-pick -x --no-commit 004e3049a #Fixed number of workers in `mutation_testing/cosmic-ray-02-workers.toml`
#git cherry-pick -x --no-commit 9aaff4638 #Modified `conftest.py` to consider `pytest` execution without report configuration
#git cherry-pick -x --no-commit c0bd088ab #Added a new task to debug pytest execution without report generation
#git cherry-pick -x --no-commit 943c2790a #Mutation test reports for 10 workers - Partial evaluation
#git cherry-pick -x --no-commit 455513596 #Mutation results collected using shell script `mutation_testing/cosmic-ray-02-workers-reports.sh`
#git cherry-pick -x --no-commit e4c841cec #Databases of cosmic-ray execution
#git cherry-pick -x --no-commit 0b7fbb43a #Removed configuration norecursedirs
#git cherry-pick -x --no-commit 1aa9029fb #Script to initialize database for local distribution
#git cherry-pick -x --no-commit 12ad84d34 #Initialized database for local distributor
#git cherry-pick -x --no-commit 299a9ffd7 #Script to launch local distributor
#git cherry-pick -x --no-commit f842cc9db #Shell script to get report for local distributor
#git cherry-pick -x --no-commit a53478f17 #New launch configuration to debug Cosmic Ray for local distributor
#git cherry-pick -x --no-commit 087462e6f #Modified `justMyCode` and `stopOnEntry` settings for configuration `Debug Cosmic-Ray execution - Local distributor`
#git cherry-pick -x --no-commit 91f9b4d95 #Added a dedicated TOML configuration to run Cosmic Ray for local distributor
#git cherry-pick -x --no-commit 929ce59bf #Merge branch 'partial-results-of-10-workers-in-cosmic-ray' into temporary-merge
#git cherry-pick -x --no-commit 3d708e68e #Added operators to the list of excluded ones based on GitHub issue
#git cherry-pick -x --no-commit c99c7d9c4 #Use cosmic-ray-local-distributor.toml to initialize local distributor (instead of base config)
#git cherry-pick -x --no-commit e7a2b11ff #Moved configuration files and shell scripts to dedicated folders to help with maintenance and organization
#git cherry-pick -x --no-commit 14e28ff78 #Adjusted path to Cosmic Ray configuration and database files
#git cherry-pick -x --no-commit e17765f10 #Renamed all Cosmic Ray files to have same name and the differentiation be the folder
#git cherry-pick -x --no-commit ba5027b52 #Adjusted all paths and file names to run Cosmic Ray for local distributor and for  2 and 10 workers
#git cherry-pick -x --no-commit bf9c3b4c1 #Merge branch 'develop' into learning-activities-2026
#git cherry-pick -x --no-commit 3b62af84b #First version of `run_pytest_and_capture.py`
#git cherry-pick -x --no-commit 8d9427e7d #Modification to add timestamp to all output lines
#git cherry-pick -x --no-commit 4dbcc425e #Debug programmatically pytest execution
#git cherry-pick -x --no-commit 7c83f20f7 #Revert "Modification to add timestamp to all output lines"
#git cherry-pick -x --no-commit f043f25c3 #Added function to read ini options from pyproject.toml
#git cherry-pick -x --no-commit 382405346 #Fixed formatting of session output
#git cherry-pick -x --no-commit d1e572b97 #Added another launch configuration to debug pytest execution via run_pytest_and_capture.py with args
#git cherry-pick -x --no-commit aa509a0c7 #Parse args from command line and passed them ipsis literis from pytest
#git cherry-pick -x --no-commit c60b6e69a #Added a new parameter to be unique for `run_pytest_and_capture.py` and `conftest.py` and be uused as a reference time stamp for file name composition
#git cherry-pick -x --no-commit ab1f82910 #Adjusting session file name to use the same start time stamp as the one used in report file
#git cherry-pick -x --no-commit 20058efb2 #Added workspace file (for VS Code) to deal with PyCalphad and Cosmic-Ray in same instance
#git cherry-pick -x --no-commit 9d598cd49 #Adjusted timeout to match the total length of a typical test execution (75 seconds) and have a small margin to cope with longer loops
#git cherry-pick -x --no-commit 88e6b3ca4 #Set exit code in run_pytest_and_capture to correctly classify mutants
#git cherry-pick -x --no-commit 7bf3c7f58 #Added configuration to save HTML reports for each mutant
#git cherry-pick -x --no-commit a92fbb53d #Modified verbosity and fixed path to Local_distributor folder in configuration to debug Cosmic Ray in launch.json
#git cherry-pick -x --no-commit 97b5600cd #Hide pytest ini options from session output
#git cherry-pick -x --no-commit a38e6ec80 #Added `--job-id` as a parameter to pytest
#git cherry-pick -x --no-commit 5de476851 #Retrieval of pytest configuration inside main script that runs pytest
#git cherry-pick -x --no-commit e923e915e #Added condition for missing job ids
#git cherry-pick -x --no-commit 64e6ff47b #Removed extra print statement in conftest that ends up in session output
#git cherry-pick -x --no-commit 122e5abe9 #Modified Cosmic Ray configuration for 2 and 10 workers
#git cherry-pick -x --no-commit 2f47b18f3 #Increased timeout from 15 seconds (wrong value) to 90 seconds (20% higher than the normal execution of test suite
#git cherry-pick -x --no-commit e47888437 #Restarted / reinitialized database for 10 workers setup
#git cherry-pick -x --no-commit c18658ba1 #Adjusted source of Cosmic-Ray to enable different clones in the same machine without disturbing pycalphad mutation testing
#git cherry-pick -x --no-commit 7e10c80c8 #Database after ~50% of mutants tests but with several errors in Cosmic Ray workers
#git cherry-pick -x --no-commit 3b9a82c8b #Converted configuration of `mutation_testing/10_workers/cosmic_ray.toml` to use a single distributor instead of 10 paralell http workers
#git cherry-pick -x --no-commit ad70580d4 #Short-lived execution running in a single distributor
#git cherry-pick -x --no-commit 2dc388b2f #Restarted database for local distributor
#git cherry-pick -x --no-commit 4cdf20f11 #Partial results of mutation testing - around 6%
#git cherry-pick -x --no-commit 12e084b31 #Partial update of local distributor with 3574 mutants already checked, with 1101 surviving mutants
#git cherry-pick -x --no-commit 1fc3d6067 #Partial update of local distributor with 15433 mutants already checked, with 4748 surviving mutants
#git cherry-pick -x --no-commit 97791eda1 #Set verbosity of local distributor launcher of Cosmic Ray to be DEBUG
#git cherry-pick -x --no-commit 4953393c5 #Updated source path to Cosmic Ray to use a dedicated version of Cosmic Ray for PyCalphad
#git cherry-pick -x --no-commit f59aafa77 #Partial update of local distributor with 15483 mutants already checked, with 4765 surviving mutants
#git cherry-pick -x --no-commit f54ed50ee #Script to monitor status of mutation testing periodically and emit a sound when mutation testing stalls
#git cherry-pick -x --no-commit 73d49d7c6 #Removed Cosmic-Ray reports
