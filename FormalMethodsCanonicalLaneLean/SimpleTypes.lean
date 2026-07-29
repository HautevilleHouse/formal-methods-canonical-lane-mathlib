import HautevilleHouse.FormalMethodsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FormalMethodsCanonicalLaneLean

structure SimpleTypesPackage where
  typeSystemDefined : Prop
  typingRulesSound : Prop
  typeSafety : Prop

def SimpleTypesClosed (S : SimpleTypesPackage) : Prop :=
  S.typeSystemDefined ∧ S.typingRulesSound ∧ S.typeSafety

structure SimpleTypesEvidence (S : SimpleTypesPackage) where
  typeSystemDefinedClosed : S.typeSystemDefined
  typingRulesSoundClosed : S.typingRulesSound
  typeSafetyClosed : S.typeSafety

theorem simple_types_closed_from_evidence (S : SimpleTypesPackage) (E : SimpleTypesEvidence S) :
    SimpleTypesClosed S := by
  exact And.intro E.typeSystemDefinedClosed (And.intro E.typingRulesSoundClosed E.typeSafetyClosed)

end FormalMethodsCanonicalLaneLean
end HautevilleHouse
