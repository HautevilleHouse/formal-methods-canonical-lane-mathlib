import HautevilleHouse.FormalMethodsCanonicalLaneLean.CoreTheory

namespace HautevilleHouse
namespace FormalMethodsCanonicalLaneLean

structure HoareLogicPackage {S : SimpleTypesPackage} (C : CoreTheoryPackage S) where
  weakestPreconditionCalculus : Prop
  weakestPreconditionSoundness : Prop
  verificationConditionGenerator : Prop

def HoareLogicClosed {S : SimpleTypesPackage} {C : CoreTheoryPackage S} (H : HoareLogicPackage C) : Prop :=
  H.weakestPreconditionCalculus ∧ H.weakestPreconditionSoundness ∧ H.verificationConditionGenerator

structure HoareLogicEvidence {S : SimpleTypesPackage} {C : CoreTheoryPackage S} (H : HoareLogicPackage C) where
  weakestPreconditionCalculusClosed : H.weakestPreconditionCalculus
  weakestPreconditionSoundnessClosed : H.weakestPreconditionSoundness
  verificationConditionGeneratorClosed : H.verificationConditionGenerator

theorem hoare_logic_closed_from_evidence {S : SimpleTypesPackage} {C : CoreTheoryPackage S}
    (H : HoareLogicPackage C) (E : HoareLogicEvidence H) : HoareLogicClosed H := by
  exact And.intro E.weakestPreconditionCalculusClosed
    (And.intro E.weakestPreconditionSoundnessClosed E.verificationConditionGeneratorClosed)

end FormalMethodsCanonicalLaneLean
end HautevilleHouse
