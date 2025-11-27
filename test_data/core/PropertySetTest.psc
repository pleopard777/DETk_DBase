PropertySetTest1
{
	BackgroundColor=#223455FF
	BkgMusicFile=noise.aiff
	ShowYZGrid=true
	WorldDimension=131
	TargetScale=43.2
	TextFontFile=$[DBASE]/fonts/verdana.ttf
	TargetPosition=23.3,33.4,44.5
}
AudioManager
{
	TrackCount, 5
	Track0, $(DETK_PTK_DBASE)/Audio/Steroids1.s3m, BackgroundMusic ,Song
	Track1, $(DETK_PTK_DBASE)/Audio/T2LoadingHum.wav, LoadingSound ,Stream
	Track2, $(DETK_PTK_DBASE)/Audio/CameraShutter.wav, CameraClick, Sample
	Track3, $(DETK_PTK_DBASE)/Audio/MissileLaunch_6.0s.wav, MissileLaunch, Sample
	Track4, $(DETK_PTK_DBASE)/Audio/Boom2.wav, Explosion1, Sample
}
GPSCoordinates
{
	TestCount, 6
	Test[0],   85.9542, -37.8894
	Test[1],  -85.9542,  37.8894
	Test[2],  -85.9542, +37.8894
	Test[3],  W85.9542, N37.8894
	Test[4],  W123:43:23.129, N32:58:12.59
	Test[5],  E123:43:23.129, S32:58:12.59
}

SimulationDataSet
{
	LightScriptFile, InputScript.msf
	LightModelScriptFile, InputScript.msf
	ModelSmoothingAngleDegrees, 130
	SkyBoxModelFile, $(DETK_PTK_DBASE)/3DModels/CubeSky1/CubeSky1.3ds
	HighQualityModelTextures, true
	UseModelLighting, true

	ModelCount, 9
	ModelFile0, $(DETK_PTK_DBASE)/3DModels/SpaceStation/SpaceStation.3ds
	ModelPosition0, 0, 0, 0
	ModelFile1, $(DETK_PTK_DBASE)/3DModels/A10Cockpit/A10Cockpit.3ds
	ModelPosition1, -0.55, 0.55, 0.55
	ModelFile2, $(DETK_PTK_DBASE)/3DModels/T72M1Woodland/T72M1Woodland.3ds
	ModelPosition2, -0.55, -0.55, -0.55
	ModelFile3, $(DETK_PTK_DBASE)/3DModels/F5E/F5E.3ds
	ModelPosition3, 0.55, 0.55, 0.55
	ModelFile4, $(DETK_PTK_DBASE)/3DModels/IndyCar2/IndyCar2.3ds
	ModelPosition4, 0.55, -0.55, 0.55
	ModelFile5, $(DETK_PTK_DBASE)/3DModels/AA-1B/AA-1B.3ds
	ModelPosition5, -0.55, -0.55, 0.55
	ModelFile6, $(DETK_PTK_DBASE)/3DModels/T80-Standard/T80-Standard.3ds
	ModelPosition6, 0.55, -0.55, -0.55
	ModelFile7, $(DETK_PTK_DBASE)/3DModels/TieFighter/TieFighter.3ds
	ModelPosition7, 0.55, 0.55, -0.55
	ModelFile8, $(DETK_PTK_DBASE)/3DModels/Sidewinder/Sidewinder.3ds
	ModelPosition8, -0.55, 0.55, -0.55
}
SceneLightModel
{
	# Lighting Model Local Viewer Mode Indicator
	LocalViewer,false

	# Lighting Model Local Two-Sided Mode Indicator
	TwoSided,true

	# Ambient Color
	AmbientColor,0xFFFFFFFF
}

SceneLight
{
	Name, LightName

	# Ambient Color
	AmbientColor,0xFFFFFFFF

	# Emissive Color
	EmissiveColor,0x000000FF

	# Diffuse Color
	DiffuseColor,0x444444FF

	# Specular Color
	SpecularColor,0xFFFFFFFF

	# Light Position
	Position,0,0,1,1

	# Spot Direction
	SpotDirection,0,0,-1

	# Spot Cutoff Angle (deg)
	SpotCutoffAngle,180

	# Spot Exponent
	SpotExponent,0

	# Spot Constant Attenuation
	ConstantAttenuation,1

	# Spot Linear Attenuation
	LinearAttenuation,0

	# Spot Quadratic Attenuation
	QuadraticAttenuation,0

}

Textures
{
	TextureCount, 10
	Texture[0], Water1, Textures/Water1.jpg
	Texture[1], Clouds1, Textures/Clouds1.jpg
	Texture[2], LeatherGS, Textures/LeatherGS.jpg
	Texture[3], Aegis0, Textures/Aegis1.mp_0.jpg
	Texture[4], Aegis1, Textures/Aegis1.mp_1.jpg
	Texture[5], Aegis2, Textures/Aegis1.mp_2.jpg
	Texture[6], Aegis3, Textures/Aegis1.mp_3.jpg
	Texture[7], Aegis4, Textures/Aegis1.mp_4.jpg
	Texture[8], Aegis5, Textures/Aegis1.mp_5.jpg
	Texture[9], Aegis6, Textures/Aegis1.mp_6.jpg

}
	Texture[0], RandomGrass, 64, 0.0, 1.0, 0.0
	Texture[2], Water2, Textures/Water2.jpg
	Texture[3], Water3, Textures/Water3.jpg
	Texture[4], Water4, Textures/Water4.jpg
	Texture[5], Water5, Textures/Water5.jpg
	Texture[6], Water6, Textures/Water6.jpg
	Texture[7], Water7, Textures/Water7.jpg
	Texture[9], Clouds2, Textures/Clouds2.jpg
	Texture[10], Clouds3, Textures/Clouds3.jpg
	Texture[12], LeatherGS2, Textures/LeatherGS2.jpg
	Texture[13], Leather, Textures/Leather.jpg
	Texture[14], RandomSky, 64, 0.0, 0.6, 1.0

AegisModel
{
	IsActive, true
	TextureMapCount, 7
	TextureMap[0], Aegis0
	TextureMap[1], Aegis1
	TextureMap[2], Aegis2
	TextureMap[3], Aegis3
	TextureMap[4], Aegis4
	TextureMap[5], Aegis5
	TextureMap[6], Aegis6
	ActualSizeMeters, 171.8, 171.8, 171.8
	Scale, 0.01, 0.01, 0.01
	Position, 1830, -118, 0.16
	Velocity, 0, 0, 0
	Orientation, 270, 0, 0
}

HouseModel
{
	IsActive, true
	TextureMapCount, 0
	Scale, 2, 2, 2
	Position, 311, 224, 34
	Velocity, 0, 0, 0
	Orientation, 90, 0, 0
	ActualSizeMeters, 3, 3, 3
}

Ignore this text

JoystickConfig
{
	BaseGain, 0.3

	KeyboardRollGain, 0.1
	KeyboardPitchGain, 0.1
	KeyboardYawGain, 0.1

	MouseRollGain, 0.2
	MousePitchGain, 0.2
	MouseYawGain, 0.2

	JoystickDeadZone, 0.1 
	JoystickThrottleGain, 10
	JoystickRollGain, 0.3
	JoystickPitchGain, 0.5
	JoystickYawGain, 0.5

	MotionGain, 20
	MotionGainIncrement, 3.1
	RotationGain, 3
	RotationGainIncrement, 0.5
	MotionGainAccelerator1, 1.1
	MotionGainAccelerator2, 5.0

	VerticalSlideGain, 2.0
	HorizontalSlideGain, 2.0
}

CoordinateSystemMgrTest
{
	# Map width in meters
	MapWidthMeters, 100000

	# Map height in meters
	MapHeightMeters, 100000

	# Geodetic Map Center  Longitude,  Latitude, Altitude
	MapCenterGeodetic, -86.449774, 34.682117, 23000.0

	# Test Point (RCS)  X, Y, Z
	TestPointRCS, 0, 0, 0
}
