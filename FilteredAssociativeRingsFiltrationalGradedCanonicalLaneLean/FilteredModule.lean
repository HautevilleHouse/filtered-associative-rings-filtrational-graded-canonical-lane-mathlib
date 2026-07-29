import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean.FilteredRing

namespace HautevilleHouse
namespace FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean

structure FilteredModule (R : FilteredRingObject) where
  moduleCarrier : Type
  scalarMultiplication : ℕ → FilteredRing.carrier (FilteredRingObject.ring R) → moduleCarrier → moduleCarrier
  moduleFiltration : ℕ → Set moduleCarrier
  filtrationCompatible : ∀ n m, (FilteredRingObject.filtration R n) × moduleFiltration m → moduleFiltration (n+m)
  scalarMulCompatible : ∀ n m (r : FilteredRing.carrier (FilteredRingObject.ring R)) (m_elt : moduleCarrier),
    (h : r ∈ FilteredRingObject.filtration R n) → (h' : m_elt ∈ moduleFiltration m) →
    scalarMultiplication n r m_elt ∈ moduleFiltration (n+m)

structure FilteredModuleEvidence (R : FilteredRingObject) (M : FilteredModule R) where
  scalarMulCompatibleClosed : M.scalarMulCompatible

def FilteredModuleClosed (R : FilteredRingObject) (M : FilteredModule R) : Prop :=
  M.scalarMulCompatible

theorem filtered_module_closed_from_evidence (R : FilteredRingObject) (M : FilteredModule R) (E : FilteredModuleEvidence R M) : FilteredModuleClosed R M :=
  E.scalarMulCompatibleClosed

end FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean
end HautevilleHouse