import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalMethodsCanonicalLaneLean

structure TypeSystem where
  types : Type u
  typeJudgment : Term → types → Prop
  progress : Prop
  preservation : Prop
  safety : Prop

structure TypeSystemEvidence (TS : TypeSystem) where
  progressClosed : TS.progress
  preservationClosed : TS.preservation

def TypeSystemClosed (TS : TypeSystem) : Prop :=
  TS.safety

theorem type_system_closed_from_evidence (TS : TypeSystem) (E : TypeSystemEvidence TS) : TypeSystemClosed TS := by
  exact TS.safety

end HautevilleHouse.FormalMethodsCanonicalLaneLean
end HautevilleHouse