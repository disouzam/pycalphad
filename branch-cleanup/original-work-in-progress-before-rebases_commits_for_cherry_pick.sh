#!/usr/bin/env bash
#git cherry-pick -x --no-commit 27367fba2 #Adding a description in `1_Phase_Diagrams/index.rst`
#git cherry-pick -x --no-commit 58f6d55d1 #Added description of the content covered in `2_Computing_Properties/index.rst` section
#git cherry-pick -x --no-commit 2cf03d806 #Added description of the content covered in `3_High_Throughput_Analysis/index.rst` section
#git cherry-pick -x --no-commit 528afcdfe #Added description of the content covered in Metastability and Reference states section
#git cherry-pick -x --no-commit 599bff5b7 #Reordering sections of example `Phase_Diagrams/1_BinaryExamples.ipynb`
#git cherry-pick -x --no-commit ca214501d #Indication of potential changes in `Phase_Diagrams/1_BinaryExamples.ipynb`
#git cherry-pick -x --no-commit e0c406ea2 #First test of splitting one examples (`1_BinaryExamples.ipynb`)
#git cherry-pick -x --no-commit f3e7526cf #Fixed sections in 1_BinaryExamples.ipynb that describe plots of Al-Fe and Nb-Re systems
#git cherry-pick -x --no-commit 06346e9d2 #Trying to cross-link Binary Examples to binplot and tdb files explanation documents
#git cherry-pick -x --no-commit bc03878eb #List of open issues to explore
#git cherry-pick -x --no-commit b6ff07ec1 #Added some notes about issues selected by `Luís Otávio` and `Dickson Souza` as being interesting to start collaborating with `pycalphad`
#git cherry-pick -x --no-commit f0e515160 #Added configuration to produce HTML reports of `coverage.py` using `pytest-cov` plugin, already installed
#git cherry-pick -x --no-commit 62cd16b33 #Configuration to debug files directly through `pycalphad` source code
#git cherry-pick -x --no-commit 2c47de8f4 #`FeC` and `FeO` databases from `Hallsted, 2025`
#git cherry-pick -x --no-commit 4302a1a69 #`Fe-C` and `Fe-O` notebooks for understanding `pycalphad` internals
#git cherry-pick -x --no-commit 0dab6c434 #Simple code to test debugging functionalities in `pycalphad` repository
#git cherry-pick -x --no-commit 8b6c63e90 #TODO to add error handling in database.py
#git cherry-pick -x --no-commit 3936d2f76 #marimo's notebook to play with xarray along video https://www.youtube.com/watch?v=ww4EYv20Ucw
#git cherry-pick -x --no-commit 8dafe0977 #New cells on notebook created to practice xarray
#git cherry-pick -x --no-commit eee36ef24 #Installed `cosmic-ray` as a dev dependency to run mutation testing
#git cherry-pick -x --no-commit 3bc456d59 #Initialization of baseline for mutation testing and configuration
#git cherry-pick -x --no-commit 2c6ef07a6 #Modified `cosmic-ray` to be an editable source
#git cherry-pick -x --no-commit 440659a4c #Deleted notebook created to practice using xarray data type
#git cherry-pick -x --no-commit 0b870e7e6 #Proposal to move tests out of folder pycalphad to keep them separate and make mutation testing easier to configure
#git cherry-pick -x --no-commit b1c7f51b9 #Removed excluded modules after tests were extracted from package folder
#git cherry-pick -x --no-commit 5997cbaa4 #Reinitialized `cosmic-ray` database
#git cherry-pick -x --no-commit 9e1b99fe8 #Modified mutation configuration to adjust for tests folder path change
#git cherry-pick -x --no-commit d9d42655f #New shell script to prepare for mutation testing
#git cherry-pick -x --no-commit 7dc482c2d #Modified configuration of `cosmic-ray` to run 2 workers
#git cherry-pick -x --no-commit 427aa2305 #Modifications of each worker's folder to create a virtual environment
#git cherry-pick -x --no-commit d69074d7c #Modified script to generate a arbitrary number of worker's folders
#git cherry-pick -x --no-commit 82697ef7c #Configuration of 10 workers for mutation testing
#git cherry-pick -x --no-commit f5b143852 #Added custom script with a defined port for each worker
#git cherry-pick -x --no-commit 114788064 #Added another folder to exclusion list of folders to be copied to worker's folder
#git cherry-pick -x --no-commit 1b8513dca #Fixed cosmic-ray configuration for 10 workers
#git cherry-pick -x --no-commit 3e12143d7 #Partial parallel execution of cosmic-ray with 10 workers
#git cherry-pick -x --no-commit 932eec9d1 #Moved `cosmic-ray` files to a dedicated folder
#git cherry-pick -x --no-commit 30c04e017 #Renamed configuration file and cosmic-ray database file to enable multiple configurations in the repository
#git cherry-pick -x --no-commit 8a6d31ea4 #Renamed shell script from `automation/prepare-mutation-testing.sh` to `mutation_testing/prepare-worker-folders.sh` to better reflect its purpose in setting up worker folders for mutation testing.
#git cherry-pick -x --no-commit c40e9ddda #Added script to run 10 workers
#git cherry-pick -x --no-commit 597079add #Script for initialization of database for 10-workers
#git cherry-pick -x --no-commit 165354951 #Added configurations to run just 2 workers - for troubleshooting and collaboration with cosmic-ray
#git cherry-pick -x --no-commit 6893114b3 #Reinitialized database for mutation testing using 10 workers
#git cherry-pick -x --no-commit 2c1daef93 #Added new task to reinstall cosmic-ray from local sources
#git cherry-pick -x --no-commit e09dc88c9 #Added another exclusion to the files copied to worker's folder
#git cherry-pick -x --no-commit 9fc48aa88 #Added a new launch configuration to debug cosmic-ray execution
#git cherry-pick -x --no-commit 27f64a249 #Adjustments in script to prepare worker folders, removing separate virtual environment creation per worker
#git cherry-pick -x --no-commit e6377ab4b #Draft configuration to issue a HTML report per test run
#git cherry-pick -x --no-commit 29d21a878 #Configuration that adds a timestamp to HTML report file using conftest.py customization
#git cherry-pick -x --no-commit a59cf692c #Temporarily modification of `mutation_testing/cosmic-ray-02-workers.toml` to run just one worker for easier setup for debugging
#git cherry-pick -x --no-commit 8d09becbc #Added a new configuration to debug Cosmic-Ray http worker
#git cherry-pick -x --no-commit 7b10cb829 #Enabled debugging of third-party code while debugging cosmic-ray executions
#git cherry-pick -x --no-commit bbfbf56d1 #Removed duplicated dependencies among main groupd and dev group
#git cherry-pick -x --no-commit e654025b1 #Added new configuration to debug pytest execution
#git cherry-pick -x --no-commit 789906833 #Added argument stopOnEntry for all launch configurations in `launch.json`
#git cherry-pick -x --no-commit eee51e58d #Added root `__pycache__` folder from the list of exclusions in `prepare-worker-folders.sh`
#git cherry-pick -x --no-commit 6a2c09a36 #Set stopOnEntry to true for launch configurations that debug cosmic-ray execution and worker instance
#git cherry-pick -x --no-commit cccc85302 #Customization of report name by adding hard-coded job id (generated by cosmic-ray) and time stamp
#git cherry-pick -x --no-commit 0fe555ac3 #Removed hard-coded job id and adjusted report name
#git cherry-pick -x --no-commit 5d6829b74 #Script to time execution of pytest over entire suite
#git cherry-pick -x --no-commit bec194804 #Adjusted timeout from 30 seconds to 15 seconds
#git cherry-pick -x --no-commit cf449a8de #Script to generate summary report of mutations for 02 workers
#git cherry-pick -x --no-commit c1c35afc3 #Updated configurations for 10 paralell workers
#git cherry-pick -x --no-commit 28a3f7e8a #Restore justMyCode and stonOnEntry parameters to debug cosmic-ray execution and workers
#git cherry-pick -x --no-commit a1c38063c #Added URL for port 9005 that was missing for a true 10-worker setup
#git cherry-pick -x --no-commit b48513d0e #Added script to get a summary of mutation testing for 10 workers and inserted date for equivalent script for 2 workers
#git cherry-pick -x --no-commit e1c66b050 #Fixed number of workers in `mutation_testing/cosmic-ray-02-workers.toml`
#git cherry-pick -x --no-commit c635b1e32 #Modified `conftest.py` to consider `pytest` execution without report configuration
#git cherry-pick -x --no-commit d2db46593 #Added a new task to debug pytest execution without report generation
#git cherry-pick -x --no-commit 4bde23661 #Removed configuration norecursedirs
#git cherry-pick -x --no-commit 5a00d6178 #Script to initialize database for local distribution
#git cherry-pick -x --no-commit 0e8ba618b #Initialized database for local distributor
#git cherry-pick -x --no-commit ba5626d63 #Script to launch local distributor
#git cherry-pick -x --no-commit 5f02ec2a0 #Shell script to get report for local distributor
#git cherry-pick -x --no-commit a4d479d58 #New launch configuration to debug Cosmic Ray for local distributor
#git cherry-pick -x --no-commit dd5745744 #Modified `justMyCode` and `stopOnEntry` settings for configuration `Debug Cosmic-Ray execution - Local distributor`
#git cherry-pick -x --no-commit 844b766d8 #Added a dedicated TOML configuration to run Cosmic Ray for local distributor
#git cherry-pick -x --no-commit 81d4b2655 #Mutation test reports for 10 workers - Partial evaluation
#git cherry-pick -x --no-commit fe8e60384 #Mutation results collected using shell script `mutation_testing/cosmic-ray-02-workers-reports.sh`
#git cherry-pick -x --no-commit e19a1845f #Databases of cosmic-ray execution
#git cherry-pick -x --no-commit 7ad536c7c #Added operators to the list of excluded ones based on GitHub issue
#git cherry-pick -x --no-commit 154706501 #Use cosmic-ray-local-distributor.toml to initialize local distributor (instead of base config)
#git cherry-pick -x --no-commit bb95fc750 #Moved configuration files and shell scripts to dedicated folders to help with maintenance and organization
#git cherry-pick -x --no-commit 167c28b8c #Adjusted path to Cosmic Ray configuration and database files
#git cherry-pick -x --no-commit 359f834f9 #Renamed all Cosmic Ray files to have same name and the differentiation be the folder
#git cherry-pick -x --no-commit cbc7ee544 #Adjusted all paths and file names to run Cosmic Ray for local distributor and for  2 and 10 workers
#git cherry-pick -x --no-commit 09b0cff0f #First version of `run_pytest_and_capture.py`
#git cherry-pick -x --no-commit f705f1bdc #Modification to add timestamp to all output lines
#git cherry-pick -x --no-commit 92d3c7c71 #Debug programmatically pytest execution
#git cherry-pick -x --no-commit 492b4c4c9 #Revert "Modification to add timestamp to all output lines"
#git cherry-pick -x --no-commit 7b9c3653a #Added function to read ini options from pyproject.toml
#git cherry-pick -x --no-commit f07cfa0d8 #Fixed formatting of session output
#git cherry-pick -x --no-commit 594ffc32e #Added another launch configuration to debug pytest execution via run_pytest_and_capture.py with args
#git cherry-pick -x --no-commit 2eec4c63e #Parse args from command line and passed them ipsis literis from pytest
#git cherry-pick -x --no-commit d229ac670 #Added a new parameter to be unique for `run_pytest_and_capture.py` and `conftest.py` and be uused as a reference time stamp for file name composition
#git cherry-pick -x --no-commit 71dc1f89a #Adjusting session file name to use the same start time stamp as the one used in report file
#git cherry-pick -x --no-commit 70ba3d52e #Added workspace file (for VS Code) to deal with PyCalphad and Cosmic-Ray in same instance
#git cherry-pick -x --no-commit d8f29eb59 #Adjusted timeout to match the total length of a typical test execution (75 seconds) and have a small margin to cope with longer loops
#git cherry-pick -x --no-commit 7192e8fb4 #Set exit code in run_pytest_and_capture to correctly classify mutants
#git cherry-pick -x --no-commit e722125bd #Added configuration to save HTML reports for each mutant
#git cherry-pick -x --no-commit 0634d1619 #Modified verbosity and fixed path to Local_distributor folder in configuration to debug Cosmic Ray in launch.json
#git cherry-pick -x --no-commit a02fed31e #Hide pytest ini options from session output
#git cherry-pick -x --no-commit 2fa835019 #Added `--job-id` as a parameter to pytest
#git cherry-pick -x --no-commit 68fb320db #Retrieval of pytest configuration inside main script that runs pytest
#git cherry-pick -x --no-commit bb56e55cf #Added condition for missing job ids
#git cherry-pick -x --no-commit 9dfd1df20 #Removed extra print statement in conftest that ends up in session output
#git cherry-pick -x --no-commit c24bdf61c #Modified Cosmic Ray configuration for 2 and 10 workers
#git cherry-pick -x --no-commit 3b262542b #Increased timeout from 15 seconds (wrong value) to 90 seconds (20% higher than the normal execution of test suite
#git cherry-pick -x --no-commit 0bf9d4aef #Restarted / reinitialized database for 10 workers setup
#git cherry-pick -x --no-commit f9fd41d90 #Adjusted source of Cosmic-Ray to enable different clones in the same machine without disturbing pycalphad mutation testing
#git cherry-pick -x --no-commit 71b588919 #Database after ~50% of mutants tests but with several errors in Cosmic Ray workers
#git cherry-pick -x --no-commit 00aa93a59 #Converted configuration of `mutation_testing/10_workers/cosmic_ray.toml` to use a single distributor instead of 10 paralell http workers
#git cherry-pick -x --no-commit 3e8a2aa2e #Short-lived execution running in a single distributor
#git cherry-pick -x --no-commit d546bae16 #Restarted database for local distributor
#git cherry-pick -x --no-commit 6d974b601 #Partial results of mutation testing - around 6%
#git cherry-pick -x --no-commit 5c8880b90 #Partial update of local distributor with 3574 mutants already checked, with 1101 surviving mutants
#git cherry-pick -x --no-commit 232bf772a #Partial update of local distributor with 15433 mutants already checked, with 4748 surviving mutants
#git cherry-pick -x --no-commit 97a1c2e91 #Set verbosity of local distributor launcher of Cosmic Ray to be DEBUG
#git cherry-pick -x --no-commit 495a54963 #Updated source path to Cosmic Ray to use a dedicated version of Cosmic Ray for PyCalphad
#git cherry-pick -x --no-commit 48420adda #Partial update of local distributor with 15483 mutants already checked, with 4765 surviving mutants
#git cherry-pick -x --no-commit a9914eaba #Script to monitor status of mutation testing periodically and emit a sound when mutation testing stalls
#git cherry-pick -x --no-commit 7c44114fc #Removed Cosmic-Ray reports
