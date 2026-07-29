import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean

structure FilteredRingPackage where
  carrier : Type u
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  zero : carrier
  one : carrier
  filtration : ℤ → Set carrier
  ringAxioms : Prop
  filtrationAxioms : Prop
  ringAxiomsTerm : ringAxioms
  filtrationAxiomsTerm : filtrationAxioms

structure FilteredRingEvidence (F : FilteredRingPackage) where
  ringAxiomsClosed : F.ringAxioms
  filtrationAxiomsClosed : F.filtrationAxioms

def FilteredRingClosed (F : FilteredRingPackage) : Prop :=
  F.ringAxioms ∧ F.filtrationAxioms

theorem filtered_ring_closed_from_evidence (F : FilteredRingPackage)
    (E : FilteredRingEvidence F) : FilteredRingClosed F := by
  exact And.intro E.ringAxiomsClosed E.filtrationAxiomsClosed

end FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean
end HautevilleHouse