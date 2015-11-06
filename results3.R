# process results from new recognizers
  list.files("results_3")
  
  results_r4 <- read.table("results_3/results_r4.txt", sep="\t")
  colnames(results_r4) <- c("filename", "timeOffset", "duration", "level", "quality", "score", "recognizer", "comments")
 
# remove directory info in path (col 1)
  results_r4[,1] <- sub("Z:\\\\ListeningCrew\\\\Listening_CrewSamples\\\\Mike_Samples\\\\TEWA Recognizer\\\\TEWA Clips\\\\", "", results_r4[,1])

# remove useless columns
  results_r4["timeOffset"] <- NULL
  results_r4["comments"] <- NULL
  
# add useful columns
  results_r4["sitetype"] <- NA
  results_r4["volume"] <- NA
  #fill them
    results_r4[grep("-C[0-9][0-9]", results_r4[, 1]), "sitetype"] <- "coniferous"
    results_r4[grep("-D[0-9][0-9]", results_r4[, 1]), "sitetype"] <- "deciduous"
    results_r4[grep("-E[0-9][0-9]", results_r4[, 1]), "sitetype"] <- "edge"
    results_r4[grep("-R[0-9][0-9]", results_r4[, 1]), "sitetype"] <- "road"
      
    results_r4[grep("80dB", results_r4[, 1]), "volume"] <- "80"
    results_r4[grep("85dB", results_r4[, 1]), "volume"] <- "85"
    results_r4[grep("90dB", results_r4[, 1]), "volume"] <- "90"
    
  # aggregate sitetype category: closed=(coniferous+deciuous), open=(edge+road)
    results_r4["siteCategory"] <- NA
    results_r4[grep("coniferous", results_r4[, "sitetype"]), "siteCategory"] <- "closed"
    results_r4[grep("deciduous", results_r4[, "sitetype"]), "siteCategory"] <- "closed"
    results_r4[grep("edge", results_r4[, "sitetype"]), "siteCategory"] <- "open"
    results_r4[grep("road", results_r4[, "sitetype"]), "siteCategory"] <- "open"
    
       
  # distance
  distances <- results_r4[,"filename"]
  distances <- str_extract(distances, "[[:alnum:]]*_")
  distances <- sub("_", "", distances)
  distances <- as.numeric(distances)
  results_r4["distance"] <- distances

  
# export results from each recognizer to dataframes for easy plotting
  which(results_r4[, "recognizer"] == "TEWArecog2_c28_r4")
  
  
  
# plots for results_r4   (NEW!)
 # plots with jitter 
  # quality ~ distance, by sitetype
  ggplot(data = results_r4, aes(x = distance)) +
    geom_jitter(aes(y = quality, color = sitetype), size = 1) +
    geom_smooth(aes(y = quality, color = sitetype), method = glm, family = poisson(), se = F, size = 1) +
    theme_classic() + scale_color_brewer(palette = "Set1")

  ggplot(data = results_r4, aes(x = distance)) +
    geom_jitter(aes(y = quality, color = siteCategory), size = 2) +
    geom_smooth(aes(y = quality, color = siteCategory), method = glm, family = poisson(), se = F, size = 3) +
    theme_classic() + scale_color_brewer(palette = "Set1")

  