if(!'RCurl' %in% library()$results[,1]){install.packages('RCurl')}
if(!'dplyr' %in% library()$results[,1]){install.packages('dplyr')}
if(!'stringr' %in% library()$results[,1]){install.packages('stringr')}
library(RCurl);library(dplyr);library(stringr)

data_url = "https://raw.githubusercontent.com/fivethirtyeight/data/master/candy-power-ranking/candy-data.csv"
candy_data = read.csv(text = getURL(data_url), stringsAsFactors = FALSE) %>% 
  mutate(competitorname = str_replace(competitorname,"Õ","'"))
save(candy_data, file = file.path("data", "candy_data.RData"))