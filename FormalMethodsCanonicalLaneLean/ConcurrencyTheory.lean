import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalMethodsCanonicalLaneLean

structure Process where
  identifier : String
  actions : List (Action)

structure Action where
  name : String
  guard : Prop
  effect : State → State

structure ProcessAlgebra where
  parallelComposition : Process → Process → Process
  sequentialComposition : Process → Process → Process
  choiceComposition : Process → Process → Process
  interleavingSemantics : Prop
  deadlockFreedom : Prop
  fairness : Prop
  interleavingSemanticsTerm : interleavingSemantics
  deadlockFreedomTerm : deadlockFreedom
  fairnessTerm : fairness

structure ConcurrencyEvidence (PA : ProcessAlgebra) where
  interleavingSemanticsClosed : PA.interleavingSemantics
  deadlockFreedomClosed : PA.deadlockFreedom
  fairnessClosed : PA.fairness

def ConcurrencyTheoryClosed (PA : ProcessAlgebra) : Prop :=
  PA.interleavingSemantics ∧ PA.deadlockFreedom ∧ PA.fairness

theorem concurrency_theory_closed_from_evidence (PA : ProcessAlgebra) (E : ConcurrencyEvidence PA) : ConcurrencyTheoryClosed PA := by
  exact And.intro E.interleavingSemanticsClosed (And.intro E.deadlockFreedomClosed E.fairnessClosed)

end HautevilleHouse.FormalMethodsCanonicalLaneLean
end HautevilleHouse