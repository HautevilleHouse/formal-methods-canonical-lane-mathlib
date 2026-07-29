import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalMethodsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FormalMethodsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end FormalMethodsCanonicalLaneLean
end HautevilleHouse
