import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean

structure AdmissibleClass where
  object : FilteredAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  FilteredWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean
end HautevilleHouse