library(tidyverse)


# Create a sequence of numbers between -10 and 10 incrementing by 0.1.
x <- seq(0, 57, by = 1)

# Choose the mean as 2.5 and standard deviation as 0.5.
y <- dnorm(x, mean = 28, sd = 10)

tilt_table <- tibble(x, y) %>% 
  mutate(y = y * 300)


tilt_table %>% 
  ggplot() +
  geom_point(aes(x = x, y = y)) +
  scale_y_continuous(limits = c(0, 10))

tilt_vector <- tilt_table %>% 
  pull(y)

jsonlite::toJSON(tilt_vector)
