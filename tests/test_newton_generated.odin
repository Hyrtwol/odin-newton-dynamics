#+build windows
package test_newton // generated by codegen

import "core:testing"
import sut ".."

@(test)
verify_type_sizes :: proc(t: ^testing.T) {
	// newton.h
	expect_size(t, sut.dFloat, 4)
	expect_size(t, sut.NewtonMaterialData, 8)
	expect_size(t, sut.NewtonCollisionMaterial, 64)
	expect_size(t, sut.NewtonBoxParam, 12)
	expect_size(t, sut.NewtonSphereParam, 4)
	expect_size(t, sut.NewtonCapsuleParam, 12)
	expect_size(t, sut.NewtonCylinderParam, 12)
	expect_size(t, sut.NewtonConeParam, 8)
	expect_size(t, sut.NewtonChamferCylinderParam, 8)
	expect_size(t, sut.NewtonConvexHullParam, 24)
	expect_size(t, sut.NewtonCompoundCollisionParam, 4)
	expect_size(t, sut.NewtonCollisionTreeParam, 8)
	expect_size(t, sut.NewtonDeformableMeshParam, 32)
	expect_size(t, sut.NewtonHeightFieldCollisionParam, 48)
	expect_size(t, sut.NewtonSceneCollisionParam, 4)
	//expect_size(t, sut.NewtonCollisionInfoRecord, 392)
	//expect_size(t, sut.NewtonJointRecord, 584)
	expect_size(t, sut.NewtonUserMeshCollisionCollideDesc, 128)
	expect_size(t, sut.NewtonWorldConvexCastReturnInfo, 56)
	expect_size(t, sut.NewtonUserMeshCollisionRayHitDesc, 64)
	expect_size(t, sut.NewtonHingeSliderUpdateDesc, 16)
	expect_size(t, sut.NewtonUserContactPoint, 64)
	expect_size(t, sut.NewtonImmediateModeConstraint, 512)
	expect_size(t, sut.NewtonMeshDoubleData, 24)
	expect_size(t, sut.NewtonMeshFloatData, 24)
	expect_size(t, sut.NewtonMeshVertexFormat, 168)
}
