# Leiden stemmen

library(data.table)
library(tidyverse)

leiden <- fread("https://data.overheid.nl/data/dataset/ef62f39e-b581-4084-92c8-dc99a358af6b/resource/29fc87be-cdbd-4500-a0ac-ce19cc028561/download/gldnlcslcsspeciaalstatistiekverkiezingendataleiden-verkiezingen-vanaf-2002---stembureaus-uitslag.csv")

leiden %>%
  filter(soort == "GR") %>%
  group_by(jaar, partij) %>%
  summarise(stemmen_totaal = sum(stemmen)) %>%
  ggplot(aes(jaar, stemmen_totaal, group = partij)) + geom_line(aes(color = partij), size = 1) +
  theme(legend.position = "bottom")