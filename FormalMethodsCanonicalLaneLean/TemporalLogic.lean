import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalMethodsCanonicalLaneLean

inductive TemporalFormula where
  | atomic (p : String)
  | not (f : TemporalFormula)
  | and (f g : TemporalFormula)
  | or (f g : TemporalFormula)
  | implies (f g : TemporalFormula)
  | always (f : TemporalFormula)
  | eventually (f : TemporalFormula)
  | until (f g : TemporalFormula)
  deriving Repr, DecidableEq

structure TemporalLogicPackage where
  formulas : List TemporalFormula
  axioms : List TemporalFormula
  deductionRules : List (List TemporalFormula → TemporalFormula)
  consistency : Prop

structure TemporalLogicEvidence (T : TemporalLogicPackage) where
  consistencyClosed : T.consistency
  axiomChecks : ∀ ax ∈ T.axioms, ax ∈ T.formulas

def TemporalLogicClosed (T : TemporalLogicPackage) : Prop :=
  T.consistency

theorem temporal_logic_closed_from_evidence (T : TemporalLogicPackage) (e : TemporalLogicEvidence T) :
    TemporalLogicClosed T := by
  exact e.consistencyClosed

end FormalMethodsCanonicalLaneLean
end HautevilleHouse