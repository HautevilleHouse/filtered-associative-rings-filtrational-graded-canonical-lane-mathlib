import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean.FilteredRing

namespace HautevilleHouse
namespace FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean

structure GradedPiece (F : FilteredRingObject) where
  degree : ℕ
  piece : Set (FilteredRing.carrier (FilteredRingObject.ring F))
  subsetOfFiltration : piece ⊆ FilteredRingObject.filtration F degree
  pieceIsAdditiveSubgroup : AddSubgroup (FilteredRing.carrier (FilteredRingObject.ring F)) where
    carrier := piece
  closureUnderMultiplication : ∀ (a b : FilteredRing.carrier (FilteredRingObject.ring F)),
    a ∈ piece → b ∈ piece → FilteredRing.multiplication (FilteredRingObject.ring F) a b ∈ piece

structure GradedPieceEvidence (F : FilteredRingObject) (G : GradedPiece F) where
  subsetOfFiltrationClosed : G.subsetOfFiltration
  closureUnderMultiplicationClosed : G.closureUnderMultiplication

def GradedPieceClosed (F : FilteredRingObject) (G : GradedPiece F) : Prop :=
  G.subsetOfFiltration ∧ G.closureUnderMultiplication

theorem graded_piece_closed_from_evidence (F : FilteredRingObject) (G : GradedPiece F) (E : GradedPieceEvidence F G) : GradedPieceClosed F G :=
  And.intro E.subsetOfFiltrationClosed E.closureUnderMultiplicationClosed

end FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean
end HautevilleHouse