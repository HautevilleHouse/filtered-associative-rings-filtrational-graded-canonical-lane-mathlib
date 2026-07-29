import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean

structure FiltrationProperties where
  filtration : FiltrationDefinition
  exhaustive : ∀ (x : filtration.ring), ∃ (n : ℕ), x ∈ filtration.filtration n (⊤ : filtration.filtrationType)
  separated : ⋂ (n : ℕ), filtration.filtration n (⊥ : filtration.filtrationType) = ⊥
  complete : ∀ (x : ℕ → filtration.ring), Cauchy x → ∃ (y : filtration.ring), ∀ (n : ℕ), eventually (x - y ∈ filtration.filtration n (⊤ : filtration.filtrationType))

structure FiltrationPropertiesEvidence (P : FiltrationProperties) where
  exhaustiveClosed : P.exhaustive
  separatedClosed : P.separated
  completeClosed : P.complete

def FiltrationPropertiesClosed (P : FiltrationProperties) : Prop := P.exhaustive ∧ P.separated ∧ P.complete

theorem filtration_properties_closed_from_evidence (P : FiltrationProperties) (E : FiltrationPropertiesEvidence P) : FiltrationPropertiesClosed P := by
  exact And.intro E.exhaustiveClosed (And.intro E.separatedClosed E.completeClosed)

end FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean
end HautevilleHouse