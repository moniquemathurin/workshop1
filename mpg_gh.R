library(tidyverse)

mpg

head(mpg)

mpg %>%
  group_by(manufacturer) %>%
  summarise(mean = mean(hwy))

mpg %>%
  ggplot(aes(x = manufacturer, y = cty)) +
  geom_point()

mpg %>%
  mutate(manufacturer = str_to_title(manufacturer)) %>%
  ggplot(aes(x = manufacturer, y = cty)) +
  geom_point() +
  theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = .5))

mpg %>%
  mutate(manufacturer = str_to_title(manufacturer)) %>%
  ggplot(aes(x = manufacturer, y = cty)) +
  geom_jitter(width = .2, alpha = .75, size = 2) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = .5)) +
  theme(text = element_text(size = 13)) +
  labs(title = "City Fuel Economy by Car Manufacturer", x = "Manufacturer", y = "City Fuel Economy (mpg)")

install.packages("Hmisc")
library(Hmisc)

mpg %>%
  mutate(manufacturer = str_to_title(manufacturer)) %>% 
  ggplot(aes(x = manufacturer, y = cty)) +
  stat_summary(fun.data = mean_cl_boot, colour = "black", size = 1) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = .5)) +
  theme(text = element_text(size =13)) +
  labs(title = "City Fuel Economy by Car Manufacturer", x = "Manufacturer", 
       y = "City Fuel Economy (mpg)")

mpg %>%
  mutate(manufacturer = str_to_title(manufacturer)) %>%
  ggplot(aes(x = fct_reorder(manufacturer, .fun = mean, cty), y = cty, colour =
               manufacturer)) +
  stat_summary(fun.data = mean_cl_boot, size = 1) +
  geom_jitter(alpha = .25) +
  theme_minimal() +
  theme(text = element_text(size = 13)) +
  labs(title = "Manufacturer by City Fuel Economy", x = "Manufacturer", y = 
         "City Fuel Economy (mpg)") +
  guides(colour = FALSE) +
  coord_flip()

mpg %>%
  filter(class != "suv") %>%
  mutate(class = str_to_title(class)) %>%
  ggplot(aes(x = displ, y = cty, colour = class)) +
  geom_jitter(width = .2) +
  theme_minimal() +
  theme(text = element_text(size = 12)) +
  labs(title = "City Fuel Economy by Engine Displacement", 
       x = "Engine Displacement (litres)",
       y = "City Fuel Economy (mpg)") +
  guides(colour = FALSE) +
  facet_wrap(~ class)


