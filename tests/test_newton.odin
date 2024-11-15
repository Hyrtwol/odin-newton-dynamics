package test_newton

import "core:testing"
import "shared:ounit"
import n ".."

expect_size :: ounit.expect_size

@(test)
size_of_vectors :: proc(t: ^testing.T) {
	expect_size(t, n.int3, 12)
	expect_size(t, n.float3, 12)
	expect_size(t, n.float4, 16)
	expect_size(t, n.float4x4, 64)
}

@(test)
size_of_SerializeId :: proc(t: ^testing.T) {
	exp := size_of(i32)
	act := size_of(n.SerializeId)
	testing.expect_value(t, act, exp)
}

@(test)
size_of_MaterialData :: proc(t: ^testing.T) {
	exp := size_of(i64)
	act := size_of(n.MaterialData)
	testing.expect_value(t, act, exp)
}

@(test)
size_of_JacobianPair :: proc(t: ^testing.T) {
	exp := 2 * 3 * size_of(n.dFloat)
	act := size_of(n.JacobianPair)
	testing.expect_value(t, act, exp)
}

@(test)
size_of_ImmediateModeConstraint :: proc(t: ^testing.T) {
	exp := (2 * 6 + 4) * 8 * size_of(n.dFloat)
	act := size_of(n.ImmediateModeConstraint)
	testing.expect_value(t, act, exp)
}

@(test)
size_of_CollisionMaterial :: proc(t: ^testing.T) {
	exp := size_of(i64) + size_of(i64) + 6 * size_of(i64)
	act := size_of(n.CollisionMaterial)
	testing.expect_value(t, act, exp)
}

@(test)
size_of_CollisionInfoRecord :: proc(t: ^testing.T) {
	exp := 416
	//exp := size_of(float4x4) + size_of(CollisionMaterial) + size_of(SerializeId) + (64 * size_of(dFloat))
	act := size_of(n.CollisionInfoRecord)
	testing.expect_value(t, act, exp)
}

@(test)
size_of_JointRecord :: proc(t: ^testing.T) {
	// exp := 584 // packed
	exp := 608
	// exp :=
	// 	size_of(n.float4x4) * 2 +
	// 	size_of(n.float3) * 4 +
	// 	size_of(rawptr) * 2 +
	// 	(64 * size_of(n.dFloat)) +
	// 	size_of(i32) +
	// 	128
	act := size_of(n.JointRecord)
	testing.expect_value(t, act, exp)
}

@(test)
size_of_JointRecord_2 :: proc(t: ^testing.T) {
	JointRecord2 :: struct #packed {
		m_attachmenMatrix_0: n.float4x4,
		m_attachmenMatrix_1: n.float4x4,
		m_minLinearDof:      n.float3,
		m_maxLinearDof:      n.float3,
		m_minAngularDof:     n.float3,
		m_maxAngularDof:     n.float3,
		// m_attachBody_0:      ^n.Body,
		// m_attachBody_1:      ^n.Body,
		// m_extraParameters:   [64]n.dFloat,
		// m_bodiesCollisionOn: i32,
		// m_descriptionType:   [128]n.u8,
	}
	//exp := 608
	exp :=
	 	size_of(n.float4x4) * 2 +
	 	size_of(n.float3) * 4
	// 	size_of(rawptr) * 2 +
	// 	(64 * size_of(n.dFloat)) +
	// 	size_of(i32) +
	// 	128
	act := size_of(JointRecord2)
	testing.expect_value(t, act, exp)
}
