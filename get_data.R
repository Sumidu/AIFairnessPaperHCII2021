# Get Raw data

library(osfr)
osf_id <- "9x6cj"

filename <- osf_retrieve_file(osf_id)
osf_download(filename, "data", conflicts = "overwrite")


