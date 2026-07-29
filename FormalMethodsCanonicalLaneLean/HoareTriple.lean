import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalMethodsCanonicalLaneLean

structure HoareTriple (State : Type) where
  precondition : State → Prop
  program : State → State
  postcondition : State → Prop

def hoareTripleValid {State : Type} (t : HoareTriple State) : Prop :=
  ∀ s : State, t.precondition s → t.postcondition (t.program s)

structure HoareTripleEvidence {State : Type} (t : HoareTriple State) where
  valid : hoareTripleValid t

def HoareTripleClosed {State : Type} (t : HoareTriple State) : Prop :=
  hoareTripleValid t

theorem hoare_triple_closed_from_evidence {State : Type} (t : HoareTriple State) (e : HoareTripleEvidence t) :
    HoareTripleClosed t := by
  exact e.valid

end FormalMethodsCanonicalLaneLean
end HautevilleHouse