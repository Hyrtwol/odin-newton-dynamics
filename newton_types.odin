package newton

_NEWTON_USE_DOUBLE :: #config(_NEWTON_USE_DOUBLE, false)

when _NEWTON_USE_DOUBLE {
	dFloat :: f64
} else {
	dFloat :: f32
}

int3 :: [3]i32
float3 :: [3]dFloat
float4 :: [4]dFloat
float4x4 :: matrix[4, 4]dFloat
