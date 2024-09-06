package test_newton

import "core:fmt"
import "core:testing"
import "shared:ounit"
import n ".."

expect_size :: ounit.expect_size

@(test)
size_of_vectors :: proc(t: ^testing.T) {
	expect_size(t, n.float2, 8)
	expect_size(t, n.float3, 12)
	expect_size(t, n.float4x4, 64)
}

@(test)
size_of_SerializeId :: proc(t: ^testing.T) {
	exp := size_of(i32)
	act := size_of(n.SerializeId)
	testing.expect(t, act == exp, fmt.tprintf("JacobianPair: %v (should be: %v)", act, exp))
}

@(test)
size_of_NewtonMaterialData :: proc(t: ^testing.T) {
	exp := size_of(i64)
	act := size_of(n.NewtonMaterialData)
	testing.expect(t, act == exp, fmt.tprintf("JacobianPair: %v (should be: %v)", act, exp))
}

@(test)
size_of_JacobianPair :: proc(t: ^testing.T) {
	exp := 2 * 3 * size_of(n.dFloat)
	act := size_of(n.JacobianPair)
	testing.expect(t, act == exp, fmt.tprintf("JacobianPair: %v (should be: %v)", act, exp))
}

@(test)
size_of_NewtonImmediateModeConstraint :: proc(t: ^testing.T) {
	exp := (2 * 6 + 4) * 8 * size_of(n.dFloat)
	act := size_of(n.NewtonImmediateModeConstraint)
	testing.expect(t, act == exp, fmt.tprintf("NewtonImmediateModeConstraint: %v (should be: %v)", act, exp))
}

@(test)
size_of_NewtonCollisionMaterial :: proc(t: ^testing.T) {
	exp := size_of(i64) + size_of(i64) + 6 * size_of(i64)
	act := size_of(n.NewtonCollisionMaterial)
	testing.expect(t, act == exp, fmt.tprintf("JacobianPair: %v (should be: %v)", act, exp))
}

@(test)
size_of_NewtonCollisionInfoRecord :: proc(t: ^testing.T) {
	exp := 416
	//exp := size_of(float4x4) + size_of(NewtonCollisionMaterial) + size_of(SerializeId) + (64 * size_of(dFloat))
	act := size_of(n.NewtonCollisionInfoRecord)
	testing.expectf(t, act == exp, "NewtonCollisionInfoRecord: %v (should be: %v)", act, exp)
}

@(test)
size_of_NewtonJointRecord :: proc(t: ^testing.T) {
	// exp := 584 // packed
	exp := 608
	// exp :=
	// 	size_of(n.float4x4) * 2 +
	// 	size_of(n.float3) * 4 +
	// 	size_of(rawptr) * 2 +
	// 	(64 * size_of(n.dFloat)) +
	// 	size_of(i32) +
	// 	128
	act := size_of(n.NewtonJointRecord)
	testing.expectf(t, act == exp, "NewtonJointRecord: %v (should be: %v)", act, exp)
}

@(test)
size_of_NewtonJointRecord_2 :: proc(t: ^testing.T) {
	NewtonJointRecord2 :: struct #packed {
		m_attachmenMatrix_0: n.float4x4,
		m_attachmenMatrix_1: n.float4x4,
		m_minLinearDof:      n.float3,
		m_maxLinearDof:      n.float3,
		m_minAngularDof:     n.float3,
		m_maxAngularDof:     n.float3,
		// m_attachBody_0:      ^n.NewtonBody,
		// m_attachBody_1:      ^n.NewtonBody,
	// 	m_extraParameters:   [64]n.dFloat,
	// 	m_bodiesCollisionOn: i32,
	// 	m_descriptionType:   [128]n.u8,
	}
	//exp := 608
	exp :=
	 	size_of(n.float4x4) * 2 +
	 	size_of(n.float3) * 4
	// 	size_of(rawptr) * 2 +
	// 	(64 * size_of(n.dFloat)) +
	// 	size_of(i32) +
	// 	128
	act := size_of(NewtonJointRecord2)
	testing.expectf(t, act == exp, "NewtonJointRecord: %v (should be: %v)", act, exp)
}
