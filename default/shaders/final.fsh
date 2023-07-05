#version 120

uniform sampler2D gcolor;
uniform sampler2D gdepth;
uniform sampler2D composite;

varying vec4 texcoord;

uniform float aspectRatio;
uniform float near;
uniform float far;


void main() {
	vec4 baseColor = texture2D(composite, texcoord.st);   
   	gl_FragColor = baseColor;
}
