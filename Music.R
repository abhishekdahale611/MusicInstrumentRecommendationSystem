setwd('E:/NCI/ResearchProject')

getwd()



MusicData <- read.csv("E:/NCI/InstrumentData/MusicInstrumentData.csv",header=T, na.strings=c(""), stringsAsFactors = T)
is.na(MusicData)
nrow(MusicData)
sapply(MusicData,function(x) sum(is.na(x)))

ReviewData <- read.csv("Reviews.csv",header=T, na.strings=c(""), stringsAsFactors = T)



is.na(ReviewData)

sapply(ReviewData,function(x) sum(is.na(x)))
na.omit(ReviewData)
#Removing unwanted Columns
colnames(ReviewData)
ReviewData[ ,c('reviewerID', 'unixReviewTime','reviewTime','reviewerName')] <- list(NULL)
ReviewData[ ,c('helpful', 'overall','summary')] <- list(NULL)




df<- merge(x=MusicData,y=ReviewData,by="Asin",all.x = TRUE)
df<-df[!duplicated(df$Asin),]
sapply(df,function(x) sum(is.na(x)))
na.omit(df$Description)
write.csv(df,"MusicInstruments.csv")
