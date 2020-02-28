plot_relativities <- function(relativities, variable) {
  sep_regex <- paste0("(?<=", variable, ")(?=.)")
  
  relativities %>% 
    filter(grepl(variable, term)) %>% 
    separate(term, into = c("variable", "level"), sep = sep_regex) %>%
    ggplot(aes(x = level, y = relativity)) +
    geom_boxplot() +
    theme_bw()
}