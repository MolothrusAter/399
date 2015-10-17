

# cursory analysis

summary(df[, 5:11])


# plot some data


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
# plot some data
  detrates <- c(detrate_algo1_50q_40s, detrate_algo1_60q_50s, 
              + detrate_algo1_70q_60s, detrate_algo2_50q_40s, 
              + detrate_algo2_60q_50s, detrate_algo2_70q_60s)
  names(detrates) <- c("detrate_algo1_50q_40s", "detrate_algo1_60q_50s", 
                     "detrate_algo1_70q_60s", "detrate_algo2_50q_40s", 
                     "detrate_algo2_60q_50s", "detrate_algo2_70q_60s")
