library(tidyverse)

# fazendo gráfico

dados <- readr::read_csv2("2021-10/2021-10-12-brasileirao-saopaulo/data/spbr_resumo.csv")

dados |>
  ggplot(aes(x = media_gols_feitos, y = media_gols_sofridos))+
  geom_point()+
  scale_y_reverse()
