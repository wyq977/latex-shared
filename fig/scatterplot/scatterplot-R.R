library(ggplot2)
library(latex2exp)

w <- 2.8
h <- 2.1

x_values <- seq(from = -20, to = 20, length.out = 1000)

data_old <- data.frame(
  x = x_values,
  y = dnorm(x_values)
)

data_new <- data.frame(
  x = x_values,
  y = dnorm(x_values, mean = 0, sd = 4)
)


p <- ggplot() +
  geom_line(data = data_old, aes(x = x, y = y, colour = "red"), 
            linewidth = 1 / .pt) +
  geom_line(data = data_new, aes(x = x, y = y, colour = "blue"), 
            linewidth = 1 / .pt) +
  theme_classic(base_family = "Times New Roman", base_size = 8) +
  xlab(paste("R and LaTex:", expression(x))) +
  ylab(TeX(r'(R and LaTex: $y$)')) +
  coord_cartesian(clip = "off") +
  theme(
    plot.margin = margin(1, 1, 1, 1, unit = "pt"),
    panel.border = element_rect(colour = "black", fill = NA, linewidth = 0.4 / .pt),
    axis.line = element_blank(),
    axis.ticks = element_line(linewidth = 0.4 / .pt), 
    axis.ticks.length = unit(3, "pt"),
    legend.position = c(0.8, 0.8),
    legend.background = element_rect(fill = NA, colour = "black", linewidth = 0.4 / .pt),
    legend.key = element_rect(fill = NA),
    legend.key.size = unit(2, 'cm'),
    legend.text = element_text(colour = "black", family = "Times New Roman"),
    legend.title = element_blank()
  )
  

ggsave("scatterplot-R.pdf", p, width=w, height=h, units="in", device=cairo_pdf)