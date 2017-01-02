### Protocol step C.2.a. - Landmark Analysis ###

# This script will perform General Procrustes Analysis (GPA).

# Before beginning, add the package ‘shapes’ to R.

install.packages("shapes")
library(shapes)

# Specify landmark number (k), landmark dimensions (m), and number of samples (n); this example uses 17 landmarks.

k <- 17
m <- 2
n <- 640 

data <- read.in(reformat.txt,k,m)

GPA <- procGPA(data, reflect=TRUE)

# ‘Shapes’ provides a variety of outputs for users to explore the analysis products. Use "?procGPA"" to understand the output of this function.
                 
GPA$k
GPA$m
GPA$n
                 
# Procrustes mean shape. Note this is 'unit size' if complex Eigenanalysis used, but 'on the scale of the data' if iterative GPA is used.
                 
GPA$mshape

# Tangent shape (or size-and-shape) coordinates.
                 
GPA$tan

# k, x, m, x, and n array of full Procrustes rotated data.

GPA$rotated

# Columns are Eigenvectors (PCs) of the sample covariance Sv of tan.

GPA$pcar

# Square roots of eigenvalues of Sv using tan (sd's of PCs).

GPA$pcasd

# Percentage of variability explained by the PCs using tan.

GPA$percent

# The centroid sizes of the configurations.

GPA$size

# Standardised PC scores (each with unit variance) using tan.

GPA$scores

# Raw PC scores using tan.

GPA$rawscores

# Kendall's Riemannian distance 'rho' to the mean shape.

GPA$rho

# Root mean square (RMS) of rho.

GPA$rmsrho

# RMS of full Procrustes distances to the mean shape.

GPA$rmsdl
                 

# Procrustes PCs and eigenleaves.

shapepca(GPA)
                 

#Specify desired PCs for visualization, example:

shapepca(GPA, pcno=c(1,2,3,4,5))
                 
# Write out important PC values as .txt files in the working directory.
# PC scores:
t <- as.matrix(GPA$stdscores)
write.table(t, file="PC_scores.txt")
                 
# Percent variance explained by each PC
p <- as.matrix(GPA$percent)
write.table(p, file="PC_percents.txt")
                 
# Procrustes-adjusted coordinates for each leaf:
c <- as.matrix(GPA$rotated)
write.table(c, file="Procrustes_coord.txt")
