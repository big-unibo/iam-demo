# Describing and Assessing Cubes Through Intentional Analytics

[![build](https://github.com/w4bo/iam-demo/actions/workflows/build.yml/badge.svg?branch=master)](https://github.com/w4bo/iam-demo/actions/workflows/build.yml)

Demo presented at EDBT 2023
- Francia, Matteo, et al. "Describing and Assessing Cubes Through Intentional Analytics." **Proceedings 26th International Conference on Extending Database Technology (EDBT).** 2023.

This demos showcases the following research papers:
- Francia, Matteo, et al. "Suggesting assess queries for interactive analysis of multidimensional data." **IEEE Transactions on Knowledge and Data Engineering (2022)**. DOI: https://doi.org/10.1109/TKDE.2022.3171516
- Francia, Matteo, et al. "Enhancing cubes with models to describe multidimensional data." **Information Systems Frontiers (2022)**: 31-48. DOI: https://doi.org/10.1007/s10796-021-10147-3
- Francia, Matteo, et al. "Assess queries for interactive analysis of data cubes." **24th International Conference on Extending Database Technology (EDBT).** 2021. URL: https://openproceedings.org/2021/conf/edbt/p41.pdf
- Chédin, Antoine, et al. "The tell-tale cube." **European Conference on Advances in Databases and Information Systems (ADBIS)**. Springer, Cham, 2020. DOI: https://doi.org/10.1007/978-3-030-54832-2_16


## Running the tests

This repository allows the user to:
1. download the necessary datasets;
2. bring up a Docker container with Oracle 11g;
3. load the datasets into Oracle;
4. run the tests.

Running the experiments requires the following software to be installed:
- Docker
- Java 14
- Python 3.10.4

Once the software is installed, execute the following code to run the tests.

    chmod +x *.sh
    ./start.sh
    ./stop.sh

## Working and deploying the application

- Change the necessary files (see the ones copied by `init.sh`)
- Deploy the web application on Tomcat

        ./deploy.sh

- **Remember** to `chmod -R 777` the folders `scr/main/python` and the one containing the Oracle client 
- (If using Intellij) **Remember** to set the `LD_LIBRARY_PATH` in the run/debug configuration (see the `.env` file)
