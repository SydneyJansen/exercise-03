read.csv("C:/Users/Wildc/Downloads/IMDB-movies.csv")
f<-("C:/Users/Wildc/Downloads/IMDB-movies.csv")
d<-read.csv(f, sep = ",", header = TRUE, stringsAsFactors = FALSE)
print(d)
names(d)
#add variable and pipe it first to itself 
d<-d |> mutate(comedy=if_else(str_detect(genres,"Comedy"), TRUE, FALSE))
#output the total number of total number of comedy
s<-d|>filter(comedy==TRUE)
nrow(s)
#alternative
#summarise(count=n(),num_Comedy=sum(Comedy, na.rm=TRUE))->s

#add new variable ranking low
d <- d |> 
  mutate(ranking = case_when(
    averageRating <= 3.3 ~ "low",
    averageRating <= 6.7 ~ "med",
    TRUE ~ "high"
  ))

library(dplyr)

s <- d |>
  group_by(ranking) |>
  summarise(
    count = n(),
    avg_time = mean(runtimeMinutes, na.rm = TRUE)
  )
#loops for culmative running time
t <- 0
for(i in 1:nrow(d)) {
  # Accumulate 'runtimeMinutes' if not NA
  t <- ifelse(is.na(d$runtimeMinutes[i]), t, t + d$runtimeMinutes[i])
}

print(t)
#easier wat to get the total
cumsum(replace_na(d$runtimeMinutes,0))
for(name in c("a","b","c")){
  d<-read_csv(name,col_names = TRUE)
  #read in another file
}

