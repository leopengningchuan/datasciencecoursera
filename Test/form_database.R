library(ngram); library(readtext)

setwd("/Users/LeoPeng/Desktop/JHU Data Science/Course Material/C10_Data Science Capstone/Final Project/Final_Project")

twitter_file_path <- "en_US.twitter.txt"
twitter_file <- readtext(twitter_file_path)
twitter.words <- preprocess(twitter_file[1,2], case ="lower", remove.punct = TRUE )
ng_twitter_3 <- ngram(twitter.words, n=3)
df <- as.data.frame(get.phrasetable(ng_twitter_3))
df_1000000 <- df[c(1:1000000),]
write.csv(df_1000000, "database.csv")


#test <- as.data.frame(read.csv("database.csv"))[,(2:4)]
