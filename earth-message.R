library(tidyverse)

country_names <- c('Guinea', 'Iran', 'Trinidad and Tobago', 'Honduras', 'Lebanon',
             'Ethiopia', 'Niger', 'Afghanistan', 'India', 'American Samoa',
             'Cuba', 'Gabon', 'Nicaragua', 'Channel Islands', 'Martinique')

country_pop <- read_csv('https://raw.githubusercontent.com/hyperc54/data-puzzles-assets/master/misc/earth/population_by_country.csv')
names(country_pop) <- c('country', 'population', 'change', 'urban.percentage',
                        'world.share')

country_surface <- read_csv('https://raw.githubusercontent.com/hyperc54/data-puzzles-assets/master/misc/earth/surface_by_country.csv')
names(country_surface) <- c('country', 'land.area')

countries <- inner_join(country_pop, country_surface, by='country')


selected_countries <- countries %>% 
  mutate(density = population/land.area) %>%
  filter(country %in% country_names) %>%
  arrange(desc(density))

word <- selected_countries %>%
  pull(country) %>%
  substr(1, 1) %>%
  paste0(collapse = '')
  
  


