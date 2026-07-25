#!/usr/bin/env bash
#git cherry-pick -x --no-commit d83e291a2 #Adding a description in `1_Phase_Diagrams/index.rst`
#git cherry-pick -x --no-commit 5d366d7d4 #Added description of the content covered in `2_Computing_Properties/index.rst` section
#git cherry-pick -x --no-commit cbb3564ac #Added description of the content covered in `3_High_Throughput_Analysis/index.rst` section
#git cherry-pick -x --no-commit 425641bd9 #Added description of the content covered in Metastability and Reference states section
#git cherry-pick -x --no-commit 93cf1d168 #Reordering sections of example `Phase_Diagrams/1_BinaryExamples.ipynb`
#git cherry-pick -x --no-commit 64606b55f #Indication of potential changes in `Phase_Diagrams/1_BinaryExamples.ipynb`
#git cherry-pick -x --no-commit b9383bd82 #First test of splitting one examples (`1_BinaryExamples.ipynb`)
#git cherry-pick -x --no-commit db5aad27e #Fixed sections in 1_BinaryExamples.ipynb that describe plots of Al-Fe and Nb-Re systems
#git cherry-pick -x --no-commit baff5d6a9 #Trying to cross-link Binary Examples to binplot and tdb files explanation documents
#git cherry-pick -x --no-commit be22a38be #List of open issues to explore
#git cherry-pick -x --no-commit 7671aa1a5 #Added some notes about issues selected by `Luís Otávio` and `Dickson Souza` as being interesting to start collaborating with `pycalphad`
#git cherry-pick -x --no-commit a41207520 #Added configuration to produce HTML reports of `coverage.py` using `pytest-cov` plugin, already installed
#git cherry-pick -x --no-commit b7ee25372 #Configuration to debug files directly through `pycalphad` source code
#git cherry-pick -x --no-commit fcf2011b9 #`FeC` and `FeO` databases from `Hallsted, 2025`
#git cherry-pick -x --no-commit 8c9db21b3 #`Fe-C` and `Fe-O` notebooks for understanding `pycalphad` internals
#git cherry-pick -x --no-commit 6421d74b9 #Simple code to test debugging functionalities in `pycalphad` repository
#git cherry-pick -x --no-commit 4e0872bb4 #TODO to add error handling in database.py
#git cherry-pick -x --no-commit aabdf3ca4 #marimo's notebook to play with xarray along video https://www.youtube.com/watch?v=ww4EYv20Ucw
#git cherry-pick -x --no-commit 17876fbd9 #New cells on notebook created to practice xarray
#git cherry-pick -x --no-commit 86e0e753c #Installed `cosmic-ray` as a dev dependency to run mutation testing
#git cherry-pick -x --no-commit f67ce974a #Initialization of baseline for mutation testing and configuration
#git cherry-pick -x --no-commit 40ddfd0da #Modified `cosmic-ray` to be an editable source
#git cherry-pick -x --no-commit 729c326fb #Deleted notebook created to practice using xarray data type
#git cherry-pick -x --no-commit 0931b5ce7 #Proposal to move tests out of folder pycalphad to keep them separate and make mutation testing easier to configure
#git cherry-pick -x --no-commit 587fd0d7d #Removed excluded modules after tests were extracted from package folder
#git cherry-pick -x --no-commit 84cd4214d #Reinitialized `cosmic-ray` database
#git cherry-pick -x --no-commit 8aaf1d26c #Modified mutation configuration to adjust for tests folder path change
#git cherry-pick -x --no-commit 544eb6a2f #New shell script to prepare for mutation testing
#git cherry-pick -x --no-commit d8f6fe1eb #Modified configuration of `cosmic-ray` to run 2 workers
#git cherry-pick -x --no-commit 36e2d83a0 #Modifications of each worker's folder to create a virtual environment
#git cherry-pick -x --no-commit ea6480423 #Modified script to generate a arbitrary number of worker's folders
#git cherry-pick -x --no-commit 1b7727ebc #Configuration of 10 workers for mutation testing
#git cherry-pick -x --no-commit b567a4010 #Added custom script with a defined port for each worker
#git cherry-pick -x --no-commit b41372511 #Added another folder to exclusion list of folders to be copied to worker's folder
#git cherry-pick -x --no-commit 7185b4431 #Fixed cosmic-ray configuration for 10 workers
#git cherry-pick -x --no-commit fc6f17934 #Partial parallel execution of cosmic-ray with 10 workers
#git cherry-pick -x --no-commit 8eb43f9a7 #Moved `cosmic-ray` files to a dedicated folder
#git cherry-pick -x --no-commit 40fa790aa #Renamed configuration file and cosmic-ray database file to enable multiple configurations in the repository
#git cherry-pick -x --no-commit b40ca082c #Renamed shell script from `automation/prepare-mutation-testing.sh` to `mutation_testing/prepare-worker-folders.sh` to better reflect its purpose in setting up worker folders for mutation testing.
#git cherry-pick -x --no-commit 38a972d4d #Added script to run 10 workers
#git cherry-pick -x --no-commit 7c614a55d #Script for initialization of database for 10-workers
#git cherry-pick -x --no-commit 3970d92ba #Added configurations to run just 2 workers - for troubleshooting and collaboration with cosmic-ray
#git cherry-pick -x --no-commit 88215bdaa #Reinitialized database for mutation testing using 10 workers
#git cherry-pick -x --no-commit 920624198 #Added new task to reinstall cosmic-ray from local sources
#git cherry-pick -x --no-commit 13af84e48 #Added another exclusion to the files copied to worker's folder
#git cherry-pick -x --no-commit f49be928b #Added a new launch configuration to debug cosmic-ray execution
#git cherry-pick -x --no-commit 7fae83c63 #Adjustments in script to prepare worker folders, removing separate virtual environment creation per worker
#git cherry-pick -x --no-commit 3bd09742d #Draft configuration to issue a HTML report per test run
#git cherry-pick -x --no-commit 9bc362eb0 #Configuration that adds a timestamp to HTML report file using conftest.py customization
#git cherry-pick -x --no-commit 3e9d2f3e9 #Temporarily modification of `mutation_testing/cosmic-ray-02-workers.toml` to run just one worker for easier setup for debugging
#git cherry-pick -x --no-commit a69d362e8 #Added a new configuration to debug Cosmic-Ray http worker
#git cherry-pick -x --no-commit b73c82cc7 #Enabled debugging of third-party code while debugging cosmic-ray executions
#git cherry-pick -x --no-commit 6019c7d6c #Removed duplicated dependencies among main groupd and dev group
#git cherry-pick -x --no-commit dd853da03 #Added new configuration to debug pytest execution
#git cherry-pick -x --no-commit 5a5fd27e7 #Added argument stopOnEntry for all launch configurations in `launch.json`
#git cherry-pick -x --no-commit 0680a386b #Added root `__pycache__` folder from the list of exclusions in `prepare-worker-folders.sh`
#git cherry-pick -x --no-commit b907b59e6 #Set stopOnEntry to true for launch configurations that debug cosmic-ray execution and worker instance
#git cherry-pick -x --no-commit dc93b01fb #Customization of report name by adding hard-coded job id (generated by cosmic-ray) and time stamp
#git cherry-pick -x --no-commit a6caa7ca0 #Removed hard-coded job id and adjusted report name
#git cherry-pick -x --no-commit 5b76960c7 #Script to time execution of pytest over entire suite
#git cherry-pick -x --no-commit 8d103b3ec #Adjusted timeout from 30 seconds to 15 seconds
#git cherry-pick -x --no-commit 431f5a466 #Script to generate summary report of mutations for 02 workers
#git cherry-pick -x --no-commit fd776bf03 #Updated configurations for 10 paralell workers
#git cherry-pick -x --no-commit 62267965c #Restore justMyCode and stonOnEntry parameters to debug cosmic-ray execution and workers
#git cherry-pick -x --no-commit 203669112 #Added URL for port 9005 that was missing for a true 10-worker setup
#git cherry-pick -x --no-commit c460cf90f #Added script to get a summary of mutation testing for 10 workers and inserted date for equivalent script for 2 workers
#git cherry-pick -x --no-commit 00b05c963 #Fixed number of workers in `mutation_testing/cosmic-ray-02-workers.toml`
#git cherry-pick -x --no-commit ba1d14f8f #Modified `conftest.py` to consider `pytest` execution without report configuration
#git cherry-pick -x --no-commit 2badf64b3 #Added a new task to debug pytest execution without report generation
#git cherry-pick -x --no-commit 3b4da9207 #Removed configuration norecursedirs
#git cherry-pick -x --no-commit 2b7d1058b #Script to initialize database for local distribution
#git cherry-pick -x --no-commit fd89c5dcd #Initialized database for local distributor
#git cherry-pick -x --no-commit 5e54d2493 #Script to launch local distributor
#git cherry-pick -x --no-commit e5a0aa310 #Shell script to get report for local distributor
#git cherry-pick -x --no-commit 96d9cbfeb #New launch configuration to debug Cosmic Ray for local distributor
#git cherry-pick -x --no-commit affedead3 #Modified `justMyCode` and `stopOnEntry` settings for configuration `Debug Cosmic-Ray execution - Local distributor`
#git cherry-pick -x --no-commit ace149ca6 #Added a dedicated TOML configuration to run Cosmic Ray for local distributor
#git cherry-pick -x --no-commit 9c0d9f85f #Databases of cosmic-ray execution
