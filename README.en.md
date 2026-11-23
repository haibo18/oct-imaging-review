# oct-imaging-review

Optical coherence tomography (OCT) review + Lean 4 formalization skeleton.

**中文版：[README.md](./README.md)**

This repository collects the research output, conclusions, and machine-checkable
formalization of "optical coherence tomography: from low-coherence interferometry
to retinal microvascular imaging", maintained under Semantic Versioning with
bilingual Chinese/English documents.

## Layout

```
oct-imaging-review/
├── paper/
│   ├── oct_imaging_review.md    # 中文综述
│   └── oct_imaging_review_en.md # English review
├── OctImaging.lean              # Lean library root
├── OctImaging/
│   ├── Basic.lean
│   └── Proofs.lean              # timeline / scan rate / wavelength & resolution records
├── lakefile.toml
├── lean-toolchain
├── lake-manifest.json
├── .github/workflows/           # Lean CI
├── CHANGELOG.md
└── README.md / README.en.md
```

## Highlights

- **Physical principle**: low-coherence interferometry; coherence gating accepts only echoes whose optical path difference lies within the source coherence length; axial resolution is set by source bandwidth.
- **Three generations**: time-domain OCT (1991, ~0.8 Hz) → spectral/Fourier-domain (2000s, sensitivity +10–20 dB) → swept-source (2010s, commercial ~100 kHz, lab ~1 MHz).
- **Key numbers**: 1991 *Science* first demonstration (Huang/Fujimoto/Swanson); axial resolution ~10 μm → ~5 μm; operating wavelengths 800/840/1050/1310 nm; scan-rate gain ~10⁵–10⁶.
- **Clinical**: routine ophthalmology (AMD, glaucoma, diabetic retinopathy); intracoronary OCT; extension to dermatology, GI endoscopy, neurosurgery.
- **Prize case**: 2023 Lasker-DeBakey Clinical Award; 2026 Clarivate Citation Laureates in Physiology/Medicine — Fujimoto, David Huang, Swanson.

## Lean formalization

Toolchain: `leanprover/lean4:v4.36.0`, core library only, **no Mathlib**.

Build:

```bash
lake build
```

The formalization only covers **numerically decidable** claims:

1. Chronology strictly increasing (`chronology_ordered`): 1991 → 1992 → 1996 → 2023 → 2026;
2. A-scan rate gains: commercial 10⁵×, lab 10⁶× (`clinical_vs_early_speedup`, `lab_vs_early_speedup`);
3. Operating wavelengths and axial-resolution records (`OctSystem`);
4. Technical generations `OctGen` and rate chain `gen_speedup_chain`;
5. Summary proposition `paper_evidence_summary`.

> Photophysics and clinical conclusions are sourced from peer-reviewed
> literature; this project does not treat clinical diagnostic claims as
> arithmetically provable. There are **zero** `sorry` / `admit` / `axiom`.

## Bilingual version management

- Papers: `paper/oct_imaging_review.md` (Chinese) and `paper/oct_imaging_review_en.md` (English) are kept in sync;
- Docs: `README.md` (Chinese) and `README.en.md` (English) cross-link each other;
- Changelog: `CHANGELOG.md` keeps both Chinese and English paragraphs;
- When revising the paper, update both language versions in the same commit, tagged `docs(zh)` / `docs(en)`.

## Versioning

- Semantic Versioning (`MAJOR.MINOR.PATCH`).
- All notable changes are recorded in [`CHANGELOG.md`](CHANGELOG.md).
- `main` is the trunk; commits use Conventional Commits.
- Each release baseline is tagged `vX.Y.Z`.

## References

See the "References" section at the end of the review papers.
