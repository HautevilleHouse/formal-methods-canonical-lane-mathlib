import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalMethodsCanonicalLaneLean

structure ModelCheckingPackage where
  systemModel : Type u
  temporalSpecification : Prop
  stateSpaceExplored : Prop
  propertySatisfied : Prop
  counterexampleExcluded : Prop

structure ModelCheckingEvidence (M : ModelCheckingPackage) where
  stateSpaceExploredClosed : M.stateSpaceExplored
  propertySatisfiedClosed : M.propertySatisfied
  counterexampleExcludedClosed : M.counterexampleExcluded

def ModelCheckingClosed (M : ModelCheckingPackage) : Prop :=
  M.stateSpaceExplored ∧ M.propertySatisfied ∧ M.counterexampleExcluded

theorem model_checking_closed_from_evidence (M : ModelCheckingPackage)
    (E : ModelCheckingEvidence M) : ModelCheckingClosed M := by
  exact And.intro E.stateSpaceExploredClosed
    (And.intro E.propertySatisfiedClosed E.counterexampleExcludedClosed)

end FormalMethodsCanonicalLaneLean
end HautevilleHouse