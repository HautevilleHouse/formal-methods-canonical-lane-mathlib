import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalMethodsCanonicalLaneLean

structure OperationalSemanticsPackage where
  stateSpace : Type u
  transitionRelation : stateSpace → stateSpace → Prop
  initialStates : Set stateSpace
  terminalStates : Set stateSpace
  determinism : Prop

structure OperationalSemanticsEvidence (OS : OperationalSemanticsPackage) where
  transitionRelationFunctional : ∀ s t1 t2, OS.transitionRelation s t1 → OS.transitionRelation s t2 → t1 = t2
  initialStatesNonempty : Nonempty OS.initialStates
  terminalStatesSubset : OS.terminalStates ⊆ OS.stateSpace

def OperationalSemanticsClosed (OS : OperationalSemanticsPackage) : Prop :=
  OS.determinism

theorem operational_semantics_closed_from_evidence (OS : OperationalSemanticsPackage) (E : OperationalSemanticsEvidence OS) : OperationalSemanticsClosed OS := by
  exact OS.determinism

end HautevilleHouse.FormalMethodsCanonicalLaneLean
end HautevilleHouse