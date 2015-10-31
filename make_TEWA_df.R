# building and cleaning primary dataframe

filelist <- list.files("TEWA Clips/")

length(filelist)
# 2543 files long. df needs 2543 cols
# but row 1 has txt file not sound so let's remove it
filelist <- filelist[2:2543]

df <- data.frame(filelist, "col2", "col3", stringsAsFactors = FALSE)

names(df) <- c("filename", "year", "species")

df[grep("P14-", df[, 1]), 2] <- "2014"

df[,3] <- as.character(df[,3])
df[grep("TEWA", df[, 1]), "species"] <- "TEWA"

# couple new cols
df["sitetype"] <- NA
df["volume"] <- NA

# now fill them
df[grep("-C[0-9][0-9]", df[, 1]), "sitetype"] <- "coniferous"
df[grep("-D[0-9][0-9]", df[, 1]), "sitetype"] <- "deciduous"
df[grep("-E[0-9][0-9]", df[, 1]), "sitetype"] <- "edge"
df[grep("-R[0-9][0-9]", df[, 1]), "sitetype"] <- "road"

df[grep("80dB", df[, 1]), "volume"] <- "80"
df[grep("85dB", df[, 1]), "volume"] <- "85"
df[grep("90dB", df[, 1]), "volume"] <- "90"

# make distance columns
distances <- filelist
distances <- str_extract(distances, "[[:alnum:]]*_")
distances <- sub("_", "", distances)
distances <- as.numeric(distances)
df["distance"] <- distances

# make quality and score columns
df["quality"] <- NA
df["score"] <- NA






# detection rate <- number of detections / number of observations
  detrate_algo1_50q_40s <- 
    + length(which(df[,"detections_algo1_50q_40s"] == TRUE)) / 
    + length(df[,"detections_algo1_50q_40s"])
  detrate_algo1_60q_50s <- 
    + length(which(df[,"detections_algo1_60q_50s"] == TRUE)) / 
    + length(df[,"detections_algo1_60q_50s"])
  detrate_algo1_70q_60s <- 
    + length(which(df[,"detections_algo1_70q_60s"] == TRUE)) / 
    + length(df[,"detections_algo1_70q_60s"])
  detrate_algo2_50q_40s <- 
    + length(which(df[,"detections_algo2_50q_40s"] == TRUE)) / 
    + length(df[,"detections_algo2_50q_40s"])
  detrate_algo2_60q_50s <- 
    + length(which(df[,"detections_algo2_60q_50s"] == TRUE)) / 
    + length(df[,"detections_algo2_60q_50s"])
  detrate_algo2_70q_60s <- 
    + length(which(df[,"detections_algo2_70q_60s"] == TRUE)) / 
    + length(df[,"detections_algo2_70q_60s"])

# looks like algo2_50q_40s detects the most.
# detection rate for 80dB playbacks
  detrate_80dB <- 
    which(df[,"volume"] == "80" && df[,"detections_algo2_50q_40s"] == TRUE)
    which(df[,"detections_algo2_50q_40s"] == TRUE)

  detrates <- c(detrate_algo1_50q_40s, detrate_algo1_60q_50s, 
              + detrate_algo1_70q_60s, detrate_algo2_50q_40s, 
              + detrate_algo2_60q_50s, detrate_algo2_70q_60s)
  names(detrates) <- c("detrate_algo1_50q_40s", "detrate_algo1_60q_50s", 
                     "detrate_algo1_70q_60s", "detrate_algo2_50q_40s", 
                     "detrate_algo2_60q_50s", "detrate_algo2_70q_60s")















