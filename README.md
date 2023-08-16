# chART
This is a collection of functions for making nice scientific plots. I make it for myself, so its not exhaustive, and its always a work in progress. 


## How it works

### Plot properties
Plots should have consistent formatting, so every plotting function takes as a final input variable plotProperties. Inside the folder "Properties", there are some example formats that I use, and an empty template. To call the format, just run `load_plot_properties({FormatTitle})` These properties are assembled into a MATLAB structure. Alternatively, you could recreate the structure with just the fields you need for a given plot (not recommended).



## External references

- external.colorcet