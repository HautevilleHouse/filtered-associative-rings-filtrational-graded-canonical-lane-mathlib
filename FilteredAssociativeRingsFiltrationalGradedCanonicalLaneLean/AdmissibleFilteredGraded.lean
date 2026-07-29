import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean.FilteredRing

namespace HautevilleHouse
namespace FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean

structure AdmissibleFilteredGraded (F : FilteredRingObject) where
  object : F
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleFilteredGraded) : Prop :=
  FilteredWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean
end HautevilleHouse