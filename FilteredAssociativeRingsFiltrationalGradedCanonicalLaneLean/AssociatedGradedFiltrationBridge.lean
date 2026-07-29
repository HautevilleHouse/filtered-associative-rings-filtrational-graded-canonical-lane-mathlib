import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean.AssociatedGradedRing

namespace HautevilleHouse
namespace FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  True

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  trivial

end FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean
end HautevilleHouse