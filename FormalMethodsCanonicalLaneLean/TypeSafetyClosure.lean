import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalMethodsCanonicalLaneLean

structure TypeSafetyPackage where
  typingContext : Type u
  expressionWellTyped : Prop
  progressProperty : Prop
  preservationProperty : Prop
  typeSafetyHolds : Prop

structure TypeSafetyEvidence (T : TypeSafetyPackage) where
  expressionWellTypedClosed : T.expressionWellTyped
  progressPropertyClosed : T.progressProperty
  preservationPropertyClosed : T.preservationProperty
  typeSafetyHoldsClosed : T.typeSafetyHolds

def TypeSafetyClosed (T : TypeSafetyPackage) : Prop :=
  T.expressionWellTyped ∧ T.progressProperty ∧
  T.preservationProperty ∧ T.typeSafetyHolds

theorem type_safety_closed_from_evidence (T : TypeSafetyPackage)
    (E : TypeSafetyEvidence T) : TypeSafetyClosed T := by
  exact And.intro E.expressionWellTypedClosed
    (And.intro E.progressPropertyClosed
      (And.intro E.preservationPropertyClosed E.typeSafetyHoldsClosed))

end FormalMethodsCanonicalLaneLean
end HautevilleHouse