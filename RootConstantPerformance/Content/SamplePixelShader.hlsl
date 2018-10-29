// Per-pixel color data passed through the pixel shader.
struct PixelShaderInput
{
	float4 pos : SV_POSITION;
	float3 color : COLOR0;
};

struct MaterialConstants
{
	uint i0;
	uint i1;
	uint i2;
	uint i3;
	uint i4;
	uint i5;
	uint i6;
	uint i7;
};

ConstantBuffer<MaterialConstants> materialConstants : register(b0, space0);

// A pass-through function for the (interpolated) color data.
float4 main(PixelShaderInput input, uint primitiveID : SV_PrimitiveID) : SV_TARGET
{
	float3 f = float3(float(materialConstants.i0) / 256, float(materialConstants.i1) / 256, float(materialConstants.i2) / 256);
	float3 g = float3(float(materialConstants.i3) / 256, float(materialConstants.i4) / 256, float(materialConstants.i5) / 256);
	float3 h = float3(float(materialConstants.i5) / 256, float(materialConstants.i6) / 256, float(materialConstants.i7) / 256);
	return float4(f + g + h, 1.0f);
}
