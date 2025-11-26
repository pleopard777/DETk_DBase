# Standard imports

import sys
import os

# Panda imports

from direct.gui.OnscreenText import OnscreenText 
from direct.showbase import DirectObject
from direct.showbase.DirectObject import DirectObject
import direct.directbase.DirectStart
from direct.task import Task
from pandac.PandaModules import *

# DESE imports

from DESE.Core.Properties import *
from DESE.Core.Diagnostics import *
from DESE.P3D.Utilities import CreateTextLabel
from DESE.P3D.Shapes import P3DCreateGridXY,P3DCreateGridYZ,P3DCreateGridXZ
from DESE.P3D.TerraViz02.SceneNavigator import SceneNavigator
from DESE.Math.BoundingVolume import *
from DESE.Math.Utilities import *

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 

class World(DirectObject):
	def getBoundingVolume(self):
		return BoundingVolume(\
				0,0,0,\
				self.__WorldDims[0],\
				self.__WorldDims[1],\
				self.__WorldDims[2]
			)

	def getElevation(self,x,y):
		return 0;

	def postStatusMessage(self,msg):
		print msg
		self.mMessageDisplay.setText("> "+msg)
		taskMgr.doMethodLater(
			1.2,
			self.clearStatusDisplay,
			'',extraArgs =[]
		)

	def clearStatusDisplay(self):
		self.mMessageDisplay.setText("> ")

	def joystick(self):
		return None

	def environmentModel(self):
		return self

	def __init__(self):
		# Setup basics
		wp = WindowProperties()
		wp.setTitle("Visualization")
#		wp.setCursorHidden(1)
		base.win.requestProperties(wp)
		getModelPath().appendPath(os.getcwd()) 
		getTexturePath().appendPath(os.getcwd()) 
		getSoundPath().appendPath(os.getcwd()) 

		# Setup events
		self.accept('p',self.snapShot)

		text = 'EAPS Mortar Target Development Harness'
		color = (1,1,0,1)
		self.mTextDisplay1 = CreateTextLabel(text,color,1)
		self.mMessageDisplay = CreateTextLabel('> ',(0,1,0,1),2)

		base.setBackgroundColor(0,0.1,0.6,1)

		# Setup world size
		self.__WorldDims = [10,10,10]
		maxWorldDim = \
			Max(\
				Max(self.__WorldDims[0],self.__WorldDims[1]),
				self.__WorldDims[2]
			)

		# Setup navigator
		base.camLens.setFar(maxWorldDim*5.0)
		base.camLens.setFov(75)
		self.__Nav = SceneNavigator(self)
		self.__Nav.setPitchGain(0.4)
		self.__Nav.setYawGain(0.4)
		self.__Nav.setRollGain(0.2)
		self.__Nav.setMotionGain(maxWorldDim*0.0005)

		# Setup lighting
		lightAttribute = LightAttrib.makeAllOff()
		dirLight = DirectionalLight('DirLight')
		dirLight.setColor(Vec4(0.6,0.6,0.6,1.0))
		dirLightNP = render.attachNewNode(dirLight.upcastToPandaNode()) # crashes without upcast
		dirLightNP.setPos(Vec3(0.0,-10.0,10.0))
		dirLightNP.setHpr(Vec3(0.0,-26.0,0.0))
		lightAttribute = lightAttribute.addLight(dirLight) # add to attribute
		ambientLight = AmbientLight('ambientLight')
		ambientLight.setColor(Vec4(0.25,0.25,0.25,1.0))
		ambientLightNP = render.attachNewNode(ambientLight.upcastToPandaNode())
		lightAttribute = lightAttribute.addLight(ambientLight)
		render.node().setAttrib(lightAttribute)

		# Setup scene
		axes = loader.loadModel("Axes3D")
		Assert(axes!=None,"Failed loading axes model")
		axes.setScale(maxWorldDim,maxWorldDim,maxWorldDim)
		axes.reparentTo(render)

		conc = loader.loadModel("ConcTex")
		Assert(conc!=None,"Failed loading conc model")
		conc.setScale(maxWorldDim,maxWorldDim,maxWorldDim)
		conc.reparentTo(render)

		g1 = P3DCreateGridXY(10,10,1,True)
		g1.setColor(1,0,0)
		g1.setScale(\
				self.__WorldDims[0],\
				self.__WorldDims[1],\
				self.__WorldDims[2]
			)
		g1.setLightOff()
		g1.setTwoSided(True)
		g1.reparentTo(render)

		g2 = P3DCreateGridYZ(10,10,1,True)
		g2.setColor(0,0,1)
		g2.setScale(\
				self.__WorldDims[0],\
				self.__WorldDims[1],\
				self.__WorldDims[2]
			)
		g2.setLightOff()
		g2.setTwoSided(True)
		g2.reparentTo(render)

		g3 = P3DCreateGridXZ(10,10,1,True)
		g3.setColor(0,1,0)
		g3.setScale(\
				self.__WorldDims[0],\
				self.__WorldDims[1],\
				self.__WorldDims[2]
			)
		g3.setLightOff()
		g3.setTwoSided(True)
		g3.reparentTo(render)

		self.setupKeyBindings()
		taskMgr.add(self.timeUpdate,'TimeUpdate')

	def timeUpdate(self,task):
		self.__Nav.tickUpdate()
		return Task.cont

	def snapShot(self):
		base.screenshot('Snap')
		self.postStatusMessage("Snapshot Saved")

	def toggleWireframe(self):
		base.toggleWireframe()
		self.postStatusMessage("Wireframe Toggle")

	def toggleTexture(self):
		base.toggleTexture()
		self.postStatusMessage("Texture Toggle")

	# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	#
	# Description:
	#
	#	Load and register key bindings
	#
	# Input(s):
	#
	#	None
	#
	# Output(s):
	#
	#	None
	#
	def setupKeyBindings(self) :
		self.accept('h',self.__Nav.orientGodMode)
		self.accept('p',self.snapShot)
		self.accept('w',self.toggleWireframe)
		self.accept('t',self.toggleTexture)
		self.accept('m',self.__Nav.toggleAutoCentering)
		self.accept('escape',sys.exit)
		self.accept('.',self.__Nav.toggleDriving)
		self.accept('n',self.__Nav.nextNavigationMode)
		self.accept('+',self.__Nav.speedUp)
		self.accept('-',self.__Nav.slowDown)
		self.accept('home',self.__Nav.reset)
		self.accept('space',self.__Nav.turboBoostOn)
		self.accept('space-up',self.__Nav.turboBoostOff)
		self.accept('f11',self.__Nav.toggleSuperTurboBoost)

		self.accept('d',self.__Nav.drivingForwardOn)
		self.accept('d-up',self.__Nav.drivingForwardOff)
		self.accept('e',self.__Nav.slidingUpOn)
		self.accept('e-up',self.__Nav.slidingUpOff)
		self.accept('v',self.__Nav.slidingDownOn)
		self.accept('v-up',self.__Nav.slidingDownOff)
		self.accept('f',self.__Nav.slidingRightOn)
		self.accept('f-up',self.__Nav.slidingRightOff)
		self.accept('s',self.__Nav.slidingLeftOn)
		self.accept('s-up',self.__Nav.slidingLeftOff)
		self.accept('c',self.__Nav.drivingBackwardOn)
		self.accept('c-up',self.__Nav.drivingBackwardOff)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 

world = World()

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Run the program

run()
