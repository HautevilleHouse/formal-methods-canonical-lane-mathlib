import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalMethodsCanonicalLaneLean

structure FormalSpecificationLanguage where
  syntax : Type
  semantics : Type
  wellFormedness : Prop
  compositional : Prop
  wellFormednessTerm : wellFormedness
  compositionalTerm : compositional

structure FormalSpecificationEvidence (L : FormalSpecificationLanguage) where
  wellFormednessClosed : L.wellFormedness
  compositionalClosed : L.compositional

def FormalSpecificationLanguageClosed (L : FormalSpecificationLanguage) : Prop :=
  L.wellFormedness ∧ L.compositional

theorem formal_specification_language_closed_from_evidence
    (L : FormalSpecificationLanguage) (E : FormalSpecificationEvidence L) :
    FormalSpecificationLanguageClosed L := by
  exact And.intro E.wellFormednessClosed E.compositionalClosed

end HautevilleHouse
end FormalMethodsCanonicalLaneLean