import numpy as np
from matplotlib.colors import ListedColormap

def interpolate_between_two_colors(c1, c2, n_levels=2, alpha=1.):
    
    color_list = []
    for p in np.linspace(0., 1., n_levels)[::-1]:
        c = np.concatenate((p * c1 + (1-p)* c2, np.array([alpha])))
        color_list.append(c)
        
    return color_list

color1 = np.array([36, 175, 255])/255
color2 = np.array([255, 44, 171])/255
colors_interp = interpolate_between_two_colors(color1, color2, n_levels=100, alpha=.5)
custom_cmap = ListedColormap(colors_interp)