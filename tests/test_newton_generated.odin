#+build windows
package test_newton // generated by codegen

import "core:testing"
import sut ".."

@(test)
verify_type_sizes :: proc(t: ^testing.T) {
	// newton.h
	expect_size(t, sut.dFloat, 4)
	expect_size(t, sut.MaterialData, 8)
	expect_size(t, sut.CollisionMaterial, 64)
	expect_size(t, sut.BoxParam, 12)
	expect_size(t, sut.SphereParam, 4)
	expect_size(t, sut.CapsuleParam, 12)
	expect_size(t, sut.CylinderParam, 12)
	expect_size(t, sut.ConeParam, 8)
	expect_size(t, sut.ChamferCylinderParam, 8)
	expect_size(t, sut.ConvexHullParam, 24)
	expect_size(t, sut.CompoundCollisionParam, 4)
	expect_size(t, sut.CollisionTreeParam, 8)
	expect_size(t, sut.DeformableMeshParam, 32)
	expect_size(t, sut.HeightFieldCollisionParam, 48)
	expect_size(t, sut.SceneCollisionParam, 4)
	//expect_size(t, sut.CollisionInfoRecord, 392)
	//expect_size(t, sut.JointRecord, 584)
	expect_size(t, sut.UserMeshCollisionCollideDesc, 128)
	expect_size(t, sut.WorldConvexCastReturnInfo, 56)
	expect_size(t, sut.UserMeshCollisionRayHitDesc, 64)
	expect_size(t, sut.HingeSliderUpdateDesc, 16)
	expect_size(t, sut.UserContactPoint, 64)
	expect_size(t, sut.ImmediateModeConstraint, 512)
	expect_size(t, sut.MeshDoubleData, 24)
	expect_size(t, sut.MeshFloatData, 24)
	expect_size(t, sut.MeshVertexFormat, 168)
}
