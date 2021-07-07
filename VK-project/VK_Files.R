#Clean the global env
rm(list = ls())

#Installation of required packages
#install.packages("devtools")
#install.packages("bigrquery")
#install.packages("rvkstat")

library(rvkstat)
library(bigrquery)

#Authentication with VK via VK API
token <- vkAuth(app_id=, app_secret="")
access_token = ""

# Extract the data about users by gender and age group
communityDataGenderAge <- vkGetGroupStatGenderAge(date_from = "2018-10-01",
                                                  date_to = "2021-01-01",
                                                  group_id = ,
                                                  access_token = token$access_token)

# Extract the data about users by cities
communityCity <- vkGetGroupStatCity(date_from = "2018-10-01",
                                    date_to = "2021-01-01",
                                    group_id = ,
                                    access_token = token$access_token)
  
# Extract the data about users by countries
communityCountry <- vkGetGroupStatCountries(date_from = "2018-10-01",
                                            date_to = "2021-01-01",
                                            group_id = ,
                                            access_token = token$access_token)

# Extract the main statistics 
communityStats <- vkGetGroupStat(date_from = "2018-10-01",
                                 date_to = "2021-01-01",
                                 group_id = ,
                                 access_token = token$access_token)

# Connect to Big Query
# authenticate with json file
bigrquery::bq_auth(path = 'Name.json')

# set project ID and dataset name
project_id <- ""
dataset_name <- 'communityDataGenderAge'

## TABLE 1
# Also, we need to create dataset with 'communityDataGenderAge' name in Big Query Console
# Create total reference
GenderAge_table <- bq_table(project = project_id, dataset = dataset_name, table = 'GenderAge')
# create table
GenderAge_table <- bq_table_create(GenderAge_table, fields = communityDataGenderAge)
# Upload the dataset to Big Query
bq_table_upload(x = GenderAge_table, 
                values = communityDataGenderAge, 
                fields = as_bq_fields(communityDataGenderAge),
                create_disposition='CREATE_IF_NEEDED', 
                write_disposition='WRITE_APPEND')

## TABLE 2
# Also, we need to create dataset with 'communityCity' name in Big Query Console
# Create total reference
communityCity_table <- bq_table(project = project_id, dataset = dataset_name, table = 'City')
# create table
communityCity_table <- bq_table_create(communityCity_table, fields = communityCity)
# Upload the dataset to Big Query
bq_table_upload(x = communityCity_table, 
                values = communityCity, 
                fields = as_bq_fields(communityCity),
                create_disposition='CREATE_IF_NEEDED', 
                write_disposition='WRITE_APPEND')

## TABLE 3
# Also, we need to create dataset with 'communityCountry' name in Big Query Console
# Create total reference
Country_table <- bq_table(project = project_id, dataset = dataset_name, table = 'Country')
# create table
Country_table <- bq_table_create(Country_table, fields = communityCountry)
# Upload the dataset to Big Query
bq_table_upload(x = Country_table, 
                values = communityCountry, 
                fields = as_bq_fields(communityCountry),
                create_disposition='CREATE_IF_NEEDED', 
                write_disposition='WRITE_APPEND')

## TABLE 4
# Also, we need to create dataset with 'communityStats' name in Big Query Console
# Create total reference
Stats_table <- bq_table(project = project_id, dataset = dataset_name, table = 'Stats')
# create table
Stats_table <- bq_table_create(Stats_table, fields = communityStats)
# Upload the dataset to Big Query
bq_table_upload(x = Stats_table, 
                values = communityStats, 
                fields = as_bq_fields(communityStats),
                create_disposition='CREATE_IF_NEEDED', 
                write_disposition='WRITE_APPEND')

#Export files in csv format
write.csv(communityCountry, "/Users/username/Desktop/communityCountry.csv", row.names = FALSE)
write.csv(communityStats, "/Users/username/Desktop/communityStats.csv", row.names = FALSE)
write.csv(communityDataGenderAge, "/Users/username/Desktop/communityDataGenderAge.csv", row.names = FALSE)
