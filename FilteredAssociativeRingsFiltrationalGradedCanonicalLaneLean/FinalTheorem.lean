import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean

def FilteredAssociativeRingsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem filtered_associative_rings_endgame (A : AdmissibleClass) :
    FilteredAssociativeRingsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean
end HautevilleHouse