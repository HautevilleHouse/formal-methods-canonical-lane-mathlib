import HautevilleHouse.FormalMethodsCanonicalLaneLean.HoareLogic

namespace HautevilleHouse
namespace FormalMethodsCanonicalLaneLean

structure TypeSafetyPackage {S : SimpleTypesPackage} {C : CoreTheoryPackage S} (H : HoareLogicPackage C) where
  preservationTheorem : Prop
  progressTheorem : Prop
  safetyTheorem : Prop
  typeSafetyEstablished : Prop

def TypeSafetyClosed {S : SimpleTypesPackage} {C : CoreTheoryPackage S} {H : HoareLogicPackage C}
    (T : TypeSafetyPackage H) : Prop :=
  T.preservationTheorem ∧ T.progressTheorem ∧ T.safetyTheorem ∧ T.typeSafetyEstablished

structure TypeSafetyEvidence {S : SimpleTypesPackage} {C : CoreTheoryPackage S} {H : HoareLogicPackage C}
    (T : TypeSafetyPackage H) where
  preservationTheoremClosed : T.preservationTheorem
  progressTheoremClosed : T.progressTheorem
  safetyTheoremClosed : T.safetyTheorem
  typeSafetyEstablishedClosed : T.typeSafetyEstablished

theorem type_safety_closed_from_evidence {S : SimpleTypesPackage} {C : CoreTheoryPackage S} {H : HoareLogicPackage C}
    (T : TypeSafetyPackage H) (E : TypeSafetyEvidence T) : TypeSafetyClosed T := by
  exact And.intro E.preservationTheoremClosed
    (And.intro E.progressTheoremClosed
      (And.intro E.safetyTheoremClosed E.typeSafetyEstablishedClosed))

end FormalMethodsCanonicalLaneLean
end HautevilleHouse
