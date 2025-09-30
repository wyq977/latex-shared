library(ggplot2)

w <- 2.8
h <- 2.1

p <- ggplot(mtcars, aes(mpg, wt)) +
  geom_point(size = 0.5) +
  theme_classic(base_family = "Times New Roman", base_size = 8) +
  xlab("sample size") +
  ylab("supermartingale (log scale)") +
  coord_cartesian(clip = "off") +
  theme(
    plot.margin = margin(0, 0, 0, 0, unit = "pt"),
    panel.border = element_rect(colour = "black", fill = NA, linewidth = 0.4 / .pt),
    axis.line = element_blank()
  )
  

ggsave("scatterplot-R.pdf", p, width=w, height=h, units="in", device=cairo_pdf)