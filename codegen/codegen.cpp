#include <odintestgen.h>
//#undef __cplusplus
#include "newton.h"

#define zint16 ZInt16
#define zint32 ZInt32
#define zcontext void*

void verify_type_sizes(ofstream& out) {
	test_proc_begin();
    test_proc_comment("newton.h");
    //expect_size(dLong);
    expect_size(dFloat);
    //expect_size(dFloat32);
    //expect_size(dFloat64);

    //expect_size(NewtonMesh);
    //expect_size(NewtonBody);
    //expect_size(NewtonWorld);
    //expect_size(NewtonJoint);
    //expect_size(NewtonMaterial);
    //expect_size(NewtonCollision);
    //expect_size(NewtonDeformableMeshSegment);
    //expect_size(NewtonFracturedCompoundMeshPart);

    expect_size(NewtonMaterialData);
    expect_size(NewtonCollisionMaterial);
    expect_size(NewtonBoxParam);
    expect_size(NewtonSphereParam);
    expect_size(NewtonCapsuleParam);
    expect_size(NewtonCylinderParam);
    expect_size(NewtonConeParam);
    expect_size(NewtonChamferCylinderParam);
    expect_size(NewtonConvexHullParam);
    expect_size(NewtonCompoundCollisionParam);
    expect_size(NewtonCollisionTreeParam);
    expect_size(NewtonDeformableMeshParam);
    expect_size(NewtonHeightFieldCollisionParam);
    expect_size(NewtonSceneCollisionParam);
    //expect_size(NewtonCollisionInfoRecord);
    //expect_size(NewtonJointRecord);
    expect_size(NewtonUserMeshCollisionCollideDesc);
    expect_size(NewtonWorldConvexCastReturnInfo);
    expect_size(NewtonUserMeshCollisionRayHitDesc);
    expect_size(NewtonHingeSliderUpdateDesc);
    expect_size(NewtonUserContactPoint);
    expect_size(NewtonImmediateModeConstraint);
    expect_size(NewtonMeshDoubleData);
    expect_size(NewtonMeshFloatData);
    expect_size(NewtonMeshVertexFormat);

	test_proc_end();
}

void test_newton(ofstream& out) {
    package_header();
    out << "import sut \"..\"" << endl;
    verify_type_sizes(out);
	//verify_macros(out);
}

int main(int argc, char* argv[]) {
	if (argc < 2) { cout << "Usage: " << path(argv[0]).filename().string() << " <odin-output-file>" << endl; return -1; }
	auto filepath = path(argv[1]);
	cout << "Writing " << filepath.string() << endl;
	ofstream out(filepath);
    test_newton(out);
	out.close();
}
