#############################################################
###                                                       ###
### Panda3D Configuration File - TckViz001          ###
###                                                       ###
#############################################################

# These control the amount of output Panda gives for some various
# categories.  The severity levels, in order, are "spam", "debug",
# "info", "warning", and "fatal"; the default is "info".  Uncomment
# one (or define a new one for the particular category you wish to
# change) to control this output.

notify-level fatal
#default-directnotify-level warning
#notify-level warning

# Enable/disable performance profiling tool and frame-rate meter

#want-pstats           f
show-frame-rate-meter t

just-a-test 3.14

# Alter display driver

load-display pandagl
#load-display pandadx

# Alter window stuff

win-size 1260 1010
fullscreen 0
window-title MLRS TCK Visualization

# Framebuffer stuff

framebuffer-hardware true
framebuffer-multisample 1
framebuffer-depth true
framebuffer-alpha true
framebuffer-mode rgba double-buffer depth hardware multisample

# Other stuff

compress-textures 1
screenshot-extension png
background-color 1.0 0.10 0.20 4

#client-sleep 0.01

# Databases paths.

model-path F:\local\noscm\dbase\2006-11-29 Common Simulation DBase
#model-path $THIS_PRC_DIR/Configurations/Common Data/Fonts
#sound-path $THIS_PRC_DIR/Configurations/Common Data/Audio
#texture-path $THIS_PRC_DIR//Configurations/Common Data/Textures
