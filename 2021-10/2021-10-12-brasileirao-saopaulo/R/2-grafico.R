library(tidyverse)

# library(camcorder)
# gg_record(dir="2021-10/2021-10-12-brasileirao-saopaulo/img/gif",device="png",dpi=300)

# fazendo gráfico

dados <- readr::read_csv2("2021-10/2021-10-12-brasileirao-saopaulo/data/spbr_resumo.csv")

dados |>
  ggplot(aes(x = media_gols_feitos, y = media_gols_sofridos))+
  geom_point()+
  scale_y_reverse()
