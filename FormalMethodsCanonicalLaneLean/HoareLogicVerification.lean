import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalMethodsCanonicalLaneLean

structure HoareLogicPackage where
  assertionLanguage : FormalSpecificationLanguage
  proofSystem : Type
  soundness : Prop
  completeness : Prop
  relativeCompleteness : Prop
  soundnessTerm : soundness
  completenessTerm : completeness
  relativeCompletenessTerm : relativeCompleteness

structure HoareLogicEvidence (H : HoareLogicPackage) where
  soundnessClosed : H.soundness
  completenessClosed : H.completeness
  relativeCompletenessClosed : H.relativeCompleteness

def HoareLogicClosed (H : HoareLogicPackage) : Prop :=
  H.soundness ∧ H.completeness ∧ H.relativeCompleteness

theorem hoare_logic_closed_from_evidence
    (H : HoareLogicPackage) (E : HoareLogicEvidence H) :
    HoareLogicClosed H := by
  exact And.intro E.soundnessClosed
    (And.intro E.completenessClosed E.relativeCompletenessClosed)

end HautevilleHouse
end FormalMethodsCanonicalLaneLean