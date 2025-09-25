library(ggplot2)

w <- 6.4
h <- 4.8

p <- ggplot(mtcars, aes(mpg, wt)) +
  geom_point(size = 0.5) +
  theme_classic(base_family = "Times New Roman", base_size = 8) +
  xlab("sample size") +
  ylab("supermartingale (log scale)") +
  coord_cartesian(clip = "off") +
  theme(
    plot.margin = margin(5.5, 5.5, 5.5, 5.5, unit = "pt"),
    # 1. ADD a panel border for the box
    panel.border = element_rect(colour = "black", fill = NA, linewidth = 0.4 / .pt),
    # 2. REMOVE the default axis lines to prevent overlap
    axis.line = element_blank()
  )
  

ggsave("scatterplot-R.pdf", p, width=w, height=h, units="cm", device=cairo_pdf)
