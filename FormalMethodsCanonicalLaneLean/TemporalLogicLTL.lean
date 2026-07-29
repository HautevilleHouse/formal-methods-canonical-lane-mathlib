import FormalMethodsCanonicalLaneLean.ModelCheckingClosure

namespace HautevilleHouse
namespace FormalMethodsCanonicalLaneLean

structure LTLFormula where
  atomic : Type
  eventually : LTLFormula → LTLFormula
  globally : LTLFormula → LTLFormula
  until : LTLFormula → LTLFormula → LTLFormula
  next : LTLFormula → LTLFormula

structure LTLModelCheckingPackage {M : ModelCheckingPackage} where
  formula : LTLFormula
  satisfactionRelation : Prop
  modelChecksFormula : M.modelCheckingAlgorithmCorrect → satisfactionRelation
  ltlModelCheckingClosed : Prop

structure LTLModelCheckingEvidence {M : ModelCheckingPackage} (L : LTLModelCheckingPackage M) where
  satisfactionRelationClosed : L.satisfactionRelation
  ltlModelCheckingClosedTerm : L.ltlModelCheckingClosed

def LTLModelCheckingClosed {M : ModelCheckingPackage} (L : LTLModelCheckingPackage M) : Prop :=
  L.satisfactionRelation ∧ L.ltlModelCheckingClosed

theorem ltl_model_checking_closed_from_evidence {M : ModelCheckingPackage} (L : LTLModelCheckingPackage M) (E : LTLModelCheckingEvidence L) :
    LTLModelCheckingClosed L := by
  exact And.intro E.satisfactionRelationClosed E.ltlModelCheckingClosedTerm

end FormalMethodsCanonicalLaneLean
end HautevilleHouse