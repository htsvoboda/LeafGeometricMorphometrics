### Protocol step 2)12. - Reformatting the ‘master spreadsheet’ ###

# This script converts the master spreadsheet (in which each landmark is listed one after the other) into a format in which each leaf is assigned a single row, with its landmarks as columns. Note that this example uses 17 landmarks and parameters must be changed in order to fit your dataset.

data <- read.table(masterspreadsheet.txt, header=TRUE)

len <- length(data$X)
  
overall.table <- matrix(nrow=len/17, ncol=(17*2)+1)
  
overall.length <- len/17
  
for(j in c(1:overall.length)) {
  
print(j)

sub.data <- as.matrix(data[ (1+17*(j-1)):((1+17*(j-1))+16), 2:4])

overall.table[j,1] <- sub.data[1, 1]
overall.table[j,2:3] <- sub.data[1, 2:3]
overall.table[j,4:5] <- sub.data[2, 2:3]
overall.table[j,6:7] <- sub.data[3, 2:3]
overall.table[j,8:9] <- sub.data[4, 2:3]
overall.table[j,10:11] <- sub.data[5, 2:3]
overall.table[j,12:13] <- sub.data[6, 2:3]
overall.table[j,14:15] <- sub.data[7, 2:3]
overall.table[j,16:17] <- sub.data[8, 2:3]
overall.table[j,18:19] <- sub.data[9, 2:3]
overall.table[j,20:21] <- sub.data[10, 2:3]
overall.table[j,22:23] <- sub.data[11, 2:3]
overall.table[j,24:25] <- sub.data[12, 2:3]
overall.table[j,26:27] <- sub.data[13, 2:3]
overall.table[j,28:29] <- sub.data[14, 2:3]
overall.table[j,30:31] <- sub.data[15, 2:3]
overall.table[j,32:33] <- sub.data[16, 2:3]
overall.table[j,34:35] <- sub.data[17, 2:3]
  }
                    
# Confirm the above loop worked.

head(overall.table)
tail(overall.table)
                    
# Assign the new table column names and write out the reformatted table to the working directory.

colnames(overall.table) <- c("label", "x1", "y1", "x2", "y2", "x3", "y3", "x4", "y4", "x5", "y5", "x6", "y6", "x7", "y7", "x8", "y8", "x9", "y9", "x10", "y10", "x11", "y11", "x12", "y12", "x13", "y13", "x14", "y14", "x15", "y15", "x16", "y16", "x17", "y17")
                    
write.table(overall.table, "reformat.txt")
