# Programs

## Available Programs

There are 22 programs available in the mod (`0` being `None`).
Each can have a `.vsh` Vertex Shader and a `.fsh` Fragment Shader.
Any program that doesn't have a Vertex Shader and/or a Fragment Shader will fall back to its backup program, which will fall back to its backup program until a Vertex and/or Fragment Shader are found or it reaches `None`.

|	Program #	|	Program Name			|	Backup Program			|
|	---			|	---						|	---						|
|	1 			|	`gbuffers_basic`		|	`None`					|
|	2			|	`gbuffers_textured`		|	`gbuffers_basic`		|
|	3 			|	`gbuffers_textured_lit`	|	`gbuffers_textured`		|
|	4 			|	`gbuffers_skybasic`		|	`gbuffers_basic`		|
|	5 			|	`gbuffers_skytextured`	|	`gbuffers_textured`		|
|	6 			|	`gbuffers_terrain`		|	`gbuffers_textured_lit`	|
|	7 			|	`gbuffers_water`		|	`gbuffers_terrain`		|
|	8 			|	`gbuffers_entities`		|	`gbuffers_textured_lit`	|
|	9 			|	`gbuffers_spidereyes`	|	`gbuffers_textured`		|
|	10 			|	`gbuffers_hand`			|	`gbuffers_textured_lit`	|	
|	11 			|	`gbuffers_weather`		|	`gbuffers_textured_lit`	|
|	12 			|	`composite`				|	`None`					|
|	13 			|	`composite1`			|	`None`					|
|	14 			|	`composite2`			|	`None`					|
|	15 			|	`composite3`			|	`None`					|
|	16	 		|	`composite4`			|	`None`					|
|	17 			|	`composite5`			|	`None`					|
|	18 			|	`composite6`			|	`None`					|
|	19	 		|	`composite7`			|	`None`					|
|	20			|	`final`					|	`None`					|
|	21			|	`shadow`				|	`None`					|

## Available Data

### All have access to:

|	Data							|	[Type](https://www.khronos.org/opengl/wiki/Data_Type_(GLSL))	|	Details								|
|	---								|	---			|	---																						|
|	heldItemId						|	int			|	The `itemID` of the currently held item. `-1` if no item is held.						|
|	heldBlockLightValue				|	int			|	The `lightValue` of the currently held block. `0` if no block is held.					|
|	fogMode							|	int			|	`9729` = `GL_LINEAR`, `2048` = `GL_EXP`, `2049` = `GL_EXP2`. `0` if fog is disabled. (VERIFY)	|
|	fogColor						|	vec3		|	`RGB`																						|
|	skyColor						|	vec3		|	`RGB`																						|
|	worldTime						|	int			|	Time of day in Ticks (`0` - `23999`)													|
|	moonPhase						|	int			|	The current phase of the moon from `0` - `7`. `0` being Full Moon, `4` being New Moon.	|
|	frameTimeCounter				|	float		|	Accumulation of frame times (in seconds) % 100000.0f									|
|	sunAngle						|	float		|	Angle of the sun from `0` - `1` (offset from celestial angle, not sure if important)	|
|	shadowAngle						|	float		|	Angle of the shadows form `0` - `1`														|
|	rainStrength					|	float		|	The strength of rain / snow, *maybe* `0` - `1`? **TODO**								|
|	aspectRatio						|	float		|	Render Width / Render Height															|
|	viewWidth						|	float		|	Render Width																			|
|	viewHeight						|	float		|	Render Height																			|
|	near							|	float		|	Near viewing plane, `0.05f`																|
|	far								|	float		|	Far viewing plane, `256f`/`128f`/`64f`/`32f` for `Far`/`Normal`/`Small`/`Tiny` resp.	|
|	sunPosition						|	vec3		|	`XYZ` position of the sun in eye space. Doesn't appear to be set anywhere? **TODO**		|
|	moonPosition					|	vec3		|	`XYZ` position of the moon in eye space. Doesn't appear to be set anywhere? **TODO**	|
|	upPosition						|	vec3		|	`XYZ` position of `up`. Doesn't appear to be set anywhere? **TODO**						|
|	previousCameraPosition			|	vec3		|	`XYZ` position of the camera in the last frame. Doesn't appear to be set anywhere? **TODO**|
|	cameraPosition					|	vec3		|	`XYZ` position of the camera. Doesn't appear to be set anywhere? **TODO**					|
|	gbufferModelView				|	mat4		|	"4x4 modelview matrix after setting up the camera transformations"				|
|	gbufferModelViewInverse			|	mat4		|	The inverse of `gbufferModelView`														|
|	gbufferPreviousModelView		|	mat4		|	"4x4 modelview matrix after setting up the camera transformations for the previous frame"|
|	gbufferProjection				|	mat4		|	"4x4 projection matrix that was used when the gbuffers were generated"					|
|	gbufferProjectionInverse		|	mat4		|	The inverse of `gbufferProjection`														|
|	gbufferPreviousProjection		|	mat4		|	"4x4 projection matrix that was used when the gbuffers were generated for the previous frame"|
|	shadowProjection [^1]			|	mat4		|	"4x4 projection matrix that was used when the shadow map was generated"					|
|	shadowProjectionInverse [^1]	|	mat4		|	The inverse of `shadowProjection`														|
|	shadowModelView [^1]			|	mat4		|	"4x4 modelview matrix that was used when the shadow map was generated"					|
|	shadowModelViewInverse [^1]		|	mat4		|	The inverse of `shadowModelView`														|
|	wetness							|	float		|	How wet everything would be from the rain. Increases with heavier rain, decreases with no rain, *maybe* `0` - `1` **TODO**|
|	eyeAltitude						|	float		|	The `y` postion of the render entity's eyes												|
|	eyeBrightness					|	ivec2		|	`[brightness from Sky, brightness from block]` Light level at the render entity's position, `0` - `240` (`16x` the light level)|
|	eyeBrightnessSmooth				|	ivec2		|	`[brightness from Sky, brightness from block]` `eyeBrightness` smoothed by `e^(ln(0.5) * frameTimeInMS * 0.01 / eyeBrightnessHalflife)`, default halflife is `10`|
|	terrainTextureSize				|	ivec2		|	Presumably the width and height of the terrain texture, but doesn't appear to be set anywhere **TODO**	|
|	terrainIconSize					|	int			|	Not sure what it's for, but default value is `16`, so maybe block texture resolution? **TODO**	|
|	isEyeInWater					|	int			|	`1` if the player is in water and not in a third person view or sleeping, `0` otherwise	|
|	hideGUI							|	int			|	`1` if the GUI is hidden, `0` otherwise													|
|	centerDepthSmooth				|	float		|	The depth value of the pixel the cursor is on. Probably between `near` and `far` values |
|	atlasSize						|	ivec2		|	`[width, height]` of the texture atlas size												|

[^1]: available if a shadow depth buffer is used (using `shadow`, `watershadow`, `shadowtex0`, or `shadowtex1` in a frag shader)

### Weather (program `11`) also has:

|	Data			|	Type		|	Details		|
|	---				|	---			|	---			|
|	texture			|	sampler2D	|	TODO		|
|	lightmap		|	sampler2D	|	TODO		|
|	normals			|	sampler2D	|	TODO		|
|	specular		|	sampler2D	|	TODO		|
|	shadow			|	sampler2D	|	TODO		|
|	watershadow		|	sampler2D	|	TODO		|
|	shadowtex0		|	sampler2D	|	TODO		|
|	shadowtex1		|	sampler2D	|	TODO		|
|	depthtex0		|	sampler2D	|	TODO		|
|	depthtex1		|	sampler2D	|	TODO		|
|	shadowcolor		|	sampler2D	|	TODO		|
|	shadowcolor0	|	sampler2D	|	TODO		|
|	shadowcolor1	|	sampler2D	|	TODO		|
|	noisetex		|	sampler2D	|	TODO		|


### Final (program `20`) also has:

|	Data			|	Type		|	Details		|
|	---				|	---			|	---			|
|	gcolor			|	sampler2D	|	TODO		|
|	gdepth			|	sampler2D	|	TODO		|
|	gnormal			|	sampler2D	|	TODO		|
|	composite		|	sampler2D	|	TODO		|
|	gaux1			|	sampler2D	|	TODO		|
|	gaux2			|	sampler2D	|	TODO		|
|	gaux3			|	sampler2D	|	TODO		|
|	gaux4			|	sampler2D	|	TODO		|
|	colortex0		|	sampler2D	|	TODO		|
|	colortex1		|	sampler2D	|	TODO		|
|	colortex2		|	sampler2D	|	TODO		|
|	colortex3		|	sampler2D	|	TODO		|
|	colortex4		|	sampler2D	|	TODO		|
|	colortex5		|	sampler2D	|	TODO		|
|	colortex6		|	sampler2D	|	TODO		|
|	colortex7		|	sampler2D	|	TODO		|
|	shadow			|	sampler2D	|	TODO		|
|	watershadow		|	sampler2D	|	TODO		|
|	shadowtex0		|	sampler2D	|	TODO		|
|	shadowtex1		|	sampler2D	|	TODO		|
|	gdepthtex		|	sampler2D	|	TODO		|
|	depthtex0		|	sampler2D	|	TODO		|
|	depthtex1		|	sampler2D	|	TODO		|
|	depthtex2		|	sampler2D	|	TODO		|
|	shadowcolor		|	sampler2D	|	TODO		|
|	shadowcolor0	|	sampler2D	|	TODO		|
|	shadowcolor1	|	sampler2D	|	TODO		|
|	noisetex		|	sampler2D	|	TODO		|

### Shadow (program `21`) also has:

|	Data			|	Type		|	Details		|
|	---				|	---			|	---			|
|	tex				|	sampler2D	|	TODO		|
|	texture			|	sampler2D	|	TODO		|
|	lightmap		|	sampler2D	|	TODO		|
|	normals			|	sampler2D	|	TODO		|
|	specular		|	sampler2D	|	TODO		|
|	shadow			|	sampler2D	|	TODO		|
|	watershadow		|	sampler2D	|	TODO		|
|	shadowtex0		|	sampler2D	|	TODO		|
|	shadowtex1		|	sampler2D	|	TODO		|
|	shadowcolor		|	sampler2D	|	TODO		|
|	shadowcolor0	|	sampler2D	|	TODO		|
|	shadowcolor1	|	sampler2D	|	TODO		|
|	noisetex		|	sampler2D	|	TODO		|

---

## Writing Vertex Shaders



## Writing Fragment Shaders