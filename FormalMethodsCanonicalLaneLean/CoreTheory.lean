import HautevilleHouse.FormalMethodsCanonicalLaneLean.SimpleTypes

namespace HautevilleHouse
namespace FormalMethodsCanonicalLaneLean

structure CoreTheoryPackage (S : SimpleTypesPackage) where
  safetyJudgments : Prop
  progressJudgments : Prop
  preservationJudgments : Prop

def CoreTheoryClosed {S : SimpleTypesPackage} (C : CoreTheoryPackage S) : Prop :=
  C.safetyJudgments ∧ C.progressJudgments ∧ C.preservationJudgments

structure CoreTheoryEvidence {S : SimpleTypesPackage} (C : CoreTheoryPackage S) where
  safetyJudgmentsClosed : C.safetyJudgments
  progressJudgmentsClosed : C.progressJudgments
  preservationJudgmentsClosed : C.preservationJudgments

theorem core_theory_closed_from_evidence {S : SimpleTypesPackage}
    (C : CoreTheoryPackage S) (E : CoreTheoryEvidence C) : CoreTheoryClosed C := by
  exact And.intro E.safetyJudgmentsClosed (And.intro E.progressJudgmentsClosed E.preservationJudgmentsClosed)

end FormalMethodsCanonicalLaneLean
end HautevilleHouse
