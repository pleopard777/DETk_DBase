xof 0302txt 0032
Header {
 1;
 0;
 1;
}
template Header {
 <3D82AB43-62DA-11cf-AB39-0020AF71E433>
 WORD major;
 WORD minor;
 DWORD flags;
}

template Vector {
 <3D82AB5E-62DA-11cf-AB39-0020AF71E433>
 FLOAT x;
 FLOAT y;
 FLOAT z;
}

template Coords2d {
 <F6F23F44-7686-11cf-8F52-0040333594A3>
 FLOAT u;
 FLOAT v;
}

template Matrix4x4 {
 <F6F23F45-7686-11cf-8F52-0040333594A3>
 array FLOAT matrix[16];
}

template ColorRGBA {
 <35FF44E0-6C7C-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
 FLOAT alpha;
}

template ColorRGB {
 <D3E16E81-7835-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
}

template TextureFilename {
 <A42790E1-7810-11cf-8F52-0040333594A3>
 STRING filename;
}

template Material {
 <3D82AB4D-62DA-11cf-AB39-0020AF71E433>
 ColorRGBA faceColor;
 FLOAT power;
 ColorRGB specularColor;
 ColorRGB emissiveColor;
 [...]
}

template MeshFace {
 <3D82AB5F-62DA-11cf-AB39-0020AF71E433>
 DWORD nFaceVertexIndices;
 array DWORD faceVertexIndices[nFaceVertexIndices];
}

template MeshTextureCoords {
 <F6F23F40-7686-11cf-8F52-0040333594A3>
 DWORD nTextureCoords;
 array Coords2d textureCoords[nTextureCoords];
}

template MeshMaterialList {
 <F6F23F42-7686-11cf-8F52-0040333594A3>
 DWORD nMaterials;
 DWORD nFaceIndexes;
 array DWORD faceIndexes[nFaceIndexes];
 [Material]
}

template MeshNormals {
 <F6F23F43-7686-11cf-8F52-0040333594A3>
 DWORD nNormals;
 array Vector normals[nNormals];
 DWORD nFaceNormals;
 array MeshFace faceNormals[nFaceNormals];
}

template Mesh {
 <3D82AB44-62DA-11cf-AB39-0020AF71E433>
 DWORD nVertices;
 array Vector vertices[nVertices];
 DWORD nFaces;
 array MeshFace faces[nFaces];
 [...]
}

template FrameTransformMatrix {
 <F6F23F41-7686-11cf-8F52-0040333594A3>
 Matrix4x4 frameMatrix;
}

template Frame {
 <3D82AB46-62DA-11cf-AB39-0020AF71E433>
 [...]
}
template FloatKeys {
 <10DD46A9-775B-11cf-8F52-0040333594A3>
 DWORD nValues;
 array FLOAT values[nValues];
}

template TimedFloatKeys {
 <F406B180-7B3B-11cf-8F52-0040333594A3>
 DWORD time;
 FloatKeys tfkeys;
}

template AnimationKey {
 <10DD46A8-775B-11cf-8F52-0040333594A3>
 DWORD keyType;
 DWORD nKeys;
 array TimedFloatKeys keys[nKeys];
}

template AnimationOptions {
 <E2BF56C0-840F-11cf-8F52-0040333594A3>
 DWORD openclosed;
 DWORD positionquality;
}

template Animation {
 <3D82AB4F-62DA-11cf-AB39-0020AF71E433>
 [...]
}

template AnimationSet {
 <3D82AB50-62DA-11cf-AB39-0020AF71E433>
 [Animation]
}

template XSkinMeshHeader {
 <3cf169ce-ff7c-44ab-93c0-f78f62d172e2>
 WORD nMaxSkinWeightsPerVertex;
 WORD nMaxSkinWeightsPerFace;
 WORD nBones;
}

template VertexDuplicationIndices {
 <b8d65549-d7c9-4995-89cf-53a9a8b031e3>
 DWORD nIndices;
 DWORD nOriginalVertices;
 array DWORD indices[nIndices];
}

template SkinWeights {
 <6f0d123b-bad2-4167-a0d0-80224f25fabb>
 STRING transformNodeName;
 DWORD nWeights;
 array DWORD vertexIndices[nWeights];
 array FLOAT weights[nWeights];
 Matrix4x4 matrixOffset;
}
Frame Body {
   FrameTransformMatrix {
0.008370,0.000000,0.000000,0.000000,
0.000000,0.008370,0.000000,0.000000,
0.000000,0.000000,0.008370,0.000000,
0.004988,-0.491240,0.015968,1.000000;;
 }
Mesh staticMesh {
 13;
-0.362177;50.000000;0.147041;,
-36.763966;0.000000;-35.395092;,
-18.569704;98.881691;-59.055477;,
35.474506;0.000000;33.754059;,
23.416618;99.764343;55.239933;,
-24.049395;0.000000;43.687263;,
-39.281364;98.947113;43.526939;,
22.892559;0.000000;-44.610268;,
44.948471;117.383385;-35.626095;,
59.142288;98.947113;-13.278704;,
49.642822;0.000000;-1.898515;,
-50.370888;0.000000;0.122999;,
-60.334244;75.002449;22.116245;;

 24;
3;2,1,0;,
3;0,1,2;,
3;3,0,1;,
3;1,0,3;,
3;3,4,0;,
3;0,4,3;,
3;2,0,4;,
3;4,0,2;,
3;6,5,0;,
3;0,5,6;,
3;7,0,5;,
3;5,0,7;,
3;7,8,0;,
3;0,8,7;,
3;6,0,8;,
3;8,0,6;,
3;0,10,9;,
3;9,10,0;,
3;10,0,11;,
3;11,0,10;,
3;0,12,11;,
3;11,12,0;,
3;12,0,9;,
3;9,0,12;;
MeshMaterialList {
 1;
 24;
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0;;
Material {
 0.752941;0.752941;0.752941;1.000000;;
39.999996;
 0.000000;0.000000;0.000000;;
 0.000000;0.000000;0.000000;;
TextureFilename {
"shr19.png";
}
 }
}

 MeshNormals {
 13;
-0.666667;-0.333333;-0.666667;,
0.000000;-1.000000;0.000000;,
-0.752577;-0.658505;0.000000;,
0.000000;-1.000000;0.000000;,
-0.588172;-0.808736;0.000000;,
0.000000;-1.000000;0.000000;,
0.000000;1.000000;0.000000;,
0.000000;-0.242536;-0.970142;,
0.000000;0.242536;-0.970142;,
0.000000;1.000000;0.000000;,
0.970142;0.242536;0.000000;,
0.000000;1.000000;0.000000;,
-0.371391;0.928477;0.000000;;

 24;
3;2,1,0;,
3;0,1,2;,
3;3,0,1;,
3;1,0,3;,
3;3,4,0;,
3;0,4,3;,
3;2,0,4;,
3;4,0,2;,
3;6,5,0;,
3;0,5,6;,
3;7,0,5;,
3;5,0,7;,
3;7,8,0;,
3;0,8,7;,
3;6,0,8;,
3;8,0,6;,
3;0,10,9;,
3;9,10,0;,
3;10,0,11;,
3;11,0,10;,
3;0,12,11;,
3;11,12,0;,
3;12,0,9;,
3;9,0,12;;
 }
MeshTextureCoords {
 13;
0.499436;0.496639;,
-0.002219;0.998294;,
-0.000637;-0.000353;,
0.997185;0.998294;,
0.997957;-0.000708;,
-0.002219;0.998294;,
-0.000637;-0.000353;,
0.997185;0.998294;,
0.997957;-0.000708;,
-0.000637;-0.000353;,
-0.002219;0.998294;,
0.997185;0.998294;,
0.997957;-0.000708;;
}
}
 }
