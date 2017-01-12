### Protocol step B)12. - Landmark Check ###

# This script produces .png files of plots of the landmark data (x,y coordinates in order) and saves them in the working directory. 

# Before beginning, install the package ‘ggplot2’ to R.

install.packages("ggplot2") 

library(ggplot2)

# Put this script and the data text file in a new folder. Many .png files will be produced in this step, and it is helpful for organizational purposes that they stay in one folder.

#Read in your data. The example file "landmarkTest.txt" can be found on Github for reference.

data <- read.table("./landmarkTest.txt", header=TRUE)

#Check the column names and bottom six rows of the dataset to ensure the file was read properly.
names(data)
tail(data)

#Establish the length of the dataset, which is the number of leaves that need to be visualized
len <- length(data[,1])

#Run a loop to connect the correct landmarks to one another. After the "print" command, in the object "graph", you have to specify first 1) an ID for each leaf and 2) the coordiantes. In the example dataset, the first column "overall.order" is an arbitrary number assigned to each leaf that will be used as an ID and the columns 3:36 are the x,y coordinates. These columns correspond to the "LandmarkTest.txt" dataset in the loop below, but users must change them based on their dataset.

for(i in 1:len) { 

print(i)

graph <- data[i,c(1,3:36)]
label <- as.character(graph[1,1])

vein_colour <- "mediumpurple3"
margin_colour <- "forestgreen"

p <- ggplot(graph, aes(x=x1, y=y1, xend=x12, yend=y12))

plot <- p + geom_segment(colour=margin_colour) + geom_segment(aes(x=x12, y=y12, xend=x10, yend=y10), colour=margin_colour) + geom_segment(aes(x=x10, y=y10, xend=x8, yend=y8), colour=margin_colour) + geom_segment(aes(x=x8, y=y8, xend=x6, yend=y6), colour=margin_colour) + geom_segment(aes(x=x6, y=y6, xend=x4, yend=y4), colour=margin_colour) + geom_segment(aes(x=x4, y=y4, xend=x2, yend=y2), colour=margin_colour) + geom_segment(aes(x=x2, y=y2, xend=x3, yend=y3), colour=margin_colour) + geom_segment(aes(x=x3, y=y3, xend=x5, yend=y5), colour=margin_colour) + geom_segment(aes(x=x5, y=y5, xend=x7, yend=y7), colour=margin_colour) + geom_segment(aes(x=x7, y=y7, xend=x9, yend=y9), colour=margin_colour) + geom_segment(aes(x=x9, y=y9, xend=x11, yend=y11), colour=margin_colour) + geom_segment(aes(x=x11, y=y11, xend=x1, yend=y1), colour=margin_colour) + geom_segment(aes(x=x1, y=y1, xend=x13, yend=y13), colour=vein_colour) + geom_segment(aes(x=x1, y=y1, xend=x14, yend=y14), colour=vein_colour) + geom_segment(aes(x=x1, y=y1, xend=x15, yend=y15), colour=vein_colour) + geom_segment(aes(x=x1, y=y1, xend=x16, yend=y16), colour=vein_colour) + geom_segment(aes(x=x1, y=y1, xend=x17, yend=y17), colour=vein_colour) + geom_segment(aes(x=x16, y=y16, xend=x11, yend=y11), colour=vein_colour) + geom_segment(aes(x=x17, y=y17, xend=x12, yend=y12), colour=vein_colour) + geom_text(aes(x=(min(x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17)+max(x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17))/2, y=min(x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17)+10,label=label), size=8, colour="black") + theme_bw() + coord_fixed(ratio=1)

# After the loop above creates a plot of each leaf in the data file, each leaf will be printed as a separate file in the current working directory using the command below.

ggsave(plot,filename=paste(label,".png",sep=""))

}
