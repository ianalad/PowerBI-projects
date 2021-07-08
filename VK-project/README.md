# VK Project

The purpose of this project is to collect the data about one VK group (the name of the group will remain anonymous) and to analyze it using Microsoft Power BI data visualization tool.

## Description

This project is based on 3 main steps:
* Collect the data via VK API in R Studio
* Upload the collected data from R Studio to Google's Big Query via Big Query API
* Connect Power BI to Big Query to obtain the data and visualize it

## Getting Started

### Dependencies

In order to collect the data and to push it further to Big Query the following R packages are to be utilized:
* bigrquery
* rvkstat

In order to install these packages in R Studio, make sure you use these commands to get started:
```bash
install.packages("bigrquery")
install.packages("rvkstat")
```

### Installing

* Install R Studio 
* Get VK token for a group. Details of how it can be done are available here: https://vk.com/dev/access_token
* Get JSON file to make the authentication with Big Query from R Studio. More details about possible ways of authentication are available here: 
https://bigrquery.r-dbi.org/reference/bq_auth.html
* Install Microsoft Power BI and use it to connect to Big Query database (if there are issues with the login, make sure you check the settings of your Google account)

### Executing program

* For VK authentication, make sure you use app_id, app_secret, and access_token of your Group. Additionally, you will need group_id. More info about group_id and other related parameters can be found here: https://vk.com/dev.php?method=stats.get
* Before uploading tables to Big Query, make sure you provide the right names of tables you want to have.

## Authors

Iana Ladygina

## License

This project is licensed under the MIT License - see the LICENSE.md file for details