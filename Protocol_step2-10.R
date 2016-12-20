### Protocol step 2)10. - Landmark Check ###

# This script produces .png files of plots of the landmark data (x,y coordinates in order) and saves them in the working directory.

# Before beginning, install the package ‘ggplot2’ to R.

install.packages("ggplot2") 

library(ggplot2)

# To set your working directory use the following code, but replace “Kitchen_Greg” with the folder containing your landmark data.

setwd("./Kitchen_Greg")
getwd()

resolution=50

for(i in list.files()) { 
  
  print(i)
  
  data <- read.csv(i, header=TRUE)
  
  len <- length(data$Y)
  
  # In this example, 17 landmarks were placed. Note that parameters must be changed in order to fit your dataset.
  
  overall.table <- matrix(nrow=len/17, ncol=(17*2)+1)
  
  overall.length <- len/17
  
  # Below, a loop is created to write within R a table of the landmarks to plot.
  
  for(j in c(1:overall.length))
    
  {
    
    print(j)
    
    sub.data <- as.matrix(data[ (1+17*(j-1)):((1+17*(j-1))+16), 1:2])
    
    overall.table[j,1:2] <- sub.data[1, 1:2]
    overall.table[j,3:4] <- sub.data[2, 1:2]
    overall.table[j,5:6] <- sub.data[3, 1:2]
    overall.table[j,7:8] <- sub.data[4, 1:2]
    overall.table[j,9:10] <- sub.data[5, 1:2]
    overall.table[j,11:12] <- sub.data[6, 1:2]
    overall.table[j,13:14] <- sub.data[7, 1:2]
    overall.table[j,15:16] <- sub.data[8, 1:2]
    overall.table[j,17:18] <- sub.data[9, 1:2]
    overall.table[j,19:20] <- sub.data[10, 1:2]
    overall.table[j,21:22] <- sub.data[11, 1:2]
    overall.table[j,23:24] <- sub.data[12, 1:2]
    overall.table[j,25:26] <- sub.data[13, 1:2]
    overall.table[j,27:28] <- sub.data[14, 1:2]
    overall.table[j,29:30] <- sub.data[15, 1:2]
    overall.table[j,31:32] <- sub.data[16, 1:2]
    overall.table[j,33:34] <- sub.data[17, 1:2]
    
    
  }
  
  graph <- as.data.frame(overall.table)
  
  colnames(graph) <- c("x1","y1","x2","y2","x3","y3","x4","y4","x5","y5","x6","y6","x7","y7","x8","y8","x9","y9","x10","y10","x11","y11","x12","y12","x13","y13","x14","y14","x15","y15","x16","y16","x17","y17")
  
  vein_colour <- "mediumpurple3"
  margin_colour <- "forestgreen"
  
  p <- ggplot(graph, aes(x=x1, y=y1, xend=x12, yend=y12))
  
  plot <- p + geom_segment(colour=margin_colour) + geom_segment(aes(x=x12, y=y12, xend=x10, yend=y10), colour=margin_colour) + geom_segment(aes(x=x10, y=y10, xend=x8, yend=y8), colour=margin_colour) + geom_segment(aes(x=x8, y=y8, xend=x6, yend=y6), colour=margin_colour) + geom_segment(aes(x=x6, y=y6, xend=x4, yend=y4), colour=margin_colour) + geom_segment(aes(x=x4, y=y4, xend=x2, yend=y2), colour=margin_colour) + geom_segment(aes(x=x2, y=y2, xend=x3, yend=y3), colour=margin_colour) + geom_segment(aes(x=x3, y=y3, xend=x5, yend=y5), colour=margin_colour) + geom_segment(aes(x=x5, y=y5, xend=x7, yend=y7), colour=margin_colour) + geom_segment(aes(x=x7, y=y7, xend=x9, yend=y9), colour=margin_colour) + geom_segment(aes(x=x9, y=y9, xend=x11, yend=y11), colour=margin_colour) + geom_segment(aes(x=x11, y=y11, xend=x1, yend=y1), colour=margin_colour) + geom_segment(aes(x=x1, y=y1, xend=x13, yend=y13), colour=vein_colour) + geom_segment(aes(x=x1, y=y1, xend=x14, yend=y14), colour=vein_colour) + geom_segment(aes(x=x1, y=y1, xend=x15, yend=y15), colour=vein_colour) + geom_segment(aes(x=x1, y=y1, xend=x16, yend=y16), colour=vein_colour) + geom_segment(aes(x=x1, y=y1, xend=x17, yend=y17), colour=vein_colour) + geom_segment(aes(x=x16, y=y16, xend=x11, yend=y11), colour=vein_colour) + geom_segment(aes(x=x17, y=y17, xend=x12, yend=y12), colour=vein_colour) + theme_bw() + coord_fixed(ratio=1) 
  
  ggsave(plot,filename=paste("plot_",i,".png",sep=""))
  
}

