##### Group project: MD County Health Department COVID-19 tweets

setwd("~/Documents/GitHub/mddoh_counties_tweets")

#### Approach ----

## Steps:

# - Use county health dept and state govax twitter handles
# - Extract COVID and vaccine-related tweets
# - visually inspect at first for different types of incentives/strategies
# - concatenate dataframes and extract info about where & how often different strategies are used

## Caveats/limitations:

# - some smaller counties don't have twitter accounts and seem to use Facebook or other platforms more
# - information is possibly being provided on other accounts - e.g. state or county govt twitter accounts



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

#### Prepare to use Twitter API ----

# input academic twitter API bearer token

bearer_token <- "<token>"

#### Query twitter API with MD DOH county & state twitter handles

## Prince George's County ----

pgchealth_tweets <- get_user_tweets("pgchealth",  # users object 
                                start_tweets = "2021-01-01T00:00:00Z", # start date
                                end_tweets = "2021-06-22T00:00:00Z", # end date
                                bearer_token = bearer_token, # bearer token 
                                file = "pgchealth_tweets"
)

# list out first 20 tweets - PGCHEALTH
head(pgchealth_tweets$text, 20)

# extract tweets about vaccination
pgchealth_vax <- pgchealth_tweets %>%
  filter(grepl("vaccine | covid | COVID | vac | vacuna | VACCINE | VACUNA | VAC | vaccination | VACCINATION | clinic | clinics", text))

save(pgchealth_vax,file="pgcounty_vaxtweets.rda" )
rm(pgchealth_tweets)

# list out first 20 tweets - PGCHEALTH
head(pgchealth_vax$text, 50)

# add column for identifying 

pgchealth_vax <- pgchealth_vax %>%
  mutate(county=as.character("Prince George's County"))


#### Allegany County ----

allegany_tweets <- get_user_tweets("alleganyhlthmd",  # users object 
                                    start_tweets = "2021-01-01T00:00:00Z", # start date
                                    end_tweets = "2021-06-22T00:00:00Z", # end date
                                    bearer_token = bearer_token, # bearer token 
                                    file = "allegany_tweets"
)

# list out first 20 tweets 
head(allegany_tweets$text, 20)

# extract tweets about vaccination
allegany_vax <- allegany_tweets %>%
  filter(grepl("vaccine | covid | COVID | vac | vacuna | VACCINE | VACUNA | VAC | vaccination | VACCINATION | clinic | clinics", text))

# list out first 20 tweets - PGCHEALTH
head(allegany_vax$text, 50)

# add column for identifying county for merge later

allegany_vax <- allegany_vax %>%
  mutate(county=as.character("Allegany County"))

# save dataframe

save(allegany_vax,file="allegany_vaxtweets.rda" )
rm(allegany_tweets)


#### Anne Arundel County ----

annearundel_tweets <- get_user_tweets("aahealth",  # users object 
                                   start_tweets = "2021-01-01T00:00:00Z", # start date
                                   end_tweets = "2021-06-22T00:00:00Z", # end date
                                   bearer_token = bearer_token, # bearer token 
                                   file = "annearundel_tweets"
)

# list out first 20 tweets 
head(annearundel_tweets$text, 20)

# extract tweets about vaccination
annearundel_vax <- annearundel_tweets %>%
  filter(grepl("vaccine | covid | COVID | vac | vacuna | VACCINE | VACUNA | VAC | vaccination | VACCINATION | clinic | clinics", text))

# list out first 20 tweets - PGCHEALTH
head(annearundel_vax$text, 50)

# add column for identifying county for merge later

annearundel_vax <- annearundel_vax %>%
  mutate(county=as.character("Anne Arundel County"))

# save dataframe

save(annearundel_vax,file="annearundel_vaxtweets.rda" )
rm(annearundel_tweets)


#### Calvert County ----

calvert_tweets <- get_user_tweets("calverthealth",  # users object 
                                     start_tweets = "2021-01-01T00:00:00Z", # start date
                                     end_tweets = "2021-06-22T00:00:00Z", # end date
                                     bearer_token = bearer_token, # bearer token 
                                     file = "calvert_tweets"
)

# list out first 20 tweets 
head(calvert_tweets$text, 20)

# extract tweets about vaccination
calvert_vax <- calvert_tweets %>%
  filter(grepl("vaccine | covid | COVID | vac | vacuna | VACCINE | VACUNA | VAC | vaccination | VACCINATION | clinic | clinics", text))

# list out first 20 tweets
head(calvert_vax$text, 50)

# add column for identifying county for merge later

calvert_vax <- calvert_vax %>%
  mutate(county=as.character("Calvert County"))

# save dataframe

save(calvert_vax,file="calvert_vaxtweets.rda" )
rm(calvert_tweets)


#### Carroll County ----

carroll_tweets <- get_user_tweets("CarrollHealthMD",  # users object 
                                  start_tweets = "2021-01-01T00:00:00Z", # start date
                                  end_tweets = "2021-06-22T00:00:00Z", # end date
                                  bearer_token = bearer_token, # bearer token 
                                  file = "carroll_tweets"
)

# list out first 20 tweets 
head(carroll_tweets$text, 20)

# extract tweets about vaccination
carroll_vax <- carroll_tweets %>%
  filter(grepl("vaccine | vax | VAX | covid | COVID | COVID-19| vac | vacuna | VACCINE | VACUNA | VAC | vaccination | VACCINATION | clinic | clinics", text))

# list out first 20 tweets
head(carroll_vax$text, 50)

# add column for identifying county for merge later

carroll_vax <- carroll_vax %>%
  mutate(county=as.character("Carroll County"))

# save dataframe

save(carroll_vax,file="carroll_vaxtweets.rda" )
rm(carroll_tweets)

#### Cecil County ----

cecil_tweets <- get_user_tweets("CecilCoHealth",  # users object 
                                  start_tweets = "2021-01-01T00:00:00Z", # start date
                                  end_tweets = "2021-06-22T00:00:00Z", # end date
                                  bearer_token = bearer_token, # bearer token 
                                  file = "cecil_tweets"
)

# list out first 20 tweets 
head(cecil_tweets$text, 20)

# extract tweets about vaccination
cecil_vax <- cecil_tweets %>%
  filter(grepl("vaccine | vax | VAX | covid | COVID | COVID-19| vac | vacuna | VACCINE | VACUNA | VAC | vaccination | VACCINATION | clinic | clinics", text))

# list out first 20 tweets
head(cecil_vax$text, 50)

# add column for identifying county for merge later

cecil_vax <- cecil_vax %>%
  mutate(county=as.character("Cecil County"))

# save dataframe

save(cecil_vax,file="cecil_vaxtweets.rda" )
rm(cecil_tweets)


#### Charles County ----

charles_tweets <- get_user_tweets("CCDH_Maryland",  # users object 
                                start_tweets = "2021-01-01T00:00:00Z", # start date
                                end_tweets = "2021-06-22T00:00:00Z", # end date
                                bearer_token = bearer_token, # bearer token 
                                file = "charles_tweets"
)

# list out first 20 tweets 
head(charles_tweets$text, 20)

# extract tweets about vaccination
charles_vax <- charles_tweets %>%
  filter(grepl("vaccine | vax | VAX | covid | COVID | COVID-19| vac | vacuna | VACCINE | VACUNA | VAC | vaccination | VACCINATION | clinic | clinics", text))

# list out first 20 tweets
head(charles_vax$text, 50)

# add column for identifying county for merge later

charles_vax <- charles_vax %>%
  mutate(county=as.character("Charles County"))

# save dataframe

save(charles_vax,file="charles_vaxtweets.rda" )
rm(charles_tweets)

#### Frederick County ----

frederick_tweets <- get_user_tweets("FCHealthDept",  # users object 
                                  start_tweets = "2021-01-01T00:00:00Z", # start date
                                  end_tweets = "2021-06-22T00:00:00Z", # end date
                                  bearer_token = bearer_token, # bearer token 
                                  file = "frederick_tweets"
)

# list out first 20 tweets 
head(frederick_tweets$text, 20)

# extract tweets about vaccination
frederick_vax <- frederick_tweets %>%
  filter(grepl("vaccine | vax | VAX | covid | COVID | COVID-19| vac | vacuna | VACCINE | VACUNA | VAC | vaccination | VACCINATION | clinic | clinics", text))

# list out first 20 tweets
head(frederick_vax$text, 50)

# add column for identifying county for merge later

frederick_vax <- frederick_vax %>%
  mutate(county=as.character("Frederick County"))

# save dataframe

save(frederick_vax,file="frederick_vaxtweets.rda" )
rm(frederick_tweets)




#### Garrett County ----

garrett_tweets <- get_user_tweets("GarrettHealth",  # users object 
                                    start_tweets = "2021-01-01T00:00:00Z", # start date
                                    end_tweets = "2021-06-22T00:00:00Z", # end date
                                    bearer_token = bearer_token, # bearer token 
                                    file = "garrett_tweets"
)

# list out first 20 tweets 
head(garrett_tweets$text, 20)

# extract tweets about vaccination
garrett_vax <- garrett_tweets %>%
  filter(grepl("vaccine | vax | VAX | covid | COVID | COVID-19| vac | vacuna | VACCINE | VACUNA | VAC | vaccination | VACCINATION | clinic | clinics", text))

# list out first 20 tweets
head(garrett_vax$text, 50)

# add column for identifying county for merge later

garrett_vax <- garrett_vax %>%
  mutate(county=as.character("Garrett County"))

# save dataframe

save(garrett_vax,file="garrett_vaxtweets.rda" )
rm(garrett_tweets)



#### Harford County ----
harford_tweets <- get_user_tweets("HarCoHealthDept",  # users object 
                                  start_tweets = "2021-01-01T00:00:00Z", # start date
                                  end_tweets = "2021-06-22T00:00:00Z", # end date
                                  bearer_token = bearer_token, # bearer token 
                                  file = "harford_tweets"
)

# list out first 20 tweets 
head(harford_tweets$text, 20)

# extract tweets about vaccination
harford_vax <- harford_tweets %>%
  filter(grepl("vaccine | vax | VAX | covid | COVID | COVID-19| vac | vacuna | VACCINE | VACUNA | VAC | vaccination | VACCINATION | clinic | clinics", text))

# list out first 20 tweets
head(harford_vax$text, 50)

# add column for identifying county for merge later

harford_vax <- harford_vax %>%
  mutate(county=as.character("Harford County"))

# save dataframe

save(harford_vax,file="harford_vaxtweets.rda" )
rm(harford_tweets)


#### Howard County ----

howard_tweets <- get_user_tweets("HoCoHealth",  # users object 
                                  start_tweets = "2021-01-01T00:00:00Z", # start date
                                  end_tweets = "2021-06-22T00:00:00Z", # end date
                                  bearer_token = bearer_token, # bearer token 
                                  file = "howard_tweets"
)

# list out first 20 tweets 
head(howard_tweets$text, 20)

# extract tweets about vaccination
howard_vax <- howard_tweets %>%
  filter(grepl("vaccine | vax | VAX | covid | COVID | COVID-19| vac | vacuna | VACCINE | VACUNA | VAC | vaccination | VACCINATION | clinic | clinics", text))

# list out first 20 tweets
head(howard_vax$text, 50)

# add column for identifying county for merge later

howard_vax <- howard_vax %>%
  mutate(county=as.character("Howard County"))

# save dataframe

save(howard_vax,file="howard_vaxtweets.rda" )
rm(howard_tweets)


#### Montgomery County ----

montgomery_tweets <- get_user_tweets("MoCoDHHS",  # users object 
                                 start_tweets = "2021-01-01T00:00:00Z", # start date
                                 end_tweets = "2021-06-22T00:00:00Z", # end date
                                 bearer_token = bearer_token, # bearer token 
                                 file = "montgomery_tweets"
)

# list out first 20 tweets 
head(montgomery_tweets$text, 20)

# extract tweets about vaccination
montgomery_vax <- montgomery_tweets %>%
  filter(grepl("vaccine | vax | VAX | covid | COVID | COVID-19| vac | vacuna | VACCINE | VACUNA | VAC | vaccination | VACCINATION | clinic | clinics", text))

# list out first 20 tweets
head(montgomery_vax$text, 50)

# add column for identifying county for merge later

montgomery_vax <- montgomery_vax %>%
  mutate(county=as.character("Montgomery County"))

# save dataframe

save(montgomery_vax,file="montgomery_vaxtweets.rda" )
rm(montgomery_tweets)


#### Queen Anne's County ----

queenannes_tweets <- get_user_tweets("QACDOH",  # users object 
                                     start_tweets = "2021-01-01T00:00:00Z", # start date
                                     end_tweets = "2021-06-22T00:00:00Z", # end date
                                     bearer_token = bearer_token, # bearer token 
                                     file = "queenannes_tweets"
)

# list out first 20 tweets 
head(queenannes_tweets$text, 20)

# extract tweets about vaccination
queenannes_vax <- queenannes_tweets %>%
  filter(grepl("vaccine | vax | VAX | covid | COVID | COVID-19| vac | vacuna | VACCINE | VACUNA | VAC | vaccination | VACCINATION | clinic | clinics", text))

# list out first 20 tweets
head(queenannes_vax$text, 50)

# add column for identifying county for merge later

queenannes_vax <- queenannes_vax %>%
  mutate(county=as.character("Queen Anne's County"))

# save dataframe

save(queenannes_vax,file="queenannes_vaxtweets.rda" )
rm(queenannes_tweets)


#### St. Mary's County ----

stmarys_tweets <- get_user_tweets("SMCHD_gov",  # users object 
                                     start_tweets = "2021-01-01T00:00:00Z", # start date
                                     end_tweets = "2021-06-22T00:00:00Z", # end date
                                     bearer_token = bearer_token, # bearer token 
                                     file = "stmarys_tweets"
)

# list out first 20 tweets 
head(stmarys_tweets$text, 20)

# extract tweets about vaccination
stmarys_vax <- stmarys_tweets %>%
  filter(grepl("vaccine | vax | VAX | covid | COVID | COVID-19| vac | vacuna | VACCINE | VACUNA | VAC | vaccination | VACCINATION | clinic | clinics", text))

# list out first 20 tweets
head(stmarys_vax$text, 50)

# add column for identifying county for merge later

stmarys_vax <- stmarys_vax %>%
  mutate(county=as.character("St. Mary's County"))

# save dataframe

save(stmarys_vax,file="stmarys_vaxtweets.rda" )
rm(stmarys_tweets)


#### Somerset County ----
somerset_tweets <- get_user_tweets("somersethdmd",  # users object 
                                  start_tweets = "2021-01-01T00:00:00Z", # start date
                                  end_tweets = "2021-06-22T00:00:00Z", # end date
                                  bearer_token = bearer_token, # bearer token 
                                  file = "somerset_tweets"
)

# list out first 20 tweets 
head(somerset_tweets$text, 20)

# extract tweets about vaccination
somerset_vax <- somerset_tweets %>%
  filter(grepl("vaccine | vax | VAX | covid | COVID | COVID-19| vac | vacuna | VACCINE | VACUNA | VAC | vaccination | VACCINATION | clinic | clinics", text))

# list out first 20 tweets
head(somerset_vax$text, 50)

# add column for identifying county for merge later

somerset_vax <- somerset_vax %>%
  mutate(county=as.character("Somerset County"))

# save dataframe

save(somerset_vax,file="somerset_vaxtweets.rda" )
rm(somerset_tweets)


#### Talbot County ----
talbot_tweets <- get_user_tweets("TalbotHealth",  # users object 
                                   start_tweets = "2021-01-01T00:00:00Z", # start date
                                   end_tweets = "2021-06-22T00:00:00Z", # end date
                                   bearer_token = bearer_token, # bearer token 
                                   file = "talbot_tweets"
)

# NOTE: Only two tweets found.

rm(talbot_tweets)

#### 

# save dataframe

save(somerset_vax,file="somerset_vaxtweets.rda" )
rm(somerset_tweets)


#### Washington County ----
washington_tweets <- get_user_tweets("WashCoHealth",  # users object 
                                   start_tweets = "2021-01-01T00:00:00Z", # start date
                                   end_tweets = "2021-06-22T00:00:00Z", # end date
                                   bearer_token = bearer_token, # bearer token 
                                   file = "washington_tweets"
)

# NOTE: Only 11 tweets yielded; none COVID-related



#### Wicomico County ----
wicomico_tweets <- get_user_tweets("WicomicoHealth",  # users object 
                                   start_tweets = "2021-01-01T00:00:00Z", # start date
                                   end_tweets = "2021-06-22T00:00:00Z", # end date
                                   bearer_token = bearer_token, # bearer token 
                                   file = "wicomico_tweets"
)

# list out first 20 tweets 
head(wicomico_tweets$text, 20)

# extract tweets about vaccination
wicomico_vax <- wicomico_tweets %>%
  filter(grepl("vaccine | vax | VAX | covid | COVID | COVID-19| vac | vacuna | VACCINE | VACUNA | VAC | vaccination | VACCINATION | clinic | clinics", text))

# list out first 20 tweets
head(wicomico_vax$text, 50)

# add column for identifying county for merge later

wicomico_vax <- wicomico_vax %>%
  mutate(county=as.character("Wicomico County"))

# save dataframe

save(wicomico_vax,file="wicomico_vaxtweets.rda" )
rm(wicomico_tweets)


#### Worcester County ----
worcester_tweets <- get_user_tweets("WorcesterHealth",  # users object 
                                   start_tweets = "2021-01-01T00:00:00Z", # start date
                                   end_tweets = "2021-06-22T00:00:00Z", # end date
                                   bearer_token = bearer_token, # bearer token 
                                   file = "worcester_tweets"
)

# list out first 20 tweets 
head(worcester_tweets$text, 20)

# extract tweets about vaccination
worcester_vax <- worcester_tweets %>%
  filter(grepl("vaccine | vax | VAX | covid | COVID | COVID-19| vac | vacuna | VACCINE | VACUNA | VAC | vaccination | VACCINATION | clinic | clinics", text))

# list out first 20 tweets
head(worcester_vax$text, 50)

# add column for identifying county for merge later

worcester_vax <- worcester_vax %>%
  mutate(county=as.character("Worcester County"))

# save dataframe

save(worcester_vax,file="worcester_vaxtweets.rda" )
rm(worcester_tweets)


#### Baltimore City ----
baltimore_tweets <- get_user_tweets("BMore_Healthy",  # users object 
                                    start_tweets = "2021-01-01T00:00:00Z", # start date
                                    end_tweets = "2021-06-22T00:00:00Z", # end date
                                    bearer_token = bearer_token, # bearer token 
                                    file = "baltimore_tweets"
)

# list out first 20 tweets 
head(baltimore_tweets$text, 20)

# extract tweets about vaccination
baltimore_vax <- baltimore_tweets %>%
  filter(grepl("vaccine | vax | VAX | covid | COVID | COVID-19| vac | vacuna | VACCINE | VACUNA | VAC | vaccination | VACCINATION | clinic | clinics", text))

# list out first 20 tweets
head(baltimore_vax$text, 50)

# add column for identifying county for merge later

baltimore_vax <- baltimore_vax %>%
  mutate(county=as.character("Baltimore City"))

# save dataframe

save(baltimore_vax,file="baltimore_vaxtweets.rda" )
rm(baltimore_tweets)


#### Maryland GoVax ----
maryland_tweets <- get_user_tweets("GoVaxMD",  # users object 
                                    start_tweets = "2021-01-01T00:00:00Z", # start date
                                    end_tweets = "2021-06-22T00:00:00Z", # end date
                                    bearer_token = bearer_token, # bearer token 
                                    file = "maryland_tweets"
)

# list out first 20 tweets 
head(maryland_tweets$text, 20)

# extract tweets about vaccination
maryland_vax <- maryland_tweets %>%
  filter(grepl("vaccine | vax | VAX | covid | COVID | COVID-19| vac | vacuna | VACCINE | VACUNA | VAC | vaccination | VACCINATION | clinic | clinics", text))

# list out first 20 tweets
head(maryland_vax$text, 50)

# add column for identifying county for merge later

maryland_vax <- maryland_vax %>%
  mutate(county=as.character("Maryland"))

maryland_tweets <- maryland_tweets %>%
  mutate(county=as.character("Maryland"))

# save both dataframes

save(maryland_vax,file="maryland_vaxtweets.rda" )
save(maryland_tweets, file="maryland_tweets.rda")


### Developing dictionary of incentives/goods ----

# visually scan for info about incentives/goods

# Words that come up: 
# grocery 
# groceries
# free 
# giveaway
# prize
# food
# drink
# concert
# festival
# ice
# raffle
# lottery
# cash
# reward


#### Bind all dataframes to create one dataset with all county and state vax tweets labeled by county ----






