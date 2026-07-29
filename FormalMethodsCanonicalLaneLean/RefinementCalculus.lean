import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalMethodsCanonicalLaneLean

structure Specification (State : Type) where
  precondition : State → Prop
  postcondition : State → Prop

def refinement {State : Type} (S1 S2 : Specification State) : Prop :=
  (∀ s : State, S2.precondition s → S1.precondition s) ∧
  (∀ s : State, S1.precondition s ∧ S2.precondition s ∧ S1.postcondition s → S2.postcondition s)

structure RefinementPackage (State : Type) (Abs Conc : Specification State) where
  refinementHolds : refinement Abs Conc
  implementation : State → State
  correct : ∀ s : State, Conc.precondition s → Conc.postcondition (implementation s)

structure RefinementEvidence {State : Type} {Abs Conc : Specification State} (P : RefinementPackage State Abs Conc) where
  refinementHoldsClosed : P.refinementHolds
  correctClosed : P.correct

def RefinementClosed {State : Type} {Abs Conc : Specification State} (P : RefinementPackage State Abs Conc) : Prop :=
  P.refinementHolds ∧ P.correct

theorem refinement_closed_from_evidence {State : Type} {Abs Conc : Specification State} (P : RefinementPackage State Abs Conc) (e : RefinementEvidence P) :
    RefinementClosed P := by
  exact And.intro e.refinementHoldsClosed e.correctClosed

end FormalMethodsCanonicalLaneLean
end HautevilleHouse