package newton

foreign import "newton.lib"

NEWTON_MAJOR_VERSION :: 3
NEWTON_MINOR_VERSION :: 14

BroadPhaseType :: enum i32 {
	Generic    = 0,
	Persistent = 1,
}

BodyType :: enum i32 {
	Dynamic          = 0,
	Kinematic        = 1,
	DynamicAsymetric = 2,
}

SerializeId :: enum i32 {
	Sphere            = 0,
	Capsule           = 1,
	Cylinder          = 2,
	Chamfercylinder   = 3,
	Box               = 4,
	Cone              = 5,
	Convexhull        = 6,
	Null              = 7,
	Compound          = 8,
	Tree              = 9,
	Heightfield       = 10,
	ClothPatch        = 11,
	DeformableSolid   = 12,
	Usermesh          = 13,
	Scene             = 14,
	FracturedCompound = 15,
}

AllocMemory :: #type proc(sizeInBytes: i32) -> rawptr
FreeMemory :: #type proc(ptr: rawptr, sizeInBytes: i32)
WorldDestructorCallback :: #type proc(world: ^World)
PostUpdateCallback :: #type proc(world: ^World, timestep: dFloat)
CreateContactCallback :: #type proc(newtonWorld: ^World, contact: ^Joint)
DestroyContactCallback :: #type proc(newtonWorld: ^World, contact: ^Joint)
WorldListenerDebugCallback :: #type proc(world: ^World, listener: rawptr, debugContext: rawptr)
WorldListenerBodyDestroyCallback :: #type proc(world: ^World, listenerUserData: rawptr, body: ^Body)
WorldUpdateListenerCallback :: #type proc(world: ^World, listenerUserData: rawptr, timestep: dFloat)
WorldDestroyListenerCallback :: #type proc(world: ^World, listenerUserData: rawptr)
GetTimeInMicrosencondsCallback :: #type proc() -> i64
SerializeCallback :: #type proc(serializeHandle: rawptr, buffer: rawptr, size: i32)
DeserializeCallback :: #type proc(serializeHandle: rawptr, buffer: rawptr, size: i32)
OnBodySerializationCallback :: #type proc(body: ^Body, userData: rawptr, function: SerializeCallback, serializeHandle: rawptr)
OnBodyDeserializationCallback :: #type proc(body: ^Body, userData: rawptr, function: DeserializeCallback, serializeHandle: rawptr)
OnJointSerializationCallback :: #type proc(joint: ^Joint, function: SerializeCallback, serializeHandle: rawptr)
OnJointDeserializationCallback :: #type proc(body0: ^Body, body1: ^Body, function: DeserializeCallback, serializeHandle: rawptr)
OnUserCollisionSerializationCallback :: #type proc(userData: rawptr, function: SerializeCallback, serializeHandle: rawptr)
UserMeshCollisionDestroyCallback :: #type proc(userData: rawptr)
UserMeshCollisionRayHitCallback :: #type proc(lineDescData: ^UserMeshCollisionRayHitDesc) -> dFloat
UserMeshCollisionGetCollisionInfo :: #type proc(userData: rawptr, infoRecord: ^CollisionInfoRecord)
UserMeshCollisionAABBTest :: #type proc(userData: rawptr, boxP0: ^dFloat, boxP1: ^dFloat) -> i32
UserMeshCollisionGetFacesInAABB :: #type proc(userData: rawptr, p0: ^dFloat, p1: ^dFloat, vertexArray: ^^dFloat, vertexCount: ^i32, vertexStrideInBytes: ^i32, indexList: ^i32, maxIndexCount: i32, userDataList: ^i32) -> i32
UserMeshCollisionCollideCallback :: #type proc(collideDescData: ^UserMeshCollisionCollideDesc, continueCollisionHandle: rawptr)
TreeCollisionFaceCallback :: #type proc(_context: rawptr, polygon: ^dFloat, strideInBytes: i32, indexArray: ^i32, indexCount: i32) -> i32
CollisionTreeRayCastCallback :: #type proc(body: ^Body, treeCollision: ^Collision, intersection: dFloat, normal: ^dFloat, faceId: i32, usedData: rawptr) -> dFloat
HeightFieldRayCastCallback :: #type proc(body: ^Body, heightFieldCollision: ^Collision, intersection: dFloat, row: i32, col: i32, normal: ^dFloat, faceId: i32, usedData: rawptr) -> dFloat
CollisionCopyConstructionCallback :: #type proc(newtonWorld: ^World, collision: ^Collision, sourceCollision: ^Collision)
CollisionDestructorCallback :: #type proc(newtonWorld: ^World, collision: ^Collision)
TreeCollisionCallback :: #type proc(bodyWithTreeCollision: ^Body, body: ^Body, faceID: i32, vertexCount: i32, vertex: ^dFloat, vertexStrideInBytes: i32)
BodyDestructor :: #type proc(body: ^Body)
ApplyForceAndTorque :: #type proc(body: ^Body, timestep: dFloat, threadIndex: i32)
SetTransform :: #type proc(body: ^Body, matrix4x4: ^float4x4, threadIndex: i32)
IslandUpdate :: #type proc(newtonWorld: ^World, islandHandle: rawptr, bodyCount: i32) -> i32
FractureCompoundCollisionOnEmitCompoundFractured :: #type proc(fracturedBody: ^Body)
FractureCompoundCollisionOnEmitChunk :: #type proc(chunkBody: ^Body, fracturexChunkMesh: ^FracturedCompoundMeshPart, fracturedCompountCollision: ^Collision)
FractureCompoundCollisionReconstructMainMeshCallBack :: #type proc(body: ^Body, mainMesh: ^FracturedCompoundMeshPart, fracturedCompountCollision: ^Collision)
WorldRayPrefilterCallback :: #type proc(body: ^Body, collision: ^Collision, userData: rawptr) -> u32
WorldRayFilterCallback :: #type proc(body: ^Body, shapeHit: ^Collision, hitContact: ^dFloat, hitNormal: ^dFloat, collisionID: i64, userData: rawptr, intersectParam: dFloat) -> dFloat
OnAABBOverlap :: #type proc(contact: ^Joint, timestep: dFloat, threadIndex: i32) -> i32
ContactsProcess :: #type proc(contact: ^Joint, timestep: dFloat, threadIndex: i32)
OnCompoundSubCollisionAABBOverlap :: #type proc(contact: ^Joint, timestep: dFloat, body0: ^Body, collisionNode0: rawptr, body1: ^Body, collisionNode1: rawptr, threadIndex: i32) -> i32
OnContactGeneration :: #type proc(material: ^Material, body0: ^Body, collision0: ^Collision, body1: ^Body, collision1: ^Collision, contactBuffer: ^UserContactPoint, maxCount: i32, threadIndex: i32) -> i32
BodyIterator :: #type proc(body: ^Body, userData: rawptr) -> i32
JointIterator :: #type proc(joint: ^Joint, userData: rawptr)
CollisionIterator :: #type proc(userData: rawptr, vertexCount: i32, faceArray: ^dFloat, faceId: i32)
BallCallback :: #type proc(ball: ^Joint, timestep: dFloat)
HingeCallback :: #type proc(hinge: ^Joint, desc: ^HingeSliderUpdateDesc) -> u32
SliderCallback :: #type proc(slider: ^Joint, desc: ^HingeSliderUpdateDesc) -> u32
UniversalCallback :: #type proc(universal: ^Joint, desc: ^HingeSliderUpdateDesc) -> u32
CorkscrewCallback :: #type proc(corkscrew: ^Joint, desc: ^HingeSliderUpdateDesc) -> u32
UserBilateralCallback :: #type proc(userJoint: ^Joint, timestep: dFloat, threadIndex: i32)
UserBilateralGetInfoCallback :: #type proc(userJoint: ^Joint, info: ^JointRecord)
ConstraintDestructor :: #type proc(me: ^Joint)
JobTask :: #type proc(world: ^World, userData: rawptr, threadIndex: i32)
ReportProgress :: #type proc(normalizedProgressPercent: dFloat, userData: rawptr) -> i32

Mesh :: struct {}

Body :: struct {}

World :: struct {}

Joint :: struct {}

Material :: struct {}

Collision :: struct {}

DeformableMeshSegment :: struct {}

FracturedCompoundMeshPart :: struct {}

CollisionMaterial :: struct {
	m_userId:    i64,
	m_userData:  MaterialData,
	m_userParam: [6]MaterialData,
}

BoxParam :: struct {
	m_x: dFloat,
	m_y: dFloat,
	m_z: dFloat,
}

SphereParam :: struct {
	m_radio: dFloat,
}

CapsuleParam :: struct {
	m_radio0: dFloat,
	m_radio1: dFloat,
	m_height: dFloat,
}

CylinderParam :: struct {
	m_radio0: dFloat,
	m_radio1: dFloat,
	m_height: dFloat,
}

ConeParam :: struct {
	m_radio:  dFloat,
	m_height: dFloat,
}

ChamferCylinderParam :: struct {
	m_radio:  dFloat,
	m_height: dFloat,
}

ConvexHullParam :: struct {
	m_vertexCount:         i32,
	m_vertexStrideInBytes: i32,
	m_faceCount:           i32,
	m_vertex:              ^dFloat,
}

CompoundCollisionParam :: struct {
	m_chidrenCount: i32,
}

CollisionTreeParam :: struct {
	m_vertexCount: i32,
	m_indexCount:  i32,
}

DeformableMeshParam :: struct {
	m_vertexCount:        i32,
	m_triangleCount:      i32,
	m_vrtexStrideInBytes: i32,
	m_indexList:          ^u16,
	m_vertexList:         ^dFloat,
}

HeightFieldCollisionParam :: struct {
	m_width:             i32,
	m_height:            i32,
	m_gridsDiagonals:    i32,
	m_elevationDataType: i32,
	m_verticalScale:     dFloat,
	m_horizonalScale_x:  dFloat,
	m_horizonalScale_z:  dFloat,
	m_vertialElevation:  rawptr,
	m_atributes:         cstring,
}

SceneCollisionParam :: struct {
	m_childrenProxyCount: i32,
}

CollisionInfoRecord :: struct {
	m_offsetMatrix:      float4x4,
	m_collisionMaterial: CollisionMaterial,
	m_collisionType:     SerializeId, //i32,
	using _:             struct #raw_union {
		m_box:               BoxParam,
		m_cone:              ConeParam,
		m_sphere:            SphereParam,
		m_capsule:           CapsuleParam,
		m_cylinder:          CylinderParam,
		m_chamferCylinder:   ChamferCylinderParam,
		m_convexHull:        ConvexHullParam,
		m_deformableMesh:    DeformableMeshParam,
		m_compoundCollision: CompoundCollisionParam,
		m_collisionTree:     CollisionTreeParam,
		m_heightField:       HeightFieldCollisionParam,
		m_sceneCollision:    SceneCollisionParam,
		m_paramArray:        [64]dFloat,
	},
}

JointRecord :: struct /*#packed*/ {
	m_attachmenMatrix_0: float4x4,
	m_attachmenMatrix_1: float4x4,
	m_minLinearDof:      float3,
	m_maxLinearDof:      float3,
	m_minAngularDof:     float3,
	m_maxAngularDof:     float3,
	m_attachBody_0:      ^Body,
	m_attachBody_1:      ^Body,
	m_extraParameters:   [64]dFloat,
	m_bodiesCollisionOn: i32,
	m_descriptionType:   [128]u8,
}

UserMeshCollisionCollideDesc :: struct {
	m_boxP0:               float4,
	m_boxP1:               float4,
	m_boxDistanceTravel:   float4,
	m_threadNumber:        i32,
	m_faceCount:           i32,
	m_vertexStrideInBytes: i32,
	m_skinThickness:       dFloat,
	m_userData:            rawptr,
	m_objBody:             ^Body,
	m_polySoupBody:        ^Body,
	m_objCollision:        ^Collision,
	m_polySoupCollision:   ^Collision,
	m_vertex:              ^dFloat,
	m_faceIndexCount:      ^i32,
	m_faceVertexIndex:     ^i32,
}

WorldConvexCastReturnInfo :: struct {
	m_point:       float4,
	m_normal:      float4,
	m_contactID:   i64,
	m_hitBody:     ^Body,
	m_penetration: dFloat,
}

UserMeshCollisionRayHitDesc :: struct {
	m_p0:        float4,
	m_p1:        float4,
	m_normalOut: float4,
	m_userIdOut: i64,
	m_userData:  rawptr,
}

HingeSliderUpdateDesc :: struct {
	m_accel:       dFloat,
	m_minFriction: dFloat,
	m_maxFriction: dFloat,
	m_timestep:    dFloat,
}

UserContactPoint :: struct {
	m_point:       float4,
	m_normal:      float4,
	m_shapeId0:    i64,
	m_shapeId1:    i64,
	m_penetration: dFloat,
	m_unused:      int3,
}

ImmediateModeConstraint :: struct {
	m_jacobian01:     [8]JacobianPair, // [8][6]dFloat
	m_jacobian10:     [8]JacobianPair,
	m_minFriction:    [8]dFloat,
	m_maxFriction:    [8]dFloat,
	m_jointAccel:     [8]dFloat,
	m_jointStiffness: [8]dFloat,
}

JacobianPair :: struct {
	m_linear:  float3,
	m_angular: float3,
}

MeshDoubleData :: struct {
	m_data:          ^f64,
	m_indexList:     ^i32,
	m_strideInBytes: i32,
}

MeshFloatData :: struct {
	m_data:          ^dFloat,
	m_indexList:     ^i32,
	m_strideInBytes: i32,
}

MeshVertexFormat :: struct {
	m_faceCount:      i32,
	m_faceIndexCount: ^i32,
	m_faceMaterial:   ^i32,
	m_vertex:         MeshDoubleData,
	m_normal:         MeshFloatData,
	m_binormal:       MeshFloatData,
	m_uv0:            MeshFloatData,
	m_uv1:            MeshFloatData,
	m_vertexColor:    MeshFloatData,
}

MaterialData :: struct #raw_union {
	m_ptr:   rawptr,
	m_int:   i64,
	m_float: dFloat,
}

Face :: distinct rawptr
Edge :: distinct rawptr
Point :: distinct rawptr

@(default_calling_convention = "c", link_prefix = "Newton")
foreign newton {
	@(link_name = "NewtonWorldGetVersion")
	GetVersion :: proc() -> i32 ---
	@(link_name = "NewtonWorldFloatSize")
	GetFloatSize :: proc() -> i32 ---
	GetMemoryUsed :: proc() -> i32 ---
	SetMemorySystem :: proc(malloc: AllocMemory, free: FreeMemory) ---
	Create :: proc() -> ^World ---
	Destroy :: proc(newtonWorld: ^World) ---
	DestroyAllBodies :: proc(newtonWorld: ^World) ---
	GetPostUpdateCallback :: proc(newtonWorld: ^World) -> PostUpdateCallback ---
	SetPostUpdateCallback :: proc(newtonWorld: ^World, callback: PostUpdateCallback) ---
	Alloc :: proc(sizeInBytes: i32) -> rawptr ---
	Free :: proc(ptr: rawptr) ---
	LoadPlugins :: proc(newtonWorld: ^World, plugInPath: cstring) ---
	UnloadPlugins :: proc(newtonWorld: ^World) ---
	CurrentPlugin :: proc(newtonWorld: ^World) -> rawptr ---
	GetFirstPlugin :: proc(newtonWorld: ^World) -> rawptr ---
	GetPreferedPlugin :: proc(newtonWorld: ^World) -> rawptr ---
	GetNextPlugin :: proc(newtonWorld: ^World, plugin: rawptr) -> rawptr ---
	GetPluginString :: proc(newtonWorld: ^World, plugin: rawptr) -> cstring ---
	SelectPlugin :: proc(newtonWorld: ^World, plugin: rawptr) ---
	GetContactMergeTolerance :: proc(newtonWorld: ^World) -> dFloat ---
	SetContactMergeTolerance :: proc(newtonWorld: ^World, tolerance: dFloat) ---
	InvalidateCache :: proc(newtonWorld: ^World) ---
	SetSolverIterations :: proc(newtonWorld: ^World, model: i32) ---
	GetSolverIterations :: proc(newtonWorld: ^World) -> i32 ---
	SetParallelSolverOnLargeIsland :: proc(newtonWorld: ^World, mode: i32) ---
	GetParallelSolverOnLargeIsland :: proc(newtonWorld: ^World) -> i32 ---
	GetBroadphaseAlgorithm :: proc(newtonWorld: ^World) -> BroadPhaseType ---
	SelectBroadphaseAlgorithm :: proc(newtonWorld: ^World, algorithmType: BroadPhaseType) ---
	ResetBroadphase :: proc(newtonWorld: ^World) ---
	Update :: proc(newtonWorld: ^World, timestep: dFloat) ---
	UpdateAsync :: proc(newtonWorld: ^World, timestep: dFloat) ---
	WaitForUpdateToFinish :: proc(newtonWorld: ^World) ---
	GetNumberOfSubsteps :: proc(newtonWorld: ^World) -> i32 ---
	SetNumberOfSubsteps :: proc(newtonWorld: ^World, subSteps: i32) ---
	GetLastUpdateTime :: proc(newtonWorld: ^World) -> dFloat ---
	SerializeToFile :: proc(newtonWorld: ^World, filename: cstring, bodyCallback: OnBodySerializationCallback, bodyUserData: rawptr) ---
	DeserializeFromFile :: proc(newtonWorld: ^World, filename: cstring, bodyCallback: OnBodyDeserializationCallback, bodyUserData: rawptr) ---
	SerializeScene :: proc(newtonWorld: ^World, bodyCallback: OnBodySerializationCallback, bodyUserData: rawptr, serializeCallback: SerializeCallback, serializeHandle: rawptr) ---
	DeserializeScene :: proc(newtonWorld: ^World, bodyCallback: OnBodyDeserializationCallback, bodyUserData: rawptr, serializeCallback: DeserializeCallback, serializeHandle: rawptr) ---
	FindSerializedBody :: proc(newtonWorld: ^World, bodySerializedID: i32) -> ^Body ---
	SetJointSerializationCallbacks :: proc(newtonWorld: ^World, serializeJoint: OnJointSerializationCallback, deserializeJoint: OnJointDeserializationCallback) ---
	GetJointSerializationCallbacks :: proc(newtonWorld: ^World, serializeJoint: ^OnJointSerializationCallback, deserializeJoint: ^OnJointDeserializationCallback) ---
	WorldCriticalSectionLock :: proc(newtonWorld: ^World, threadIndex: i32) ---
	WorldCriticalSectionUnlock :: proc(newtonWorld: ^World) ---
	SetThreadsCount :: proc(newtonWorld: ^World, threads: i32) ---
	GetThreadsCount :: proc(newtonWorld: ^World) -> i32 ---
	GetMaxThreadsCount :: proc(newtonWorld: ^World) -> i32 ---
	DispachThreadJob :: proc(newtonWorld: ^World, task: JobTask, usedData: rawptr, functionName: cstring) ---
	SyncThreadJobs :: proc(newtonWorld: ^World) ---
	AtomicAdd :: proc(ptr: ^i32, value: i32) -> i32 ---
	AtomicSwap :: proc(ptr: ^i32, value: i32) -> i32 ---
	Yield :: proc() ---
	SetIslandUpdateEvent :: proc(newtonWorld: ^World, islandUpdate: IslandUpdate) ---
	WorldForEachJointDo :: proc(newtonWorld: ^World, callback: JointIterator, userData: rawptr) ---
	WorldForEachBodyInAABBDo :: proc(newtonWorld: ^World, p0: ^dFloat, p1: ^dFloat, callback: BodyIterator, userData: rawptr) ---
	WorldSetUserData :: proc(newtonWorld: ^World, userData: rawptr) ---
	WorldGetUserData :: proc(newtonWorld: ^World) -> rawptr ---
	WorldAddListener :: proc(newtonWorld: ^World, nameId: cstring, listenerUserData: rawptr) -> rawptr ---
	WorldGetListener :: proc(newtonWorld: ^World, nameId: cstring) -> rawptr ---
	WorldListenerSetDebugCallback :: proc(newtonWorld: ^World, listener: rawptr, callback: WorldListenerDebugCallback) ---
	WorldListenerSetPostStepCallback :: proc(newtonWorld: ^World, listener: rawptr, callback: WorldUpdateListenerCallback) ---
	WorldListenerSetPreUpdateCallback :: proc(newtonWorld: ^World, listener: rawptr, callback: WorldUpdateListenerCallback) ---
	WorldListenerSetPostUpdateCallback :: proc(newtonWorld: ^World, listener: rawptr, callback: WorldUpdateListenerCallback) ---
	WorldListenerSetDestructorCallback :: proc(newtonWorld: ^World, listener: rawptr, callback: WorldDestroyListenerCallback) ---
	WorldListenerSetBodyDestroyCallback :: proc(newtonWorld: ^World, listener: rawptr, callback: WorldListenerBodyDestroyCallback) ---
	WorldListenerDebug :: proc(newtonWorld: ^World, _context: rawptr) ---
	WorldGetListenerUserData :: proc(newtonWorld: ^World, listener: rawptr) -> rawptr ---
	WorldListenerGetBodyDestroyCallback :: proc(newtonWorld: ^World, listener: rawptr) -> WorldListenerBodyDestroyCallback ---
	WorldSetDestructorCallback :: proc(newtonWorld: ^World, destructor: WorldDestructorCallback) ---
	WorldGetDestructorCallback :: proc(newtonWorld: ^World) -> WorldDestructorCallback ---
	WorldSetCollisionConstructorDestructorCallback :: proc(newtonWorld: ^World, constructor: CollisionCopyConstructionCallback, destructor: CollisionDestructorCallback) ---
	WorldSetCreateDestroyContactCallback :: proc(newtonWorld: ^World, createContact: CreateContactCallback, destroyContact: DestroyContactCallback) ---
	WorldRayCast :: proc(newtonWorld: ^World, p0: ^dFloat, p1: ^dFloat, filter: WorldRayFilterCallback, userData: rawptr, prefilter: WorldRayPrefilterCallback, threadIndex: i32) ---
	WorldConvexCast :: proc(newtonWorld: ^World, matrix4x4: ^float4x4, target: ^dFloat, shape: ^Collision, param: ^dFloat, userData: rawptr, prefilter: WorldRayPrefilterCallback, info: ^WorldConvexCastReturnInfo, maxContactsCount: i32, threadIndex: i32) -> i32 ---
	WorldCollide :: proc(newtonWorld: ^World, matrix4x4: ^float4x4, shape: ^Collision, userData: rawptr, prefilter: WorldRayPrefilterCallback, info: ^WorldConvexCastReturnInfo, maxContactsCount: i32, threadIndex: i32) -> i32 ---
	WorldGetBodyCount :: proc(newtonWorld: ^World) -> i32 ---
	WorldGetConstraintCount :: proc(newtonWorld: ^World) -> i32 ---
	WorldFindJoint :: proc(body0: ^Body, body1: ^Body) -> ^Joint ---
	IslandGetBody :: proc(island: rawptr, bodyIndex: i32) -> ^Body ---
	IslandGetBodyAABB :: proc(island: rawptr, bodyIndex: i32, p0: ^dFloat, p1: ^dFloat) ---
	MaterialCreateGroupID :: proc(newtonWorld: ^World) -> i32 ---
	MaterialGetDefaultGroupID :: proc(newtonWorld: ^World) -> i32 ---
	MaterialDestroyAllGroupID :: proc(newtonWorld: ^World) ---
	MaterialGetUserData :: proc(newtonWorld: ^World, id0: i32, id1: i32) -> rawptr ---
	MaterialSetSurfaceThickness :: proc(newtonWorld: ^World, id0: i32, id1: i32, thickness: dFloat) ---
	MaterialSetCallbackUserData :: proc(newtonWorld: ^World, id0: i32, id1: i32, userData: rawptr) ---
	MaterialSetContactGenerationCallback :: proc(newtonWorld: ^World, id0: i32, id1: i32, contactGeneration: OnContactGeneration) ---
	MaterialSetCompoundCollisionCallback :: proc(newtonWorld: ^World, id0: i32, id1: i32, compoundAabbOverlap: OnCompoundSubCollisionAABBOverlap) ---
	MaterialSetCollisionCallback :: proc(newtonWorld: ^World, id0: i32, id1: i32, aabbOverlap: OnAABBOverlap, process: ContactsProcess) ---
	MaterialSetDefaultSoftness :: proc(newtonWorld: ^World, id0: i32, id1: i32, value: dFloat) ---
	MaterialSetDefaultElasticity :: proc(newtonWorld: ^World, id0: i32, id1: i32, elasticCoef: dFloat) ---
	MaterialSetDefaultCollidable :: proc(newtonWorld: ^World, id0: i32, id1: i32, state: i32) ---
	MaterialSetDefaultFriction :: proc(newtonWorld: ^World, id0: i32, id1: i32, staticFriction: dFloat, kineticFriction: dFloat) ---
	MaterialJointResetIntraJointCollision :: proc(newtonWorld: ^World, id0: i32, id1: i32) ---
	MaterialJointResetSelftJointCollision :: proc(newtonWorld: ^World, id0: i32, id1: i32) ---
	WorldGetFirstMaterial :: proc(newtonWorld: ^World) -> ^Material ---
	WorldGetNextMaterial :: proc(newtonWorld: ^World, material: ^Material) -> ^Material ---
	WorldGetFirstBody :: proc(newtonWorld: ^World) -> ^Body ---
	WorldGetNextBody :: proc(newtonWorld: ^World, curBody: ^Body) -> ^Body ---
	MaterialGetMaterialPairUserData :: proc(material: ^Material) -> rawptr ---
	MaterialGetContactFaceAttribute :: proc(material: ^Material) -> u32 ---
	MaterialGetBodyCollidingShape :: proc(material: ^Material, body: ^Body) -> ^Collision ---
	MaterialGetContactNormalSpeed :: proc(material: ^Material) -> dFloat ---
	MaterialGetContactForce :: proc(material: ^Material, body: ^Body, force: ^dFloat) ---
	MaterialGetContactPositionAndNormal :: proc(material: ^Material, body: ^Body, posit: ^dFloat, normal: ^dFloat) ---
	MaterialGetContactTangentDirections :: proc(material: ^Material, body: ^Body, dir0: ^dFloat, dir1: ^dFloat) ---
	MaterialGetContactTangentSpeed :: proc(material: ^Material, index: i32) -> dFloat ---
	MaterialGetContactMaxNormalImpact :: proc(material: ^Material) -> dFloat ---
	MaterialGetContactMaxTangentImpact :: proc(material: ^Material, index: i32) -> dFloat ---
	MaterialGetContactPenetration :: proc(material: ^Material) -> dFloat ---
	MaterialSetAsSoftContact :: proc(material: ^Material, relaxation: dFloat) ---
	MaterialSetContactSoftness :: proc(material: ^Material, softness: dFloat) ---
	MaterialSetContactThickness :: proc(material: ^Material, thickness: dFloat) ---
	MaterialSetContactElasticity :: proc(material: ^Material, restitution: dFloat) ---
	MaterialSetContactFrictionState :: proc(material: ^Material, state: i32, index: i32) ---
	MaterialSetContactFrictionCoef :: proc(material: ^Material, staticFrictionCoef: dFloat, kineticFrictionCoef: dFloat, index: i32) ---
	MaterialSetContactNormalAcceleration :: proc(material: ^Material, accel: dFloat) ---
	MaterialSetContactNormalDirection :: proc(material: ^Material, directionVector: ^dFloat) ---
	MaterialSetContactPosition :: proc(material: ^Material, position: ^dFloat) ---
	MaterialSetContactTangentFriction :: proc(material: ^Material, friction: dFloat, index: i32) ---
	MaterialSetContactTangentAcceleration :: proc(material: ^Material, accel: dFloat, index: i32) ---
	MaterialContactRotateTangentDirections :: proc(material: ^Material, directionVector: ^dFloat) ---
	MaterialGetContactPruningTolerance :: proc(contactJoint: ^Joint) -> dFloat ---
	MaterialSetContactPruningTolerance :: proc(contactJoint: ^Joint, tolerance: dFloat) ---
	CreateNull :: proc(newtonWorld: ^World) -> ^Collision ---
	CreateSphere :: proc(newtonWorld: ^World, radius: dFloat, shapeID: i32, offsetMatrix: ^float4x4) -> ^Collision ---
	CreateBox :: proc(newtonWorld: ^World, dx: dFloat, dy: dFloat, dz: dFloat, shapeID: i32, offsetMatrix: ^float4x4) -> ^Collision ---
	CreateCone :: proc(newtonWorld: ^World, radius: dFloat, height: dFloat, shapeID: i32, offsetMatrix: ^float4x4) -> ^Collision ---
	CreateCapsule :: proc(newtonWorld: ^World, radius0: dFloat, radius1: dFloat, height: dFloat, shapeID: i32, offsetMatrix: ^float4x4) -> ^Collision ---
	CreateCylinder :: proc(newtonWorld: ^World, radio0: dFloat, radio1: dFloat, height: dFloat, shapeID: i32, offsetMatrix: ^float4x4) -> ^Collision ---
	CreateChamferCylinder :: proc(newtonWorld: ^World, radius: dFloat, height: dFloat, shapeID: i32, offsetMatrix: ^float4x4) -> ^Collision ---
	CreateConvexHull :: proc(newtonWorld: ^World, count: i32, vertexCloud: ^dFloat, strideInBytes: i32, tolerance: dFloat, shapeID: i32, offsetMatrix: ^float4x4) -> ^Collision ---
	CreateConvexHullFromMesh :: proc(newtonWorld: ^World, mesh: ^Mesh, tolerance: dFloat, shapeID: i32) -> ^Collision ---
	CollisionGetMode :: proc(convexCollision: ^Collision) -> i32 ---
	CollisionSetMode :: proc(convexCollision: ^Collision, mode: i32) ---
	ConvexHullGetFaceIndices :: proc(convexHullCollision: ^Collision, face: i32, faceIndices: ^i32) -> i32 ---
	ConvexHullGetVertexData :: proc(convexHullCollision: ^Collision, vertexData: ^^dFloat, strideInBytes: ^i32) -> i32 ---
	ConvexCollisionCalculateVolume :: proc(convexCollision: ^Collision) -> dFloat ---
	ConvexCollisionCalculateInertialMatrix :: proc(convexCollision: ^Collision, inertia: ^dFloat, origin: ^dFloat) ---
	ConvexCollisionCalculateBuoyancyVolume :: proc(convexCollision: ^Collision, matrix4x4: ^float4x4, fluidPlane: ^dFloat, centerOfBuoyancy: ^dFloat) -> dFloat ---
	CollisionDataPointer :: proc(convexCollision: ^Collision) -> rawptr ---
	CreateCompoundCollision :: proc(newtonWorld: ^World, shapeID: i32) -> ^Collision ---
	CreateCompoundCollisionFromMesh :: proc(newtonWorld: ^World, mesh: ^Mesh, hullTolerance: dFloat, shapeID: i32, subShapeID: i32) -> ^Collision ---
	CompoundCollisionBeginAddRemove :: proc(compoundCollision: ^Collision) ---
	CompoundCollisionAddSubCollision :: proc(compoundCollision: ^Collision, convexCollision: ^Collision) -> rawptr ---
	CompoundCollisionRemoveSubCollision :: proc(compoundCollision: ^Collision, collisionNode: rawptr) ---
	CompoundCollisionRemoveSubCollisionByIndex :: proc(compoundCollision: ^Collision, nodeIndex: i32) ---
	CompoundCollisionSetSubCollisionMatrix :: proc(compoundCollision: ^Collision, collisionNode: rawptr, matrix4x4: ^float4x4) ---
	CompoundCollisionEndAddRemove :: proc(compoundCollision: ^Collision) ---
	CompoundCollisionGetFirstNode :: proc(compoundCollision: ^Collision) -> rawptr ---
	CompoundCollisionGetNextNode :: proc(compoundCollision: ^Collision, collisionNode: rawptr) -> rawptr ---
	CompoundCollisionGetNodeByIndex :: proc(compoundCollision: ^Collision, index: i32) -> rawptr ---
	CompoundCollisionGetNodeIndex :: proc(compoundCollision: ^Collision, collisionNode: rawptr) -> i32 ---
	CompoundCollisionGetCollisionFromNode :: proc(compoundCollision: ^Collision, collisionNode: rawptr) -> ^Collision ---
	CreateFracturedCompoundCollision :: proc(newtonWorld: ^World, solidMesh: ^Mesh, shapeID: i32, fracturePhysicsMaterialID: i32, pointcloudCount: i32, vertexCloud: ^dFloat, strideInBytes: i32, materialID: i32, textureMatrix: ^float4x4, regenerateMainMeshCallback: FractureCompoundCollisionReconstructMainMeshCallBack, emitFracturedCompound: FractureCompoundCollisionOnEmitCompoundFractured, emitFracfuredChunk: FractureCompoundCollisionOnEmitChunk) -> ^Collision ---
	FracturedCompoundPlaneClip :: proc(fracturedCompound: ^Collision, plane: ^dFloat) -> ^Collision ---
	FracturedCompoundSetCallbacks :: proc(fracturedCompound: ^Collision, regenerateMainMeshCallback: FractureCompoundCollisionReconstructMainMeshCallBack, emitFracturedCompound: FractureCompoundCollisionOnEmitCompoundFractured, emitFracfuredChunk: FractureCompoundCollisionOnEmitChunk) ---
	FracturedCompoundIsNodeFreeToDetach :: proc(fracturedCompound: ^Collision, collisionNode: rawptr) -> i32 ---
	FracturedCompoundNeighborNodeList :: proc(fracturedCompound: ^Collision, collisionNode: rawptr, list: ^rawptr, maxCount: i32) -> i32 ---
	FracturedCompoundGetMainMesh :: proc(fracturedCompound: ^Collision) -> ^FracturedCompoundMeshPart ---
	FracturedCompoundGetFirstSubMesh :: proc(fracturedCompound: ^Collision) -> ^FracturedCompoundMeshPart ---
	FracturedCompoundGetNextSubMesh :: proc(fracturedCompound: ^Collision, subMesh: ^FracturedCompoundMeshPart) -> ^FracturedCompoundMeshPart ---
	FracturedCompoundCollisionGetVertexCount :: proc(fracturedCompound: ^Collision, meshOwner: ^FracturedCompoundMeshPart) -> i32 ---
	FracturedCompoundCollisionGetVertexPositions :: proc(fracturedCompound: ^Collision, meshOwner: ^FracturedCompoundMeshPart) -> ^dFloat ---
	FracturedCompoundCollisionGetVertexNormals :: proc(fracturedCompound: ^Collision, meshOwner: ^FracturedCompoundMeshPart) -> ^dFloat ---
	FracturedCompoundCollisionGetVertexUVs :: proc(fracturedCompound: ^Collision, meshOwner: ^FracturedCompoundMeshPart) -> ^dFloat ---
	FracturedCompoundMeshPartGetIndexStream :: proc(fracturedCompound: ^Collision, meshOwner: ^FracturedCompoundMeshPart, segment: rawptr, index: ^i32) -> i32 ---
	FracturedCompoundMeshPartGetFirstSegment :: proc(fractureCompoundMeshPart: ^FracturedCompoundMeshPart) -> rawptr ---
	FracturedCompoundMeshPartGetNextSegment :: proc(fractureCompoundMeshSegment: rawptr) -> rawptr ---
	FracturedCompoundMeshPartGetMaterial :: proc(fractureCompoundMeshSegment: rawptr) -> i32 ---
	FracturedCompoundMeshPartGetIndexCount :: proc(fractureCompoundMeshSegment: rawptr) -> i32 ---
	CreateSceneCollision :: proc(newtonWorld: ^World, shapeID: i32) -> ^Collision ---
	SceneCollisionBeginAddRemove :: proc(sceneCollision: ^Collision) ---
	SceneCollisionAddSubCollision :: proc(sceneCollision: ^Collision, collision: ^Collision) -> rawptr ---
	SceneCollisionRemoveSubCollision :: proc(compoundCollision: ^Collision, collisionNode: rawptr) ---
	SceneCollisionRemoveSubCollisionByIndex :: proc(sceneCollision: ^Collision, nodeIndex: i32) ---
	SceneCollisionSetSubCollisionMatrix :: proc(sceneCollision: ^Collision, collisionNode: rawptr, matrix4x4: ^float4x4) ---
	SceneCollisionEndAddRemove :: proc(sceneCollision: ^Collision) ---
	SceneCollisionGetFirstNode :: proc(sceneCollision: ^Collision) -> rawptr ---
	SceneCollisionGetNextNode :: proc(sceneCollision: ^Collision, collisionNode: rawptr) -> rawptr ---
	SceneCollisionGetNodeByIndex :: proc(sceneCollision: ^Collision, index: i32) -> rawptr ---
	SceneCollisionGetNodeIndex :: proc(sceneCollision: ^Collision, collisionNode: rawptr) -> i32 ---
	SceneCollisionGetCollisionFromNode :: proc(sceneCollision: ^Collision, collisionNode: rawptr) -> ^Collision ---
	CreateUserMeshCollision :: proc(newtonWorld: ^World, minBox: ^dFloat, maxBox: ^dFloat, userData: rawptr, collideCallback: UserMeshCollisionCollideCallback, rayHitCallback: UserMeshCollisionRayHitCallback, destroyCallback: UserMeshCollisionDestroyCallback, getInfoCallback: UserMeshCollisionGetCollisionInfo, getLocalAABBCallback: UserMeshCollisionAABBTest, facesInAABBCallback: UserMeshCollisionGetFacesInAABB, serializeCallback: OnUserCollisionSerializationCallback, shapeID: i32) -> ^Collision ---
	UserMeshCollisionContinuousOverlapTest :: proc(collideDescData: ^UserMeshCollisionCollideDesc, continueCollisionHandle: rawptr, minAabb: ^dFloat, maxAabb: ^dFloat) -> i32 ---
	CreateCollisionFromSerialization :: proc(newtonWorld: ^World, deserializeFunction: DeserializeCallback, serializeHandle: rawptr) -> ^Collision ---
	CollisionSerialize :: proc(newtonWorld: ^World, collision: ^Collision, serializeFunction: SerializeCallback, serializeHandle: rawptr) ---
	CollisionGetInfo :: proc(collision: ^Collision, collisionInfo: ^CollisionInfoRecord) ---
	CreateHeightFieldCollision :: proc(newtonWorld: ^World, width: i32, height: i32, gridsDiagonals: i32, elevationdatType: i32, elevationMap: rawptr, attributeMap: cstring, verticalScale: dFloat, horizontalScale_x: dFloat, horizontalScale_z: dFloat, shapeID: i32) -> ^Collision ---
	HeightFieldSetUserRayCastCallback :: proc(heightfieldCollision: ^Collision, rayHitCallback: HeightFieldRayCastCallback) ---
	CreateTreeCollision :: proc(newtonWorld: ^World, shapeID: i32) -> ^Collision ---
	CreateTreeCollisionFromMesh :: proc(newtonWorld: ^World, mesh: ^Mesh, shapeID: i32) -> ^Collision ---
	TreeCollisionSetUserRayCastCallback :: proc(treeCollision: ^Collision, rayHitCallback: CollisionTreeRayCastCallback) ---
	TreeCollisionBeginBuild :: proc(treeCollision: ^Collision) ---
	TreeCollisionAddFace :: proc(treeCollision: ^Collision, vertexCount: i32, vertexPtr: ^dFloat, strideInBytes: i32, faceAttribute: i32) ---
	TreeCollisionEndBuild :: proc(treeCollision: ^Collision, optimize: i32) ---
	TreeCollisionGetFaceAttribute :: proc(treeCollision: ^Collision, faceIndexArray: ^i32, indexCount: i32) -> i32 ---
	TreeCollisionSetFaceAttribute :: proc(treeCollision: ^Collision, faceIndexArray: ^i32, indexCount: i32, attribute: i32) ---
	TreeCollisionForEachFace :: proc(treeCollision: ^Collision, forEachFaceCallback: TreeCollisionFaceCallback, _context: rawptr) ---
	TreeCollisionGetVertexListTriangleListInAABB :: proc(treeCollision: ^Collision, p0: ^dFloat, p1: ^dFloat, vertexArray: ^^dFloat, vertexCount: ^i32, vertexStrideInBytes: ^i32, indexList: ^i32, maxIndexCount: i32, faceAttribute: ^i32) -> i32 ---
	StaticCollisionSetDebugCallback :: proc(staticCollision: ^Collision, userCallback: TreeCollisionCallback) ---
	CollisionCreateInstance :: proc(collision: ^Collision) -> ^Collision ---
	CollisionGetType :: proc(collision: ^Collision) -> SerializeId ---
	CollisionIsConvexShape :: proc(collision: ^Collision) -> b32 ---
	CollisionIsStaticShape :: proc(collision: ^Collision) -> b32 ---
	CollisionSetUserData :: proc(collision: ^Collision, userData: rawptr) ---
	CollisionGetUserData :: proc(collision: ^Collision) -> rawptr ---
	CollisionSetUserID :: proc(collision: ^Collision, id: i64) ---
	CollisionGetUserID :: proc(collision: ^Collision) -> i64 ---
	CollisionGetMaterial :: proc(collision: ^Collision, userData: ^CollisionMaterial) ---
	CollisionSetMaterial :: proc(collision: ^Collision, userData: ^CollisionMaterial) ---
	CollisionGetSubCollisionHandle :: proc(collision: ^Collision) -> rawptr ---
	CollisionGetParentInstance :: proc(collision: ^Collision) -> ^Collision ---
	CollisionSetMatrix :: proc(collision: ^Collision, matrix4x4: ^float4x4) ---
	CollisionGetMatrix :: proc(collision: ^Collision, matrix4x4: ^float4x4) ---
	CollisionSetScale :: proc(collision: ^Collision, scaleX: dFloat, scaleY: dFloat, scaleZ: dFloat) ---
	CollisionGetScale :: proc(collision: ^Collision, scaleX: ^dFloat, scaleY: ^dFloat, scaleZ: ^dFloat) ---
	DestroyCollision :: proc(collision: ^Collision) ---
	CollisionGetSkinThickness :: proc(collision: ^Collision) -> dFloat ---
	CollisionSetSkinThickness :: proc(collision: ^Collision, thickness: dFloat) ---
	CollisionIntersectionTest :: proc(newtonWorld: ^World, collisionA: ^Collision, matrixA: ^float4x4, collisionB: ^Collision, matrixB: ^float4x4, threadIndex: i32) -> i32 ---
	CollisionPointDistance :: proc(newtonWorld: ^World, point: ^dFloat, collision: ^Collision, matrix4x4: ^float4x4, contact: ^dFloat, normal: ^dFloat, threadIndex: i32) -> i32 ---
	CollisionClosestPoint :: proc(newtonWorld: ^World, collisionA: ^Collision, matrixA: ^float4x4, collisionB: ^Collision, matrixB: ^float4x4, contactA: ^dFloat, contactB: ^dFloat, normalAB: ^dFloat, threadIndex: i32) -> i32 ---
	CollisionCollide :: proc(newtonWorld: ^World, maxSize: i32, collisionA: ^Collision, matrixA: ^float4x4, collisionB: ^Collision, matrixB: ^float4x4, contacts: ^dFloat, normals: ^dFloat, penetration: ^dFloat, attributeA: ^i64, attributeB: ^i64, threadIndex: i32) -> i32 ---
	CollisionCollideContinue :: proc(newtonWorld: ^World, maxSize: i32, timestep: dFloat, collisionA: ^Collision, matrixA: ^float4x4, velocA: ^dFloat, omegaA: ^dFloat, collisionB: ^Collision, matrixB: ^dFloat, velocB: ^dFloat, omegaB: ^dFloat, timeOfImpact: ^dFloat, contacts: ^dFloat, normals: ^dFloat, penetration: ^dFloat, attributeA: ^i64, attributeB: ^i64, threadIndex: i32) -> i32 ---
	CollisionSupportVertex :: proc(collision: ^Collision, dir: ^dFloat, vertex: ^dFloat) ---
	CollisionRayCast :: proc(collision: ^Collision, p0: ^dFloat, p1: ^dFloat, normal: ^dFloat, attribute: ^i64) -> dFloat ---
	CollisionCalculateAABB :: proc(collision: ^Collision, matrix4x4: ^float4x4, p0: ^dFloat, p1: ^dFloat) ---
	CollisionForEachPolygonDo :: proc(collision: ^Collision, matrix4x4: ^float4x4, callback: CollisionIterator, userData: rawptr) ---
	CollisionAggregateCreate :: proc(world: ^World) -> rawptr ---
	CollisionAggregateDestroy :: proc(aggregate: rawptr) ---
	CollisionAggregateAddBody :: proc(aggregate: rawptr, body: ^Body) ---
	CollisionAggregateRemoveBody :: proc(aggregate: rawptr, body: ^Body) ---
	CollisionAggregateGetSelfCollision :: proc(aggregate: rawptr) -> i32 ---
	CollisionAggregateSetSelfCollision :: proc(aggregate: rawptr, state: i32) ---
	SetEulerAngle :: proc(eulersAngles: ^dFloat, matrix4x4: ^float4x4) ---
	GetEulerAngle :: proc(matrix4x4: ^float4x4, eulersAngles0: ^dFloat, eulersAngles1: ^dFloat) ---
	CalculateSpringDamperAcceleration :: proc(dt: dFloat, ks: dFloat, x: dFloat, kd: dFloat, s: dFloat) -> dFloat ---
	CreateDynamicBody :: proc(newtonWorld: ^World, collision: ^Collision, matrix4x4: ^float4x4) -> ^Body ---
	CreateKinematicBody :: proc(newtonWorld: ^World, collision: ^Collision, matrix4x4: ^float4x4) -> ^Body ---
	CreateAsymetricDynamicBody :: proc(newtonWorld: ^World, collision: ^Collision, matrix4x4: ^float4x4) -> ^Body ---
	DestroyBody :: proc(body: ^Body) ---
	BodyGetSimulationState :: proc(body: ^Body) -> i32 ---
	BodySetSimulationState :: proc(bodyPtr: ^Body, state: i32) ---
	BodyGetType :: proc(body: ^Body) -> BodyType ---
	BodyGetCollidable :: proc(body: ^Body) -> i32 ---
	BodySetCollidable :: proc(body: ^Body, collidableState: i32) ---
	BodyAddForce :: proc(body: ^Body, force: ^dFloat) ---
	BodyAddTorque :: proc(body: ^Body, torque: ^dFloat) ---
	BodySetCentreOfMass :: proc(body: ^Body, com: ^dFloat) ---
	BodySetMassMatrix :: proc(body: ^Body, mass: dFloat, Ixx: dFloat, Iyy: dFloat, Izz: dFloat) ---
	BodySetFullMassMatrix :: proc(body: ^Body, mass: dFloat, inertiaMatrix: ^float4x4) ---
	BodySetMassProperties :: proc(body: ^Body, mass: dFloat, collision: ^Collision) ---
	BodySetMatrix :: proc(body: ^Body, matrix4x4: ^float4x4) ---
	BodySetMatrixNoSleep :: proc(body: ^Body, matrix4x4: ^float4x4) ---
	BodySetMatrixRecursive :: proc(body: ^Body, matrix4x4: ^float4x4) ---
	BodySetMaterialGroupID :: proc(body: ^Body, id: i32) ---
	BodySetContinuousCollisionMode :: proc(body: ^Body, state: u32) ---
	BodySetJointRecursiveCollision :: proc(body: ^Body, state: u32) ---
	BodySetOmega :: proc(body: ^Body, omega: ^dFloat) ---
	BodySetOmegaNoSleep :: proc(body: ^Body, omega: ^dFloat) ---
	BodySetVelocity :: proc(body: ^Body, velocity: ^dFloat) ---
	BodySetVelocityNoSleep :: proc(body: ^Body, velocity: ^dFloat) ---
	BodySetForce :: proc(body: ^Body, force: ^dFloat) ---
	BodySetTorque :: proc(body: ^Body, torque: ^dFloat) ---
	BodySetLinearDamping :: proc(body: ^Body, linearDamp: dFloat) ---
	BodySetAngularDamping :: proc(body: ^Body, angularDamp: ^dFloat) ---
	BodySetCollision :: proc(body: ^Body, collision: ^Collision) ---
	BodySetCollisionScale :: proc(body: ^Body, scaleX: dFloat, scaleY: dFloat, scaleZ: dFloat) ---
	BodyGetSleepState :: proc(body: ^Body) -> i32 ---
	BodySetSleepState :: proc(body: ^Body, state: i32) ---
	BodyGetAutoSleep :: proc(body: ^Body) -> i32 ---
	BodySetAutoSleep :: proc(body: ^Body, state: i32) ---
	BodyGetFreezeState :: proc(body: ^Body) -> i32 ---
	BodySetFreezeState :: proc(body: ^Body, state: i32) ---
	BodyGetGyroscopicTorque :: proc(body: ^Body) -> i32 ---
	BodySetGyroscopicTorque :: proc(body: ^Body, state: i32) ---
	BodySetDestructorCallback :: proc(body: ^Body, callback: BodyDestructor) ---
	BodyGetDestructorCallback :: proc(body: ^Body) -> BodyDestructor ---
	BodySetTransformCallback :: proc(body: ^Body, callback: SetTransform) ---
	BodyGetTransformCallback :: proc(body: ^Body) -> SetTransform ---
	BodySetForceAndTorqueCallback :: proc(body: ^Body, callback: ApplyForceAndTorque) ---
	BodyGetForceAndTorqueCallback :: proc(body: ^Body) -> ApplyForceAndTorque ---
	BodyGetID :: proc(body: ^Body) -> i32 ---
	BodySetUserData :: proc(body: ^Body, userData: rawptr) ---
	BodyGetUserData :: proc(body: ^Body) -> rawptr ---
	BodyGetWorld :: proc(body: ^Body) -> ^World ---
	BodyGetCollision :: proc(body: ^Body) -> ^Collision ---
	BodyGetMaterialGroupID :: proc(body: ^Body) -> i32 ---
	BodyGetSerializedID :: proc(body: ^Body) -> i32 ---
	BodyGetContinuousCollisionMode :: proc(body: ^Body) -> i32 ---
	BodyGetJointRecursiveCollision :: proc(body: ^Body) -> i32 ---
	BodyGetPosition :: proc(body: ^Body, pos: ^dFloat) ---
	BodyGetMatrix :: proc(body: ^Body, matrix4x4: ^dFloat) ---
	BodyGetRotation :: proc(body: ^Body, rotation: ^dFloat) ---
	BodyGetMass :: proc(body: ^Body, mass: ^dFloat, Ixx: ^dFloat, Iyy: ^dFloat, Izz: ^dFloat) ---
	BodyGetInvMass :: proc(body: ^Body, invMass: ^dFloat, invIxx: ^dFloat, invIyy: ^dFloat, invIzz: ^dFloat) ---
	BodyGetInertiaMatrix :: proc(body: ^Body, inertiaMatrix: ^float4x4) ---
	BodyGetInvInertiaMatrix :: proc(body: ^Body, invInertiaMatrix: ^float4x4) ---
	BodyGetOmega :: proc(body: ^Body, vector: ^dFloat) ---
	BodyGetVelocity :: proc(body: ^Body, vector: ^dFloat) ---
	BodyGetAlpha :: proc(body: ^Body, vector: ^dFloat) ---
	BodyGetAcceleration :: proc(body: ^Body, vector: ^dFloat) ---
	BodyGetForce :: proc(body: ^Body, vector: ^dFloat) ---
	BodyGetTorque :: proc(body: ^Body, vector: ^dFloat) ---
	BodyGetCentreOfMass :: proc(body: ^Body, com: ^dFloat) ---
	BodyGetPointVelocity :: proc(body: ^Body, point: ^dFloat, velocOut: ^dFloat) ---
	BodyApplyImpulsePair :: proc(body: ^Body, linearImpulse: ^dFloat, angularImpulse: ^dFloat, timestep: dFloat) ---
	BodyAddImpulse :: proc(body: ^Body, pointDeltaVeloc: ^dFloat, pointPosit: ^dFloat, timestep: dFloat) ---
	BodyApplyImpulseArray :: proc(body: ^Body, impuleCount: i32, strideInByte: i32, impulseArray: ^dFloat, pointArray: ^dFloat, timestep: dFloat) ---
	BodyIntegrateVelocity :: proc(body: ^Body, timestep: dFloat) ---
	BodyGetLinearDamping :: proc(body: ^Body) -> dFloat ---
	BodyGetAngularDamping :: proc(body: ^Body, vector: ^dFloat) ---
	BodyGetAABB :: proc(body: ^Body, p0: ^dFloat, p1: ^dFloat) ---
	BodyGetFirstJoint :: proc(body: ^Body) -> ^Joint ---
	BodyGetNextJoint :: proc(body: ^Body, joint: ^Joint) -> ^Joint ---
	BodyGetFirstContactJoint :: proc(body: ^Body) -> ^Joint ---
	BodyGetNextContactJoint :: proc(body: ^Body, contactJoint: ^Joint) -> ^Joint ---
	BodyFindContact :: proc(body0: ^Body, body1: ^Body) -> ^Joint ---
	ContactJointGetFirstContact :: proc(contactJoint: ^Joint) -> rawptr ---
	ContactJointGetNextContact :: proc(contactJoint: ^Joint, contact: rawptr) -> rawptr ---
	ContactJointGetContactCount :: proc(contactJoint: ^Joint) -> i32 ---
	ContactJointRemoveContact :: proc(contactJoint: ^Joint, contact: rawptr) ---
	ContactJointGetClosestDistance :: proc(contactJoint: ^Joint) -> dFloat ---
	ContactJointResetSelftJointCollision :: proc(contactJoint: ^Joint) ---
	ContactJointResetIntraJointCollision :: proc(contactJoint: ^Joint) ---
	ContactGetMaterial :: proc(contact: rawptr) -> ^Material ---
	ContactGetCollision0 :: proc(contact: rawptr) -> ^Collision ---
	ContactGetCollision1 :: proc(contact: rawptr) -> ^Collision ---
	ContactGetCollisionID0 :: proc(contact: rawptr) -> rawptr ---
	ContactGetCollisionID1 :: proc(contact: rawptr) -> rawptr ---
	JointGetUserData :: proc(joint: ^Joint) -> rawptr ---
	JointSetUserData :: proc(joint: ^Joint, userData: rawptr) ---
	JointGetBody0 :: proc(joint: ^Joint) -> ^Body ---
	JointGetBody1 :: proc(joint: ^Joint) -> ^Body ---
	JointGetInfo :: proc(joint: ^Joint, info: ^JointRecord) ---
	JointGetCollisionState :: proc(joint: ^Joint) -> i32 ---
	JointSetCollisionState :: proc(joint: ^Joint, state: i32) ---
	JointGetStiffness :: proc(joint: ^Joint) -> dFloat ---
	JointSetStiffness :: proc(joint: ^Joint, state: dFloat) ---
	DestroyJoint :: proc(newtonWorld: ^World, joint: ^Joint) ---
	JointSetDestructor :: proc(joint: ^Joint, destructor: ConstraintDestructor) ---
	JointIsActive :: proc(joint: ^Joint) -> i32 ---
	CreateMassSpringDamperSystem :: proc(newtonWorld: ^World, shapeID: i32, points: ^dFloat, pointCount: i32, strideInBytes: i32, pointMass: ^dFloat, links: ^i32, linksCount: i32, linksSpring: ^dFloat, linksDamper: ^dFloat) -> ^Collision ---
	CreateDeformableSolid :: proc(newtonWorld: ^World, mesh: ^Mesh, shapeID: i32) -> ^Collision ---
	DeformableMeshGetParticleCount :: proc(deformableMesh: ^Collision) -> i32 ---
	DeformableMeshGetParticleStrideInBytes :: proc(deformableMesh: ^Collision) -> i32 ---
	DeformableMeshGetParticleArray :: proc(deformableMesh: ^Collision) -> ^dFloat ---
	ConstraintCreateBall :: proc(newtonWorld: ^World, pivotPoint: ^dFloat, childBody: ^Body, parentBody: ^Body) -> ^Joint ---
	BallSetUserCallback :: proc(ball: ^Joint, callback: BallCallback) ---
	BallGetJointAngle :: proc(ball: ^Joint, angle: ^dFloat) ---
	BallGetJointOmega :: proc(ball: ^Joint, omega: ^dFloat) ---
	BallGetJointForce :: proc(ball: ^Joint, force: ^dFloat) ---
	BallSetConeLimits :: proc(ball: ^Joint, pin: ^dFloat, maxConeAngle: dFloat, maxTwistAngle: dFloat) ---
	ConstraintCreateHinge :: proc(newtonWorld: ^World, pivotPoint: ^dFloat, pinDir: ^dFloat, childBody: ^Body, parentBody: ^Body) -> ^Joint ---
	HingeSetUserCallback :: proc(hinge: ^Joint, callback: HingeCallback) ---
	HingeGetJointAngle :: proc(hinge: ^Joint) -> dFloat ---
	HingeGetJointOmega :: proc(hinge: ^Joint) -> dFloat ---
	HingeGetJointForce :: proc(hinge: ^Joint, force: ^dFloat) ---
	HingeCalculateStopAlpha :: proc(hinge: ^Joint, desc: ^HingeSliderUpdateDesc, angle: dFloat) -> dFloat ---
	ConstraintCreateSlider :: proc(newtonWorld: ^World, pivotPoint: ^dFloat, pinDir: ^dFloat, childBody: ^Body, parentBody: ^Body) -> ^Joint ---
	SliderSetUserCallback :: proc(slider: ^Joint, callback: SliderCallback) ---
	SliderGetJointPosit :: proc(slider: ^Joint) -> dFloat ---
	SliderGetJointVeloc :: proc(slider: ^Joint) -> dFloat ---
	SliderGetJointForce :: proc(slider: ^Joint, force: ^dFloat) ---
	SliderCalculateStopAccel :: proc(slider: ^Joint, desc: ^HingeSliderUpdateDesc, position: dFloat) -> dFloat ---
	ConstraintCreateCorkscrew :: proc(newtonWorld: ^World, pivotPoint: ^dFloat, pinDir: ^dFloat, childBody: ^Body, parentBody: ^Body) -> ^Joint ---
	CorkscrewSetUserCallback :: proc(corkscrew: ^Joint, callback: CorkscrewCallback) ---
	CorkscrewGetJointPosit :: proc(corkscrew: ^Joint) -> dFloat ---
	CorkscrewGetJointAngle :: proc(corkscrew: ^Joint) -> dFloat ---
	CorkscrewGetJointVeloc :: proc(corkscrew: ^Joint) -> dFloat ---
	CorkscrewGetJointOmega :: proc(corkscrew: ^Joint) -> dFloat ---
	CorkscrewGetJointForce :: proc(corkscrew: ^Joint, force: ^dFloat) ---
	CorkscrewCalculateStopAlpha :: proc(corkscrew: ^Joint, desc: ^HingeSliderUpdateDesc, angle: dFloat) -> dFloat ---
	CorkscrewCalculateStopAccel :: proc(corkscrew: ^Joint, desc: ^HingeSliderUpdateDesc, position: dFloat) -> dFloat ---
	ConstraintCreateUniversal :: proc(newtonWorld: ^World, pivotPoint: ^dFloat, pinDir0: ^dFloat, pinDir1: ^dFloat, childBody: ^Body, parentBody: ^Body) -> ^Joint ---
	UniversalSetUserCallback :: proc(universal: ^Joint, callback: UniversalCallback) ---
	UniversalGetJointAngle0 :: proc(universal: ^Joint) -> dFloat ---
	UniversalGetJointAngle1 :: proc(universal: ^Joint) -> dFloat ---
	UniversalGetJointOmega0 :: proc(universal: ^Joint) -> dFloat ---
	UniversalGetJointOmega1 :: proc(universal: ^Joint) -> dFloat ---
	UniversalGetJointForce :: proc(universal: ^Joint, force: ^dFloat) ---
	UniversalCalculateStopAlpha0 :: proc(universal: ^Joint, desc: ^HingeSliderUpdateDesc, angle: dFloat) -> dFloat ---
	UniversalCalculateStopAlpha1 :: proc(universal: ^Joint, desc: ^HingeSliderUpdateDesc, angle: dFloat) -> dFloat ---
	ConstraintCreateUpVector :: proc(newtonWorld: ^World, pinDir: ^dFloat, body: ^Body) -> ^Joint ---
	UpVectorGetPin :: proc(upVector: ^Joint, pin: ^dFloat) ---
	UpVectorSetPin :: proc(upVector: ^Joint, pin: ^dFloat) ---
	ConstraintCreateUserJoint :: proc(newtonWorld: ^World, maxDOF: i32, callback: UserBilateralCallback, childBody: ^Body, parentBody: ^Body) -> ^Joint ---
	UserJointGetSolverModel :: proc(joint: ^Joint) -> i32 ---
	UserJointSetSolverModel :: proc(joint: ^Joint, model: i32) ---
	UserJointMassScale :: proc(joint: ^Joint, scaleBody0: dFloat, scaleBody1: dFloat) ---
	UserJointSetFeedbackCollectorCallback :: proc(joint: ^Joint, getFeedback: UserBilateralCallback) ---
	UserJointAddLinearRow :: proc(joint: ^Joint, pivot0: ^dFloat, pivot1: ^dFloat, dir: ^dFloat) ---
	UserJointAddAngularRow :: proc(joint: ^Joint, relativeAngle: dFloat, dir: ^dFloat) ---
	UserJointAddGeneralRow :: proc(joint: ^Joint, jacobian0: ^JacobianPair, jacobian1: ^JacobianPair) ---
	UserJointSetRowMinimumFriction :: proc(joint: ^Joint, friction: dFloat) ---
	UserJointSetRowMaximumFriction :: proc(joint: ^Joint, friction: dFloat) ---
	UserJointCalculateRowZeroAcceleration :: proc(joint: ^Joint) -> dFloat ---
	UserJointGetRowAcceleration :: proc(joint: ^Joint) -> dFloat ---
	UserJointGetRowJacobian :: proc(joint: ^Joint, linear0: ^dFloat, angula0: ^dFloat, linear1: ^dFloat, angula1: ^dFloat) ---
	UserJointSetRowAcceleration :: proc(joint: ^Joint, acceleration: dFloat) ---
	UserJointSetRowMassDependentSpringDamperAcceleration :: proc(joint: ^Joint, spring: dFloat, damper: dFloat) ---
	UserJointSetRowMassIndependentSpringDamperAcceleration :: proc(joint: ^Joint, rowStiffness: dFloat, spring: dFloat, damper: dFloat) ---
	UserJointSetRowStiffness :: proc(joint: ^Joint, stiffness: dFloat) ---
	UserJoinRowsCount :: proc(joint: ^Joint) -> i32 ---
	UserJointGetGeneralRow :: proc(joint: ^Joint, index: i32, jacobian0: ^JacobianPair, jacobian1: ^JacobianPair) ---
	UserJointGetRowForce :: proc(joint: ^Joint, row: i32) -> dFloat ---
	MeshCreate :: proc(newtonWorld: ^World) -> ^Mesh ---
	MeshCreateFromMesh :: proc(mesh: ^Mesh) -> ^Mesh ---
	MeshCreateFromCollision :: proc(collision: ^Collision) -> ^Mesh ---
	MeshCreateTetrahedraIsoSurface :: proc(mesh: ^Mesh) -> ^Mesh ---
	MeshCreateConvexHull :: proc(newtonWorld: ^World, pointCount: i32, vertexCloud: ^dFloat, strideInBytes: i32, tolerance: dFloat) -> ^Mesh ---
	MeshCreateVoronoiConvexDecomposition :: proc(newtonWorld: ^World, pointCount: i32, vertexCloud: ^dFloat, strideInBytes: i32, materialID: i32, textureMatrix: ^float4x4) -> ^Mesh ---
	MeshCreateFromSerialization :: proc(newtonWorld: ^World, deserializeFunction: DeserializeCallback, serializeHandle: rawptr) -> ^Mesh ---
	MeshDestroy :: proc(mesh: ^Mesh) ---
	MeshSerialize :: proc(mesh: ^Mesh, serializeFunction: SerializeCallback, serializeHandle: rawptr) ---
	MeshSaveOFF :: proc(mesh: ^Mesh, filename: cstring) ---
	MeshLoadOFF :: proc(newtonWorld: ^World, filename: cstring) -> ^Mesh ---
	MeshLoadTetrahedraMesh :: proc(newtonWorld: ^World, filename: cstring) -> ^Mesh ---
	MeshFlipWinding :: proc(mesh: ^Mesh) ---
	MeshApplyTransform :: proc(mesh: ^Mesh, matrix4x4: ^float4x4) ---
	MeshCalculateOOBB :: proc(mesh: ^Mesh, matrix4x4: ^float4x4, x: ^dFloat, y: ^dFloat, z: ^dFloat) ---
	MeshCalculateVertexNormals :: proc(mesh: ^Mesh, angleInRadians: dFloat) ---
	MeshApplySphericalMapping :: proc(mesh: ^Mesh, material: i32, aligmentMatrix: ^float4x4) ---
	MeshApplyCylindricalMapping :: proc(mesh: ^Mesh, cylinderMaterial: i32, capMaterial: i32, aligmentMatrix: ^float4x4) ---
	MeshApplyBoxMapping :: proc(mesh: ^Mesh, frontMaterial: i32, sideMaterial: i32, topMaterial: i32, aligmentMatrix: ^float4x4) ---
	MeshApplyAngleBasedMapping :: proc(mesh: ^Mesh, material: i32, reportPrograssCallback: ReportProgress, reportPrgressUserData: rawptr, aligmentMatrix: ^float4x4) ---
	CreateTetrahedraLinearBlendSkinWeightsChannel :: proc(tetrahedraMesh: ^Mesh, skinMesh: ^Mesh) ---
	MeshOptimize :: proc(mesh: ^Mesh) ---
	MeshOptimizePoints :: proc(mesh: ^Mesh) ---
	MeshOptimizeVertex :: proc(mesh: ^Mesh) ---
	MeshIsOpenMesh :: proc(mesh: ^Mesh) -> i32 ---
	MeshFixTJoints :: proc(mesh: ^Mesh) ---
	MeshPolygonize :: proc(mesh: ^Mesh) ---
	MeshTriangulate :: proc(mesh: ^Mesh) ---
	MeshUnion :: proc(mesh: ^Mesh, clipper: ^Mesh, clipperMatrix: ^float4x4) -> ^Mesh ---
	MeshDifference :: proc(mesh: ^Mesh, clipper: ^Mesh, clipperMatrix: ^float4x4) -> ^Mesh ---
	MeshIntersection :: proc(mesh: ^Mesh, clipper: ^Mesh, clipperMatrix: ^float4x4) -> ^Mesh ---
	MeshClip :: proc(mesh: ^Mesh, clipper: ^Mesh, clipperMatrix: ^float4x4, topMesh: ^^Mesh, bottomMesh: ^^Mesh) ---
	MeshConvexMeshIntersection :: proc(mesh: ^Mesh, convexMesh: ^Mesh) -> ^Mesh ---
	MeshSimplify :: proc(mesh: ^Mesh, maxVertexCount: i32, reportPrograssCallback: ReportProgress, reportPrgressUserData: rawptr) -> ^Mesh ---
	MeshApproximateConvexDecomposition :: proc(mesh: ^Mesh, maxConcavity: dFloat, backFaceDistanceFactor: dFloat, maxCount: i32, maxVertexPerHull: i32, reportProgressCallback: ReportProgress, reportProgressUserData: rawptr) -> ^Mesh ---
	RemoveUnusedVertices :: proc(mesh: ^Mesh, vertexRemapTable: ^i32) ---
	MeshBeginBuild :: proc(mesh: ^Mesh) ---
	MeshBeginFace :: proc(mesh: ^Mesh) ---
	MeshAddPoint :: proc(mesh: ^Mesh, x: f64, y: f64, z: f64) ---
	MeshAddLayer :: proc(mesh: ^Mesh, layerIndex: i32) ---
	MeshAddMaterial :: proc(mesh: ^Mesh, materialIndex: i32) ---
	MeshAddNormal :: proc(mesh: ^Mesh, x: dFloat, y: dFloat, z: dFloat) ---
	MeshAddBinormal :: proc(mesh: ^Mesh, x: dFloat, y: dFloat, z: dFloat) ---
	MeshAddUV0 :: proc(mesh: ^Mesh, u: dFloat, v: dFloat) ---
	MeshAddUV1 :: proc(mesh: ^Mesh, u: dFloat, v: dFloat) ---
	MeshAddVertexColor :: proc(mesh: ^Mesh, r: f32, g: f32, b: f32, a: f32) ---
	MeshEndFace :: proc(mesh: ^Mesh) ---
	MeshEndBuild :: proc(mesh: ^Mesh) ---
	MeshClearVertexFormat :: proc(format: ^MeshVertexFormat) ---
	MeshBuildFromVertexListIndexList :: proc(mesh: ^Mesh, format: ^MeshVertexFormat) ---
	MeshGetPointCount :: proc(mesh: ^Mesh) -> i32 ---
	MeshGetIndexToVertexMap :: proc(mesh: ^Mesh) -> ^i32 ---
	MeshGetVertexDoubleChannel :: proc(mesh: ^Mesh, vertexStrideInByte: i32, outBuffer: ^f64) ---
	MeshGetVertexChannel :: proc(mesh: ^Mesh, vertexStrideInByte: i32, outBuffer: ^float3) ---
	MeshGetNormalChannel :: proc(mesh: ^Mesh, vertexStrideInByte: i32, outBuffer: ^float3) ---
	MeshGetBinormalChannel :: proc(mesh: ^Mesh, vertexStrideInByte: i32, outBuffer: ^float3) ---
	MeshGetUV0Channel :: proc(mesh: ^Mesh, vertexStrideInByte: i32, outBuffer: ^float2) ---
	MeshGetUV1Channel :: proc(mesh: ^Mesh, vertexStrideInByte: i32, outBuffer: ^float2) ---
	MeshGetVertexColorChannel :: proc(mesh: ^Mesh, vertexStrideInByte: i32, outBuffer: ^dFloat) ---
	MeshHasNormalChannel :: proc(mesh: ^Mesh) -> b32 ---
	MeshHasBinormalChannel :: proc(mesh: ^Mesh) -> b32 ---
	MeshHasUV0Channel :: proc(mesh: ^Mesh) -> b32 ---
	MeshHasUV1Channel :: proc(mesh: ^Mesh) -> b32 ---
	MeshHasVertexColorChannel :: proc(mesh: ^Mesh) -> b32 ---
	MeshBeginHandle :: proc(mesh: ^Mesh) -> rawptr ---
	MeshEndHandle :: proc(mesh: ^Mesh, handle: rawptr) ---
	MeshFirstMaterial :: proc(mesh: ^Mesh, handle: rawptr) -> i32 ---
	MeshNextMaterial :: proc(mesh: ^Mesh, handle: rawptr, materialId: i32) -> i32 ---
	MeshMaterialGetMaterial :: proc(mesh: ^Mesh, handle: rawptr, materialId: i32) -> i32 ---
	MeshMaterialGetIndexCount :: proc(mesh: ^Mesh, handle: rawptr, materialId: i32) -> i32 ---
	MeshMaterialGetIndexStream :: proc(mesh: ^Mesh, handle: rawptr, materialId: i32, index: ^i32) ---
	MeshMaterialGetIndexStreamShort :: proc(mesh: ^Mesh, handle: rawptr, materialId: i32, index: ^i16) ---
	MeshCreateFirstSingleSegment :: proc(mesh: ^Mesh) -> ^Mesh ---
	MeshCreateNextSingleSegment :: proc(mesh: ^Mesh, segment: ^Mesh) -> ^Mesh ---
	MeshCreateFirstLayer :: proc(mesh: ^Mesh) -> ^Mesh ---
	MeshCreateNextLayer :: proc(mesh: ^Mesh, segment: ^Mesh) -> ^Mesh ---
	MeshGetTotalFaceCount :: proc(mesh: ^Mesh) -> i32 ---
	MeshGetTotalIndexCount :: proc(mesh: ^Mesh) -> i32 ---
	MeshGetFaces :: proc(mesh: ^Mesh, faceIndexCount: ^i32, faceMaterial: ^i32, faceIndices: ^rawptr) ---
	MeshGetVertexCount :: proc(mesh: ^Mesh) -> i32 ---
	MeshGetVertexStrideInByte :: proc(mesh: ^Mesh) -> i32 ---
	MeshGetVertexArray :: proc(mesh: ^Mesh) -> ^f64 ---
	MeshGetVertexBaseCount :: proc(mesh: ^Mesh) -> i32 ---
	MeshSetVertexBaseCount :: proc(mesh: ^Mesh, baseCount: i32) ---
	MeshGetFirstVertex :: proc(mesh: ^Mesh) -> rawptr ---
	MeshGetNextVertex :: proc(mesh: ^Mesh, vertex: rawptr) -> rawptr ---
	MeshGetVertexIndex :: proc(mesh: ^Mesh, vertex: rawptr) -> i32 ---
	MeshGetFirstPoint :: proc(mesh: ^Mesh) -> Point ---
	MeshGetNextPoint :: proc(mesh: ^Mesh, point: Point) -> Point ---
	MeshGetPointIndex :: proc(mesh: ^Mesh, point: Point) -> i32 ---
	MeshGetVertexIndexFromPoint :: proc(mesh: ^Mesh, point: Point) -> i32 ---
	MeshGetFirstEdge :: proc(mesh: ^Mesh) -> Edge ---
	MeshGetNextEdge :: proc(mesh: ^Mesh, edge: Edge) -> Edge ---
	MeshGetEdgeIndices :: proc(mesh: ^Mesh, edge: Edge, v0: ^i32, v1: ^i32) ---
	MeshGetFirstFace :: proc(mesh: ^Mesh) -> Face ---
	MeshGetNextFace :: proc(mesh: ^Mesh, face: Face) -> Face ---
	MeshIsFaceOpen :: proc(mesh: ^Mesh, face: Face) -> b32 ---
	MeshGetFaceMaterial :: proc(mesh: ^Mesh, face: Face) -> i32 ---
	MeshGetFaceIndexCount :: proc(mesh: ^Mesh, face: Face) -> i32 ---
	MeshGetFaceIndices :: proc(mesh: ^Mesh, face: Face, indices: ^i32) ---
	MeshGetFacePointIndices :: proc(mesh: ^Mesh, face: Face, indices: ^i32) ---
	MeshCalculateFaceNormal :: proc(mesh: ^Mesh, face: Face, normal: ^f64) ---
	MeshSetFaceMaterial :: proc(mesh: ^Mesh, face: Face, matId: i32) ---
}
