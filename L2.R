setwd("C:/Users/Sudharshini/Documents/R Quant1")


dis <- read.csv(file = "C:/Users/Sudharshini/Documents/R Quant1/Data/dis.csv")


is(dis$Date)
# Assuming your data frame is not empty and has a column named 'Data'
dis <- read.csv(file = "C:/Users/Sudharshini/Documents/R Quant1/Data/dis.csv")

# Check the structure of your data frame
str(dis)

# Convert 'Data' column to Date format
dis$Data.format <- as.Date(as.character(dis$Data), format = "%Y-%m-%d")


dis$date.format <- as.Date (as.character(dis$Date), format = "%Y-%m-%d")
save(dis, file = "C:/Users/Sudharshini/Documents/RData/dis.RData")
