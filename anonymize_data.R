# Get Raw data

library(osfr)
osf_id <- "gc528"

# Works only when OSF_PAT is available and access is given
osf_auth()

filename <- osf_retrieve_file(osf_id)
osf_download(filename, "data")

library(tidyverse)
library(haven)

raw <- read_sav("data/rawdata.sav")

anonymized <- raw %>% 
  select(-IPAddress, -StartDate, -EndDate, -RecordedDate,
         ResponseId, -starts_with("Recipient"), 
         -starts_with("Location"), -DistributionChannel, -UserLanguage,
         -ExternalReference
         ) %>% 
  filter(Status == 0) %>% 
  select(-Status)

write_rds(anonymized, "data/anonymized.sav")


