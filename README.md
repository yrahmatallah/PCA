
# Principal Component Analysis Using R in Jupyter Notebook

## Objective
Principal Component Analysis (PCA) is a dimensionality reduction method, often used to create visualizations of high-dimensional data such as gene expression or DNA methylation datasets with thousands of features (e.g. genes). It projects the data into a low-dimensional space while minimizing the sum of squared distances from the original data points to their projections. The primary objective of this module is to demonstrate the use of PCA to visualize high-dimensional gene expression data by creating a two-dimensional scatter plot that shows sample distribution in a 2D space representing the first two principal components. A preprocessed gene expression dataset generated from an Affymetrix microarray platform is provided with this module. The analysis is performed using R code and the same R code within a Jupyter Notebook environment.

## Setup and Installation
The module was conducted using R version 4.1.2 in a Jupyter Notebook with an R kernel. The associated Anaconda environment for the Jupyter Notebook is provided in file environment.yaml. If you use R, ensure the proper version is installed on your machine along with the required libraries. 

If you prefer to work with Jupyter Notebook, import the yaml environment file into your anaconda and install R packages as shown above. Alternatively, you can create your own conda environment. For example:
```
conda create -n r_env r-base=4.1.2 r-essentials -y
```
After installing a conda environment, install R kernel. One possible way is to activate the environment and istall from R: 
```
conda activate r_env
R -e "install.packages('IRkernel'); IRkernel::installspec(user = FALSE)"
```
