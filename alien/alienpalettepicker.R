# install.packages("colorfindr")
# install.packages("tidyverse")
# install.packages("palmerpenguins")
library(colorfindr) # extracts colors from images
library(tidyverse) # tidy data wrangling & plotting

# Get colors and create a palette with n = 5
get_colors("baseimages/alienposter.jpg") %>% # you can reference a local file on your computer or a jpg web address
  make_palette(n = 5) # here we extract 5 colors

# Use your favorite magic number to set a seed:
# set.seed(42)
ACP <- get_colors("baseimages/alienposter.jpg") %>%
  make_palette(n = 3)

library(palmerpenguins) # get the penguin data
penguins %>% # feed ggplot the data
  ggplot(aes(flipper_length_mm, fill = species)) + # we want to investigate the flipper length of our penguin friends
  geom_density(alpha = 0.8, color =NA)+ # specify how you want to display the data
  theme_minimal() # pick a theme

penguins %>%
  ggplot(aes(flipper_length_mm, fill = species)) +
  geom_density(alpha = 0.8, color =NA)+
  scale_fill_manual(values = ACP)+
  theme_minimal()

