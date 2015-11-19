"""
   Data Analysis of Magnetic Field Calculation from GetDP FEM calculations
   Abhishek Sharma, 19th Aug, 2012
"""

import numpy as np 
from mayavi.mlab import *
from mayavi import mlab

# Reading Data File
data = np.genfromtxt("b2.pos")
fidata = np.genfromtxt("phi2.pos")

print np.shape(data)
print np.shape(fidata)

X, Y, Z = data[:,0], data[:,1], data[:,2]
Bx, By, Bz = data[:,3], data[:,4], data[:,5]
BMag = np.sqrt(Bx*Bx + By*By +  Bz*Bz)


phi = np.reshape(fidata[:,3], (21, 21, 21))

reshapeBX = np.reshape(Bx, (21, 21, 21))
reshapeBY = np.reshape(By, (21, 21, 21))         
reshapeBZ = np.reshape(Bz, (21, 21, 21))         

# Using MLAB for creating Vector Field Plot and Potential contour plot
#
# plot-type = 1  : Contour Plot
# plot-type = 2  : Vector Plot
# plot-type = 3  : IsoSurface Plot
# plot-type = 4  : StreamLines
# plot-type = 5  : Interactive

plotType = 3

fig = figure(fgcolor=(0,0,0), bgcolor=(1,1,1)) 

if (plotType == 1):

  # mlab.pipeline.volume(mlab.pipeline.scalar_field(phi))                                                                                                                                                                                                        
  # mlab.pipeline.volume(mlab.pipeline.scalar_field(phi), vmin=0, vmax=0.8)

  mlab.pipeline.image_plane_widget(mlab.pipeline.scalar_field(phi),
                            plane_orientation='x_axes',
                            slice_index=11,)
                            
  mlab.pipeline.image_plane_widget(mlab.pipeline.scalar_field(phi),
                            plane_orientation='y_axes',
                            slice_index=11,)
                            
  mlab.pipeline.image_plane_widget(mlab.pipeline.scalar_field(phi),
                            plane_orientation='z_axes',
                            slice_index=11,)
                                                                                      
                            
  mlab.outline()

if (plotType == 2):
                                                                               
  # obj = quiver3d(X, Y, Z, Bx, By ,Bz)
  src = mlab.pipeline.vector_field(reshapeBX, reshapeBY, reshapeBZ)
  mlab.pipeline.vector_cut_plane(src, mask_points=2, scale_factor=3)

if (plotType == 3):
  
  src = mlab.pipeline.vector_field(reshapeBX, reshapeBY, reshapeBZ)
  magnitude = mlab.pipeline.extract_vector_norm(src)
  mlab.pipeline.iso_surface(magnitude, contours=[1.9, 0.3])
  
if (plotType == 4):

  flow = mlab.flow(reshapeBX, reshapeBY, reshapeBZ, 
                    seedtype = 'plane',
                    seed_scale=1.0,
                    seed_resolution=20,
                    seed_visible = False,
                    integration_direction='both')  

if (plotType == 5):

  src = mlab.pipeline.vector_field(reshapeBX, reshapeBY, reshapeBZ)
  magnitude = mlab.pipeline.extract_vector_norm(src)

  iso = mlab.pipeline.iso_surface(magnitude, contours=[1.9, 0.3], opacity=0.3)

  vec = mlab.pipeline.vectors(magnitude, mask_points=60,
                                      line_width=1,
                                      color=(.8, .8, .8),
                                      scale_factor=3.)
  """
  flow = mlab.pipeline.streamline(magnitude, seedtype='plane',
                                        seed_visible=False,
                                        seed_scale=0.5,
                                        seed_resolution=20,
                                        linetype='line',)
  """
  vcp = mlab.pipeline.vector_cut_plane(magnitude, mask_points=2,
                                        scale_factor=4,
                                        colormap='jet',
                                        plane_orientation='z_axes')


xlab = xlabel("x")	 		# set the labels
ylab = ylabel("y")
zlab = zlabel("z")
showm = show() 				# show everything
axesm = axes() 				# add some axes  
axesm.axes.y_axis_visibility = False 	# remove the z-axis (named y for some MayaVi reason)
fig.scene.z_plus_view() 		# let's look at it from the top!
fig.scene.parallel_projection = True 	# and we don't need any projection when looking at it in 2D
print "Done."


