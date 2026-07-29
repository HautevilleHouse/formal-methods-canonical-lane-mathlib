import FormalMethodsCanonicalLaneLean.HoareLogic

namespace HautevilleHouse
namespace FormalMethodsCanonicalLaneLean

structure ProofAssistant where
  name : String
  kernel : String
  trustedCore : Bool

structure InteractiveTheoremProvingPackage (P : ProofAssistant) where
  tacticLanguage : Type
  proofScript : tacticLanguage → Prop
  kernelChecked : P.trustedCore → ∀ (f : tacticLanguage), proofScript f → Prop
  proverCorrect : Prop

structure InteractiveTheoremProvingEvidence {P : ProofAssistant} (I : InteractiveTheoremProvingPackage P) where
  kernelCheckedClosed : I.proverCorrect

def InteractiveTheoremProvingClosed {P : ProofAssistant} (I : InteractiveTheoremProvingPackage P) : Prop :=
  I.proverCorrect

theorem interactive_theorem_proving_closed_from_evidence {P : ProofAssistant} (I : InteractiveTheoremProvingPackage P) (E : InteractiveTheoremProvingEvidence I) :
    InteractiveTheoremProvingClosed I := by
  exact E.kernelCheckedClosed

end FormalMethodsCanonicalLaneLean
end HautevilleHouse