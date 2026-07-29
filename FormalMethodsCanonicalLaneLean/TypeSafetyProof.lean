import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalMethodsCanonicalLaneLean

structure TypeSafetyPackage where
  typeSystem : Type
  progressProperty : Prop
  preservationProperty : Prop
  typeSoundness : Prop
  progressTerm : progressProperty
  preservationTerm : preservationProperty
  typeSoundnessTerm : typeSoundness

structure TypeSafetyEvidence (T : TypeSafetyPackage) where
  progressClosed : T.progressProperty
  preservationClosed : T.preservationProperty
  typeSoundnessClosed : T.typeSoundness

def TypeSafetyClosed (T : TypeSafetyPackage) : Prop :=
  T.progressProperty ∧ T.preservationProperty ∧ T.typeSoundness

theorem type_safety_closed_from_evidence
    (T : TypeSafetyPackage) (E : TypeSafetyEvidence T) :
    TypeSafetyClosed T := by
  exact And.intro E.progressClosed
    (And.intro E.preservationClosed E.typeSoundnessClosed)

end HautevilleHouse
end FormalMethodsCanonicalLaneLean