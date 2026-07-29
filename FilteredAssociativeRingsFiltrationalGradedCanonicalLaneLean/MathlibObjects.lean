import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean

structure FilteredSpace where
  carrier : Type
  ringStructure : Ring carrier

structure FilteredAdmittedObject where
  space : FilteredSpace
  filtration : FiltrationPackage
  gradedRing : GradedRingPackage filtration
  conclusion : gradedRing.gradedRingAxioms

structure FilteredEndgameState where
  object : FilteredAdmittedObject

def FilteredWitnessClosed (O : FilteredAdmittedObject) : Prop :=
  O.gradedRing.gradedRingAxioms

end FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean
end HautevilleHouse