# plot some data

# plots with jitter 
  # quality ~ distance, by sitetype
  ggplot(data = newdf, aes(x = distance)) +
    geom_jitter(aes(y = quality, color = sitetype), size = 1) +
    geom_smooth(aes(y = quality, color = sitetype), method = glm, family = poisson(), se = F, size = 1) +
    theme_classic() + scale_color_brewer(palette = "Set1")

  ggplot(data = newdf, aes(x = distance)) +
    geom_jitter(aes(y = quality, color = siteCategory), size = 1) +
    geom_smooth(aes(y = quality, color = siteCategory), method = glm, family = poisson(), se = F, size = 1) +
    theme_classic() + scale_color_brewer(palette = "Set1")


# points w/o jitter 
  # quality ~ distance, by sitetype
  ggplot(data = newdf, aes(x = distance)) +
    geom_point(aes(y = quality, color = sitetype), size = 1) +
    geom_smooth(aes(y = quality, color = sitetype), method = glm, family = poisson(), se = F, size = 1) +
    theme_classic() + scale_color_brewer(palette = "Set1")
  
  ggplot(data = newdf, aes(x = distance)) +
    geom_point(aes(y = quality, color = siteCategory), size = 1) +
    geom_smooth(aes(y = quality, color = siteCategory), method = glm, family = poisson(), se = F, size = 1) +
    theme_classic() + scale_color_brewer(palette = "Set1")
  