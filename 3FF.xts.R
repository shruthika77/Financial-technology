setwd("./R Quant1")
if(!("tidyverse" %in% as.character(installed.packages()[,1]))){
  install.packages("tidyverse")
}
library(tidyverse)

ff_url <- "https://mba.tuck.dartmouth.edu/pages/faculty/ken.french/ftp/F-F_Research_Data_Factors_CSV.zip"
temp_file <- tempfile()
download.file(ff_url,temp_file)
ff_factor_raw_data <- unzip(temp_file)
ff_factor_raw_data <- read.csv(ff_factor_raw_data, skip = 3)
# Assuming ff_factor_raw_data is the file name as a character string
file_path <- "path/to/your/ff_factor_raw_data.csv"
ff_factor_raw_data <- read.csv(file_path, skip = 3)
load("C:/Users/Sudharshini/Documents/R Quant1/Data/F-F_Research_Data_Factors.CSV")
ff="C:/Users/Sudharshini/Documents/R Quant1/Data/F-F_Research_Data_Factors.CSV"
ff_factor <- read.csv(ff,skip = 4)
head(ff_factor)
tail(ff_factor)
dim(ff_factor)

FF <- ff_factor[1:1122,]
colnames(FF)
colnames(FF)[1] <- "YearMonth"
is(FF$YearMonth)

date.index <- as.Date(paste(substr(FF$YearMonth,1,4),"-",
                            substr(FF$YearMonth,5,6), "-",
                            "01", sep = ""))
#creating time series
library(quantmod)
FF.xts <- xts(FF, date.index)
save(FF.xts, file = "./RData/FF.xts.RData")