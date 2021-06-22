##### Group project: MD County Health Department COVID-19 tweets


#### Approach ----

## Steps:

# - Use county health dept twitter handles
# - Pull ALL 2021 tweets from county health department twitter pages



## Caveats/limitations:

# - some smaller counties don't have twitter accounts and seem to use Facebook or other platforms more
# - might need to look at the county govt twitter pages for vax info?



#install packages 

library(academictwitteR)
library(tidyverse)
library(RCurl)
library(dplyr)
library(ggplot2)
library(rtweet)

#### Get MD county health dept twitter handles ----


# get md county twitter handles csv file into a dataframe
x <- read_csv("https://raw.githubusercontent.com/CivilServiceUSA/us-governors/master/us-governors/data/us-governors.csv")

# get governor twitter handles into a vector

gov_handles <- as.vector(x$twitter_handle)

#### Set up academic twitter API use ----

bearer_token <- "<insert token>"

#### Get tweets about masks within specified timeframe

gov_tweets <- get_user_tweets(gov_handles,  # users object 
                              start_tweets = "2021-01-01T00:00:00Z", # start date
                              end_tweets = "2021-06-15T00:00:00Z", # end date
                              bearer_token = bearer_token, # bearer token 
                              file = "gov_tweets" # data path where JSON files will be stored 
)


# subset and create a new data frame with only mask tweets
gov_mask_tweets <- gov_tweets %>%
  filter(grepl("mask", text))

#list out first 20 tweets
head(gov_mask_tweets$text, 20)


#### 