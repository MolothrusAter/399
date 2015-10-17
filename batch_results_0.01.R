# get filenames
  list.files("batch_results")

# import batch results
  algo1_50q_40s <- read.table("batch_results/algo1_50q_40s.txt", sep="\t")
  algo1_50q_40s <- algo1_50q_40s[,1]
  algo1_60q_50s <- read.table("batch_results/algo1_60q_50s.txt", sep="\t")
  algo1_60q_50s <- algo1_60q_50s[,1]
  algo1_70q_60s <- read.table("batch_results/algo1_70q_60s.txt", sep="\t")
  algo1_70q_60s <- algo1_70q_60s[,1]
  algo2_50q_40s <- read.table("batch_results/algo2_50q_40s.txt", sep="\t")
  algo2_50q_40s <- algo2_50q_40s[,1]
  algo2_60q_50s <- read.table("batch_results/algo2_60q_50s.txt", sep="\t")
  algo2_60q_50s <- algo2_60q_50s[,1]
  algo2_70q_60s <- read.table("batch_results/algo2_70q_60s.txt", sep="\t")
  algo2_70q_60s <- algo2_70q_60s[,1]

# remove directory headings
  algo1_50q_40s <- sub("Z:\\\\ListeningCrew\\\\Listening_CrewSamples\\\\Mike_Samples\\\\TEWA Recognizer\\\\TEWA Clips\\\\", "", algo1_50q_40s)
  algo1_60q_50s <- sub("Z:\\\\ListeningCrew\\\\Listening_CrewSamples\\\\Mike_Samples\\\\TEWA Recognizer\\\\TEWA Clips\\\\", "", algo1_60q_50s)
  algo1_70q_60s <- sub("Z:\\\\ListeningCrew\\\\Listening_CrewSamples\\\\Mike_Samples\\\\TEWA Recognizer\\\\TEWA Clips\\\\", "", algo1_70q_60s)
  algo2_50q_40s <- sub("Z:\\\\ListeningCrew\\\\Listening_CrewSamples\\\\Mike_Samples\\\\TEWA Recognizer\\\\TEWA Clips\\\\", "", algo2_50q_40s)
  algo2_60q_50s <- sub("Z:\\\\ListeningCrew\\\\Listening_CrewSamples\\\\Mike_Samples\\\\TEWA Recognizer\\\\TEWA Clips\\\\", "", algo2_60q_50s)
  algo2_70q_60s <- sub("Z:\\\\ListeningCrew\\\\Listening_CrewSamples\\\\Mike_Samples\\\\TEWA Recognizer\\\\TEWA Clips\\\\", "", algo2_70q_60s)
  
# add to dataframe
  # make empty cols for recognizers
    df["detections_algo1_50q_40s"] <- NA
    df["detections_algo1_60q_50s"] <- NA
    df["detections_algo1_70q_60s"] <- NA
    df["detections_algo2_50q_40s"] <- NA
    df["detections_algo2_60q_50s"] <- NA
    df["detections_algo2_70q_60s"] <- NA

  # detected? (TRUE) or not? (FALSE)
    df[match(algo1_50q_40s, df[, 1]), "detections_algo1_50q_40s"] <- TRUE
    df[match(algo1_60q_50s, df[, 1]), "detections_algo1_60q_50s"] <- TRUE
    df[match(algo1_70q_60s, df[, 1]), "detections_algo1_70q_60s"] <- TRUE
    df[match(algo2_50q_40s, df[, 1]), "detections_algo2_50q_40s"] <- TRUE
    df[match(algo2_60q_50s, df[, 1]), "detections_algo2_60q_50s"] <- TRUE
    df[match(algo2_70q_60s, df[, 1]), "detections_algo2_70q_60s"] <- TRUE
    df[-match(algo1_50q_40s, df[, 1]), "detections_algo1_50q_40s"] <- FALSE
    df[-match(algo1_60q_50s, df[, 1]), "detections_algo1_60q_50s"] <- FALSE
    df[-match(algo1_70q_60s, df[, 1]), "detections_algo1_70q_60s"] <- FALSE
    df[-match(algo2_50q_40s, df[, 1]), "detections_algo2_50q_40s"] <- FALSE
    df[-match(algo2_60q_50s, df[, 1]), "detections_algo2_60q_50s"] <- FALSE
    df[-match(algo2_70q_60s, df[, 1]), "detections_algo2_70q_60s"] <- FALSE
  
