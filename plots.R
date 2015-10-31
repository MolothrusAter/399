# plot some data

ggplot(data = newdf, aes(x = distance)) +
  geom_jitter(aes(y = quality, color = sitetype), size = 1) +
  geom_smooth(aes(y = quality, color = sitetype), method = glm, family = poisson(), se = F, size = 1) +
  theme_classic() + scale_color_brewer(palette = "Set1")

ggplot(data = newdf, aes(x = volume)) +
  geom_jitter(aes(y = quality, color = sitetype), size = 1) +
  geom_smooth(aes(y = quality, color = sitetype), method = glm, family = poisson(), se = F, size = 1) +
  theme_classic() + scale_color_brewer(palette = "Set1")

