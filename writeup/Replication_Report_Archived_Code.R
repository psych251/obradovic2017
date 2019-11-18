# Replication Report Archive! 

# Reverse "acting out" Hightower items (so that higher scores indicate greater EF)
for (j in paste0("tcrs_ao", 1:6)) {
  tcrs[ , paste0(j, "r")] <- as.integer(6 - tcrs[ , j])
}

# Another method...
tcrs = tcrs %>% 
  mutate(tcrs_ao1r = 6 - tcrs_ao1,
         tcrs_ao2r = 6 - tcrs_ao2, 
         tcrs_ao3r = 6 - tcrs_ao3,
         tcrs_ao4r = 6 - tcrs_ao4,
         tcrs_ao5r = 6 - tcrs_ao5,
         tcrs_ao6r = 6 - tcrs_ao6
  )

# Reverse all BRIEF items (so that higher scores indicate greater EF)
for (j in grep("brief", names(tcrs), value=TRUE)) {
  tcrs[ , paste0(j, "r")] <- as.integer(2 - tcrs[ , j])
}

# Add columns with each item's z-score
for (j in hybrid_vars) {
  hybrid[ , paste0(j, "_z")] <- as.numeric(scale(hybrid[ , j]))
}

# Remove rows with no data 
hybrid <- hybrid[nvalid(hybrid[ , hybrid_vars]) > 0, ]

# Check out descriptive statistics
hybrid %>% 
  select(-stud_id) %>%
  summarise()