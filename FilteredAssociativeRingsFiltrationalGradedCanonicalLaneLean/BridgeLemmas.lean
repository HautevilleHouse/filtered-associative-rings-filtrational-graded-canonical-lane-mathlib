import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FilteredWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean
end HautevilleHouse