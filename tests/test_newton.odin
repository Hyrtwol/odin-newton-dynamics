// odin test . -vet -strict-style
// odin test shared/newton_dynamics/tests -vet -strict-style
package test_newton

import "core:fmt"
import "core:testing"
import n ".."

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
	exp := 400
	//exp := size_of(float4x4) + size_of(NewtonCollisionMaterial) + size_of(SerializeId) + (64 * size_of(dFloat))
	act := size_of(n.NewtonCollisionInfoRecord)
	testing.expect(t, act == exp, fmt.tprintf("NewtonCollisionInfoRecord: %v (should be: %v)", act, exp))
}
