import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalMethodsCanonicalLaneLean

structure Lattice (L : Type) where
  leq : L → L → Prop
  join : L → L → L
  meet : L → L → L
  bottom : L
  top : L
  leqReflexive : ∀ x : L, leq x x
  leqAntisymmetric : ∀ x y : L, leq x y → leq y x → x = y
  leqTransitive : ∀ x y z : L, leq x y → leq y z → leq x z

structure AbstractDomain (L : Type) (Concrete : Type) where
  lattice : Lattice L
  abstraction : Concrete → L
  concretization : L → Set Concrete
  gammaMonotone : ∀ l1 l2 : L, lattice.leq l1 l2 → concretization l1 ⊆ concretization l2
  soundness : ∀ c : Concrete, abstraction c ∈ concretization (abstraction c)

structure AbstractInterpretationPackage (L : Type) (Concrete : Type) (A : AbstractDomain L Concrete) where
  abstractTransformer : (Concrete → Concrete) → (L → L)
  localSoundness : ∀ (f : Concrete → Concrete) (l : L),
    ∀ c : Concrete, c ∈ A.concretization l → A.concretization (abstractTransformer f l) ⊆ A.concretization (f c)
  fixpointApproximation : L
  fixpointProperty : Prop

structure AbstractInterpretationEvidence {L : Type} {Concrete : Type} {A : AbstractDomain L Concrete}
    (P : AbstractInterpretationPackage L Concrete A) where
  fixpointPropertyClosed : P.fixpointProperty

def AbstractInterpretationClosed {L : Type} {Concrete : Type} {A : AbstractDomain L Concrete}
    (P : AbstractInterpretationPackage L Concrete A) : Prop :=
  P.fixpointProperty

theorem abstract_interpretation_closed_from_evidence {L : Type} {Concrete : Type} {A : AbstractDomain L Concrete}
    (P : AbstractInterpretationPackage L Concrete A) (e : AbstractInterpretationEvidence P) :
    AbstractInterpretationClosed P := by
  exact e.fixpointPropertyClosed

end FormalMethodsCanonicalLaneLean
end HautevilleHouse