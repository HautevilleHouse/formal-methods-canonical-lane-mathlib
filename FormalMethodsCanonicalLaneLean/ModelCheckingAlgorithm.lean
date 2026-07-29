import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalMethodsCanonicalLaneLean

structure ModelCheckingAlgorithm where
  systemModel : Type
  temporalLogic : Type
  stateExploration : Prop
  counterexampleConstruction : Prop
  stateSpaceBounded : Prop
  stateExplorationTerm : stateExploration
  counterexampleConstructionTerm : counterexampleConstruction
  stateSpaceBoundedTerm : stateSpaceBounded

structure ModelCheckingEvidence (M : ModelCheckingAlgorithm) where
  stateExplorationClosed : M.stateExploration
  counterexampleConstructionClosed : M.counterexampleConstruction
  stateSpaceBoundedClosed : M.stateSpaceBounded

def ModelCheckingClosed (M : ModelCheckingAlgorithm) : Prop :=
  M.stateExploration ∧ M.counterexampleConstruction ∧ M.stateSpaceBounded

theorem model_checking_closed_from_evidence
    (M : ModelCheckingAlgorithm) (E : ModelCheckingEvidence M) :
    ModelCheckingClosed M := by
  exact And.intro E.stateExplorationClosed
    (And.intro E.counterexampleConstructionClosed E.stateSpaceBoundedClosed)

end HautevilleHouse
end FormalMethodsCanonicalLaneLean