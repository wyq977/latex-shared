# Define the x-values for the plot
x_values <- seq(from = -15, to = 15, length.out = 500)

# Calculate the probability density function (PDF) for two normal distributions
y1_values <- dnorm(x_values, mean = 0, sd = 1)
y2_values <- dnorm(x_values, mean = 0, sd = 4)

# Combine the data into a single data frame
plot_data <- data.frame(
  x = x_values,
  y1 = y1_values,
  y2 = y2_values
)

# --- CORRECTED LINE ---
# Save the data, removing quotes AND setting the end-of-line character
write.csv(
  plot_data, 
  "data.csv", 
  row.names = FALSE, 
  quote = FALSE, 
  eol = "\n"
)

# Optional: Print a confirmation message
print("data.csv has been re-saved without quotes and with corrected line endings.")