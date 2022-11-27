

@transform_pandas(
    Output(rid="ri.foundry.main.dataset.49397b84-0a01-45a6-991c-b4cbcf33d2ca"),
    person=Input(rid="ri.foundry.main.dataset.39142f4a-4e55-499c-a79a-92b7ba64b13f")
)
# this is a basic plot example
library(ggplot2)

plot_person <- function(person) {
    p <- ggplot(person) +
      geom_histogram(aes(x = year_of_birth))

    plot(p)
    
    return(NULL)
}

