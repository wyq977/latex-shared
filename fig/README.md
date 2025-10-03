# Plotting

The goal is to have consistent figures across different languages.
This is usually hard, so it's best to plot everything in R or python only

Assumptions:
* width is 2.8 in and height is 2.1 in.
* no titles, should be set in LaTeX
* legends: TODO

## Python

* font use Times New Roman, size 8, number using CM
* x y tick size 6
* legend font 6
* no padding, spacing will be given in LaTeX

rcParam is saved in `~/.matplotlib/matplotlibrc`, [config](https://matplotlib.org/stable/users/explain/customizing.html)

## R

In the end, it's not worth and also go against the ggplot2's idea to
manually set all the elements.

One difficulty is the text render in R, the expression can not be displayed in math

## TikZ

The only issue is that the output pdf is not in the width and height defined,
but it is not worth the efforts. 

https://tex.stackexchange.com/questions/699336/how-to-set-the-exact-width-and-height-of-tikzpicture-with-pgfplots