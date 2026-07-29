import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean

structure FiltrationDefinition where
  ring : Type u
  ringStr : Ring ring
  filtrationType : Type v
  poset : PartialOrder filtrationType
  filtration : ℕ → filtrationType → Submodule ring ring
  filtrationCompatibility : ∀ (n m : ℕ) (a b : filtrationType), filtration n a * filtration m b ⊆ filtration (n + m) (a ⊔ b)
  filtrationAssociative : ∀ (x y z : ring), x * (y * z) = (x * y) * z

structure FiltrationEvidence (F : FiltrationDefinition) where
  filtrationCompatibilityClosed : F.filtrationCompatibility
  filtrationAssociativeClosed : F.filtrationAssociative

def FiltrationClosed (F : FiltrationDefinition) : Prop := F.filtrationCompatibility ∧ F.filtrationAssociative

theorem filtration_closed_from_evidence (F : FiltrationDefinition) (E : FiltrationEvidence F) : FiltrationClosed F := by
  exact And.intro E.filtrationCompatibilityClosed E.filtrationAssociativeClosed

end FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean
end HautevilleHouse