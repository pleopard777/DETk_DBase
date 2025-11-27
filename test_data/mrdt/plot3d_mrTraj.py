#!/usr/bin/python
"""
  3D Trajectory Plotter (for Mini-Rocket output)

    Developed by:  Michael Fennell, DESE Research Inc.
    Version: 1.0  (18-Sep-2024)

    (Requires:  Python 3, Numpy, and Matplotlib)
"""
import matplotlib as mpl
from mpl_toolkits.mplot3d import Axes3D
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.ticker import (FormatStrFormatter)

import sys
#from pUtil_mr import *

def getFieldNum( data, line):
  """ Given OutputRun0.dat in data and a list of 
      names (line), return a list of integers for where each member of 
      line occurs in data.
  """
  n_list = [-1] * len( line)
  #var_names = string.split( data[1])  #py27
  var_names = data[1].split()
  j = 0
  for name in var_names:
    for id in line:
      #if( string.find( name, id) > -1):  #py27
      if( name.find(id) > -1):
        n_list[ line.index( id)] = j
    j = j + 1
  return n_list

#----------------------------------
if __name__ == "__main__":

  # Read user input (provide syntax help if needed)
  if len( sys.argv) == 2:
    sfname = sys.argv[1]
    print('\nPlotting 3D Trajectory from Mini-Rocket run:  ', sfname, ' \n')
  else:
    print( '\nPlease run again...\n')
    print( 'Syntax:  plot3d_mrTraj.py  filename')
    print( 'where, ')
    print( '  filename is the sim output file to process')
    print( ' ')
    sys.exit()
  
  #---- Open & load data ----
  fin = open( sfname, 'r')
  data = fin.readlines()
  fin.close()

  # identify fields to extract data from
  name = ['time', 'pos_ml_ENUx', 'pos_ml_ENUy', 'pos_ml_ENUz']
  
  vn = getFieldNum( data, name)
  print( name)
  print( vn)
  
  time=[]
  pml_E=[]
  pml_N=[]
  pml_U=[]
  
  # extract data starting at t=0
  for line in data[2:]:
    #value = string.split( line) #py27
    value = line.split()
    time.append( float( value[ vn[0]]) )
    pml_E.append( float( value[ vn[1]]) )
    pml_N.append( float( value[ vn[2]]) )
    pml_U.append( float( value[ vn[3]]) )

  #---- Make 3d Trajectory plot ----
  x  = np.array( pml_E)
  y  = np.array( pml_N)
  z  = np.array( pml_U) 

  mpl.rcParams['legend.fontsize'] = 10
  mpl.rcParams['axes.labelpad'] = 10
  
  fig = plt.figure()
  #ax = fig.gca(projection='3d')  #py27
  ax = fig.add_subplot(projection='3d')
  ax.set_title('Mini-Rocket Trajectory')
  ax.plot(x, y, z, label= sfname)
  ax.legend(loc='upper center')
  
  # Find abs max, if less than "minVal", scale axes
  minVal = 5.0  #meters
  x_max = np.absolute(x).max()
  if x_max < minVal:
    ax.set_xlim(-25,25)
  
  y_max = np.absolute(y).max()
  if y_max < minVal:
    ax.set_ylim(-25,25)
  
  z_max = np.absolute(z).max()
  if z_max < minVal:
    ax.set_zlim(-25,25)
  
  ax.set_xlabel('EAST  (m)')
  ax.set_ylabel('NORTH  (m)')
  ax.set_zlabel('UP  (m)')
  
  # Adjusts axes to display as  x10^3 meters
  plt.ticklabel_format(style='sci', scilimits=(3,3), useMathText=True)
  plt.show()
