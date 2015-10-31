# clean the new batch results and get them into the df
  list.files("results_method2")
  
  
  batch2 <- read.table("results_method2/algo2_pass1.txt", sep="\t")
  colnames(batch2) <- c("filename", "timeOffset", "duration", "level", "quality", "score", "recognizer", "comments")
    
  
# remove directory info in path (col 1)
  batch2[,1] <- sub("Z:\\\\ListeningCrew\\\\Listening_CrewSamples\\\\Mike_Samples\\\\TEWA Recognizer\\\\TEWA Clips\\\\", "", batch2[,1])
  
  df[match(batch2[,"filename"], df[,"filename"]), "quality"] <- batch2[match(batch2[,"filename"], df[,"filename"]), "quality"]
  df[match(batch2[,"filename"], df[,"filename"]), "score"] <- batch2[match(batch2[,"filename"], df[,"filename"]), "score"]
  
# make it into a new, better dataframe
  newdf <- batch2
# remove useless columns
  newdf["timeOffset"] <- NULL
  newdf["recognizer"] <- NULL
  newdf["comments"] <- NULL
# add useful columns
  newdf["sitetype"] <- NA
  newdf["volume"] <- NA
  #fill them
    newdf[grep("-C[0-9][0-9]", df[, 1]), "sitetype"] <- "coniferous"
    newdf[grep("-D[0-9][0-9]", df[, 1]), "sitetype"] <- "deciduous"
    newdf[grep("-E[0-9][0-9]", df[, 1]), "sitetype"] <- "edge"
    newdf[grep("-R[0-9][0-9]", df[, 1]), "sitetype"] <- "road"
      
    newdf[grep("80dB", df[, 1]), "volume"] <- "80"
    newdf[grep("85dB", df[, 1]), "volume"] <- "85"
    newdf[grep("90dB", df[, 1]), "volume"] <- "90"

# distance
distances <- newdf[,"filename"]
distances <- str_extract(distances, "[[:alnum:]]*_")
distances <- sub("_", "", distances)
distances <- as.numeric(distances)
newdf["distance"] <- distances
