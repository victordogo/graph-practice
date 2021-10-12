library(tidyverse)
library(lubridate)

# Lendo banco e limpando

spbr <- readr::read_csv2("2021-10/2021-10-12-brasileirao-saopaulo/data/brasileirao.csv") |>
  filter(Mandante=="São Paulo" | Visitante=="São Paulo") |>
  mutate(Temporada = year(Data), .keep="unused", .before=`Horário`) |>
  select(Temporada, Mandante, Visitante, `Mandante Placar`, `Visitante Placar`) |>
  rename(temp=Temporada, casa=Mandante, fora=Visitante,
         gols_casa=`Mandante Placar`, gols_fora=`Visitante Placar`) |>
  mutate(gols_feitos=ifelse(casa=="São Paulo",gols_casa,gols_fora),
         gols_sofridos=ifelse(casa!="São Paulo",gols_casa,gols_fora)) |>
  select(temp, casa, fora, gols_feitos, gols_sofridos)

write_csv2(spbr, "2021-10/brasileirao-saopaulo/data/spbr_limpo.csv")

# Fazendo banco com sumário de media de gols feitos/sofridos

spbr_resumo <- spbr |>
     group_by(temp) |>
     summarise(media_gols_feitos=sum(gols_feitos)/n(),
               media_gols_sofridos=sum(gols_sofridos)/n())

write_csv2(spbr_resumo, "2021-10/brasileirao-saopaulo/data/spbr_resumo.csv")
