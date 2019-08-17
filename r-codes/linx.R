library(httr)
library(data.table)
library(dplyr)
library(utils)
library(tidyverse)


setwd("C:/Users/logonrmlocal/Downloads")

curl_lines <- read_lines("url_cat_lines.txt")
df <- data.frame(
  encrypted_domain = as.character(),
  encrypted_cnpj = as.character(),
  encrypted_saleid = as.character(),
  dateTime = as.character(),
  productTotal = as.character(),
  prod_fullname = as.character(),
  encrypted_buyer_cpf = as.character(),
  encrypted_buyer_cnpj = as.character(),
  stringsAsFactors = FALSE
)
count <- 1

for (url in curl_lines) {
  df_url <- fread(url)
  df <- rbind(df, df_url)
  print(count)
  count <- count + 1
}

write.csv2(df, "linx_all_transactions.csv")
save(df, file = "linx_all_transactions.RData")
