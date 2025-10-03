library(ggplot2)

data_plot <- data.frame(
  x = rep(seq(-20, 20, length.out = 1000), 2),
  y = c(dnorm(seq(-20, 20, length.out = 1000), mean = 0, sd = 1), 
        dnorm(seq(-20, 20, length.out = 1000), mean = 0, sd = 4)),
  distribution = rep(c("N(0, 1)", "N(0, 4)"), each = 1000)
)

p <- ggplot(data_plot, aes(x = x, y = y, colour = distribution)) +
  geom_line() +
  theme_classic(base_family = "Times New Roman", base_size = 8) +
  scale_color_manual(values = c("N(0, 1)" = "red", "N(0, 4)" = "blue")) +
  labs(
    x = "x",
    y = "y",
    colour = "Distribution" 
  ) +
  theme(legend.position = c(0.8, 0.8))

ggsave("scatterplot-R.pdf", p, width = 2.8, height = 2.1, units = "in", device = cairo_pdf)