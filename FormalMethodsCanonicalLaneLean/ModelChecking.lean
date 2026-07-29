import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalMethodsCanonicalLaneLean

structure KripkeStructure (S : Type) where
  states : List S
  transitions : S → S → Prop
  initialStates : List S
  labeling : S → String → Prop

structure ModelCheckingPackage (S : Type) (M : KripkeStructure S) where
  temporalLogic : Type
  formula : temporalLogic
  satisfaction : S → temporalLogic → Prop
  modelCheckResult : Prop
  counterexampleExists : Prop

structure ModelCheckingEvidence {S : Type} {M : KripkeStructure S} (P : ModelCheckingPackage S M) where
  modelCheckResultClosed : P.modelCheckResult
  counterexampleExistsClosed : ¬ P.counterexampleExists

def ModelCheckingClosed {S : Type} {M : KripkeStructure S} (P : ModelCheckingPackage S M) : Prop :=
  P.modelCheckResult ∧ ¬ P.counterexampleExists

theorem model_checking_closed_from_evidence {S : Type} {M : KripkeStructure S} (P : ModelCheckingPackage S M) (e : ModelCheckingEvidence P) :
    ModelCheckingClosed P := by
  exact And.intro e.modelCheckResultClosed e.counterexampleExistsClosed

end FormalMethodsCanonicalLaneLean
end HautevilleHouse