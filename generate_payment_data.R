set.seed(20190729)

payments <- tibble(id = rep(1:4460, 12),
                   month = rep(seq.Date(from = as.Date("2018-01-01"), 
                                    to = as.Date("2018-12-31"), 
                                    by = "month"),
                               each = 4460),
                   made_payment = sample(c("yes", "no"),
                                         size = 4460*12,
                                         replace = TRUE,
                                         prob = c(.9, .1))) %>% 
  mutate(source = case_when(made_payment == "no" ~ NA_character_,
                            made_payment == "yes" ~ sample(c("bank transfer", "check", "credit card"),
                                                           size = 4460*12,
                                                           replace = TRUE))) %>% 
  filter(id %in% sample(1:4460, size = 4400))

writexl::write_xlsx(payments, "payments.xlsx")
