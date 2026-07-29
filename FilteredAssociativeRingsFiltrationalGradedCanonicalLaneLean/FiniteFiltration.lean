import canonicalLaneMathlib.AdmissibleClass
import FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean.FilteredRing

namespace HautevilleHouse
namespace FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean

structure FiniteFiltration (R : Type u) [Ring R] (F : FilteredRing R) where
  topDegree : ℕ
  stabilizes : ∀ i : ℕ, topDegree ≤ i → F.filtration i = F.filtration topDegree
  contains_one : (1 : R) ∈ F.filtration 0

structure FiniteFiltrationEvidence (R : Type u) [Ring R] (F : FilteredRing R)
    (FF : FiniteFiltration R F) where
  stabilizes_closed : FF.stabilizes
  contains_one_closed : FF.contains_one

def FiniteFiltrationClosed (R : Type u) [Ring R] (F : FilteredRing R)
    (FF : FiniteFiltration R F) : Prop :=
  FF.stabilizes ∧ FF.contains_one

theorem finite_filtration_closed_from_evidence (R : Type u) [Ring R] (F : FilteredRing R)
    (FF : FiniteFiltration R F) (E : FiniteFiltrationEvidence R F FF) :
    FiniteFiltrationClosed R F FF := by
  exact And.intro E.stabilizes_closed E.contains_one_closed

end FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean
end HautevilleHouse