##################################################################
###                                                            ###
### Panda3D Configuration File -  Customized for FSMDev1    ###
###                                                            ###
##################################################################

# Alter display driver

load-display pandagl
#load-display pandadx

# These control the amount of output Panda gives for some various
# categories.  The severity levels, in order, are "spam", "debug",
# "info", "warning", and "fatal"; the default is "info".  Uncomment
# one (or define a new one for the particular category you wish to
# change) to control this output.

notify-level warning
default-directnotify-level warning

# Enable/disable performance profiling tool and frame-rate meter

want-pstats           f
show-frame-rate-meter t

# Alter window stuff

window-title FSM Test Harness #1
win-size  1024 768
win-origin 1300 50
fullscreen 0

# Framebuffer stuff

framebuffer-hardware true
framebuffer-multisample 1
framebuffer-depth true
framebuffer-alpha true
framebuffer-mode rgba double-buffer depth hardware multisample

# Other stuff

compress-textures 1
screenshot-extension png

#client-sleep 0.01
show-frame-rate-meter t
background-color 1.0 0.10 0.20

# Wether or not to use the print log and print log filename

UsePrintLogFile false
PrintLogFilename FSMDev1.print.log

# Experiment data path

ExperimentDataPath Configurations/Default

# Databases paths.

model-path .
model-path $THIS_PRC_DIR/Configurations/Default

sound-path .
sound-path $THIS_PRC_DIR/Configurations/Default

texture-path .
texture-path $THIS_PRC_DIR/Configurations/Default

