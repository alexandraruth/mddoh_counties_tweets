##### Group project: MD County Health Department COVID-19 tweets

setwd("~/Documents/GitHub/mddoh_counties_tweets")

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
dat <- read_csv("https://raw.githubusercontent.com/alexandraruth/mddoh_counties_tweets/main/mddoh_counties.csv")

# get MD DOH county twitter handles into a vector

mddoh_handles <- as.vector(dat$`Twitter handle`)

# remove values that don't have handles
mddoh_handles <- mddoh_handles[!is.na(mddoh_handles)]

# remove the @ sign from the vector

mddoh_handles <- sub('@', '', mddoh_handles)

#### Get tweets from MD county health departments & state ----

# input academic twitter API bearer token

bearer_token <- "<token>"

#### Query twitter API with MD DOH county & state twitter handles

mddoh_tweets <- get_user_tweets(mddoh_handles,  # users object 
                              start_tweets = "2021-01-01T00:00:00Z", # start date
                              end_tweets = "2021-06-22T00:00:00Z", # end date
                              bearer_token = bearer_token, # bearer token 
                              file = "mddoh_tweets"
)


#list out first 20 tweets
head(mddoh_tweets$text, 20)

# subset and create a new data frame with only tweets about xyz
mddoh_tweets_walkin <- mddoh_tweets %>%
  filter(grepl("walk-in", text))


#### to re-load data:

mddoh_tweets <- readRDS("mddoh_tweets.rds")

