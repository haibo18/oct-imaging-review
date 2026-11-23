# Optical Coherence Tomography (OCT): From Low-Coherence Interferometry to Retinal Microvascular Imaging — A Nobel-Caliber Technology

**Field**: Biomedical photonics / medical imaging / ophthalmology
**Date**: 2026-11-20
**Companion formalization**: `OctImaging/` (Lean 4, machine-checkable skeleton for timeline, scan rate, wavelength & resolution records)

---

## Abstract

Optical coherence tomography (OCT) is a non-invasive three-dimensional imaging technique based on low-coherence interferometry. By measuring the delay and intensity of backscattered echoes, it produces micron-scale cross-sections of biological tissue. In 1991, David Huang, James G. Fujimoto, Eric A. Swanson, and colleagues at MIT and Harvard Medical School first demonstrated OCT on ex vivo retina and coronary artery. The technology then evolved through three generations — time-domain, spectral/Fourier-domain, and swept-source — raising A-scan rates from about 0.8 Hz to hundreds of kHz commercially and MHz in the lab, with axial resolution down to a few microns. OCT is now the standard of care in ophthalmology (AMD, glaucoma, diabetic retinopathy) and in intravascular interventional imaging, and is extending to dermatology, GI endoscopy, and neurosurgery. This review covers the physical principle, technical generations, performance data, clinical impact, and open problems, and assesses the case for an international science award.

**Keywords**: OCT; low-coherence interferometry; biomedical imaging; retina; swept-source; OCT angiography; Fujimoto; David Huang; Swanson

---

## 1. Introduction

A main thread of medical diagnosis is visualizing internal tissue structure. After Helmholtz invented the ophthalmoscope in 1851, humans could see the living retina for the first time. Röntgen's 1895 X-rays, followed by CT and MRI, pushed internal imaging into cross-sectional three dimensions. OCT is the newest member of this lineage: it uses light rather than sound, coherence gating rather than ionizing radiation, to produce near-cellular-resolution non-invasive cross-sections of living tissue — a central retinal volume scan completed in under a minute, pain-free and risk-free.

Like ultrasound, OCT measures echo time-of-flight. But light scatters strongly in tissue, so deep echoes are swamped. OCT borrows an interferometer so that only backscattered light whose optical-path difference lies within the source coherence length contributes, compressing the "optical radar" depth resolution from millimeters to microns.

## 2. Physical Principle: Low-Coherence Interferometry and Coherence Gating

### 2.1 Mach–Zehnder / Michelson Interferometer

The OCT source is a low-coherence broadband source (superluminescent diode or swept laser). The beam is split into two arms:

- **Sample arm**: light is focused to different depths in biological tissue and backscatters;
- **Reference arm**: a mirror returns reference light.

The two beams recombine and interfere. An interference signal is observed only when the sample-echo path and reference path differ by less than the source coherence length. Sweeping the reference-arm path (time-domain OCT) or detecting all wavelengths in parallel (spectral-domain OCT) yields the reflectivity profile at different depths — a single A-scan.

### 2.2 Axial Resolution and Source Bandwidth

Axial (depth) resolution is set by the source coherence length:

\[
\Delta z = \frac{2\ln 2}{\pi}\cdot \frac{\lambda_0^2}{\Delta\lambda}
\]

i.e., **the broader the source spectrum, the better the axial resolution**. Modern spectral-domain OCT achieves about 5–10 μm axial resolution; the early demonstration used a low-coherence laser diode near 800 nm at about 10 μm.

### 2.3 Operating Wavelength

- **~800–840 nm**: shallow retina (neural retina), moderate scattering;
- **~1050 nm**: deeper choroid/sclera, low water absorption, deeper penetration;
- **~1310 nm**: high-scattering tissue such as coronary artery and endoscopic OCT.

Wavelength choice is a trade-off among scattering, water absorption, and resolution.

## 3. Three Generations

### 3.1 First Generation: Time-Domain OCT (from 1991)

The reference-arm mirror was mechanically scanned, acquiring depth signals point by point. The early demonstration used 625 nm femtosecond pulses (65 fs) to achieve about 15 μm in-tissue axial resolution; early commercial systems ran at about 100–400 A-scans/s. The 1991 *Science* paper first showed cross-sections of ex vivo pig retina and bovine anterior chamber, with sensitivity around -100 dB (detecting echoes at 10⁻¹⁰ of incident intensity).

### 3.2 Second Generation: Spectral / Fourier-Domain OCT (2000s)

A grating + CCD camera detected all wavelength components in parallel; a Fourier transform recovered the entire depth profile in one shot, removing the need for reference-arm mechanical scanning. Sensitivity improved by about 10–20 dB, and A-scan rates jumped from Hz to kHz–tens of kHz, enabling three-dimensional in vivo retinal volumetric imaging.

### 3.3 Third Generation: Swept-Source OCT (2010s)

A narrow-linewidth laser sweeps rapidly across a broad spectrum; a balanced detector samples point by point. A-scan rates reach 100 kHz commercially and several MHz in the lab. High speed enables two key capabilities:

1. **OCT angiography (OCTA)**: without contrast, repeated scans separate red-blood-cell motion signals, producing label-free three-dimensional perfusion imaging of retinal/choroidal capillaries;
2. **High-definition dynamic imaging**: reduced motion artifacts, supporting retinal-surgery guidance and intracoronary interventional OCT.

## 4. Key Performance Data

| Metric | Early demo (1991) | Modern commercial (spectral/swept) | Lab prototype |
|---|---|---|---|
| A-scan rate | ≈ 0.8 Hz | ≈ 100 kHz | ≈ 1 MHz |
| Axial resolution | ≈ 10–15 μm | ≈ 5 μm (fundus) | ≈ 1–3 μm (ultra-high-res) |
| Wavelength | ≈ 800 nm | 840 nm (fundus) / 1050 nm (deep) | — |
| Imaging depth | ex vivo few mm | in vivo retina ~2–3 mm | — |
| Sensitivity | ≈ -100 dB | ≈ -105–110 dB | — |

> Scan-rate gain: commercial systems are about 10⁵× faster than the 1991 demo; lab prototypes about 10⁶×. These integers are machine-checked by `decide` in the companion Lean project.

## 5. Clinical and Industrial Impact

- **Ophthalmology**: OCT is the standard diagnostic and follow-up tool for age-related macular degeneration (AMD), glaucoma optic-nerve-layer analysis, diabetic retinopathy, central serous chorioretinopathy, and retinal detachment. Hundreds of millions of OCT scans are performed annually worldwide.
- **Cardiovascular**: intracoronary OCT is advanced via catheter into the coronary artery to assess plaque morphology before stenting and stent apposition after.
- **Other**: dermatology (skin-cancer margins), GI endoscopy (Barrett's esophagus), neurosurgery (intraoperative navigation), dentistry (early caries).
- **Industry**: Carl Zeiss (Cirrus), Topcon, Heidelberg (Spectralis), Optovue dominate; the global OCT market is a multi-billion-dollar business in the 2020s.

## 6. Open Problems and Limitations

1. **Imaging depth**: light attenuates rapidly in high-scattering tissue; in vivo penetration remains at 2–3 mm;
2. **Motion artifacts**: even with high-speed scanning, eye motion requires correction algorithms;
3. **Probe miniaturization**: endoscopic OCT probe diameter, flexibility, and imaging quality remain a trade-off;
4. **Quantitative analysis**: OCT signal intensity depends on scattering and instrument settings; quantitative tissue properties (refractive index, attenuation coefficient) are still being standardized;
5. **AI assistance**: segmentation, quantification, and disease-risk prediction models require large multi-center validation.

## 7. Case for a Science Award

OCT simultaneously satisfies several Nobel criteria:

- **Paradigm-level new imaging modality**: after X-ray, CT, and MRI, it opened an entirely new direction — "optical micron-scale non-invasive cross-section";
- **Closed loop from principle to engineering to clinic**: from low-coherence interferometry to commercial instruments to routine ophthalmology and cardiovascular intervention, the full loop closed in barely more than a decade;
- **Clear core contributors**: Fujimoto (MIT, physics/engineering), David Huang (then MIT/Harvard MD-PhD student, now OHSU Casey Eye Institute), and Swanson (MIT, engineering);
- **Leading indicators**: the 2023 Lasker-DeBakey Clinical Medical Research Award went to the three; the National Medal of Technology and Innovation; the 2026 Clarivate Citation Laureates in Physiology/Medicine again recognized the three for "developing optical coherence tomography, a novel imaging technology in medicine, biomedical research, and other applications."

Uncertainties:

- The Nobel Prize in Physiology/Medicine favors "discovery/mechanism" over "instrument invention"; historically Röntgen (Physics), CT (Hounsfield/Cormack, Medicine) and MRI (Lauterbur/Mansfield, Physiology/Medicine) show that instrument inventions can be awarded, but the committee must choose between Physics (optics/interferometry) and Physiology/Medicine (clinical imaging);
- Whether Fercher's parallel early work on ocular low-coherence measurement (1980s–1991) enters the narrative may affect the list;
- Just one year after the 2026 Physiology/Medicine prize for optogenetics, whether the committee will consecutively award the medicine prize to an imaging technology carries schedule uncertainty.

Overall: OCT is one of the most competitive candidates for the 2027 Physiology/Medicine prize.

## References

1. Huang D, Swanson EA, Lin CP, et al. Optical coherence tomography. *Science*, 1991, 254(5035): 1178–1181.
2. Fujimoto JG, Pitris C, Boppart SA, Brezinski ME. Optical coherence tomography: an emerging technology for biomedical imaging and optical biopsy. *Neoplasia*, 2000, 2(1–2): 9–25.
3. Drexler W, Fujimoto JG (eds.). *Optical Coherence Tomography: Technology and Applications*. Springer, 2nd ed., 2015.
4. Huang D. Seeing is believing: The development of optical coherence tomography (2023 Lasker-DeBakey Clinical Medical Research Award). *PNAS*, 2023, 120(40): e2311129120.
5. Clarivate. 2026 Citation Laureates — Physiology or Medicine: J. G. Fujimoto, D. Huang, E. A. Swanson, for the development of optical coherence tomography, 2026.
6. Choma MA, Sarunic MV, Yang CH, Izatt JA. Sensitivity advantage of swept source and Fourier domain optical coherence tomography. *Opt Express*, 2003, 11(18): 2183–2189.

---

> Note: the year ordering, scan-rate gains, and wavelength/resolution records in this review are machine-checked as decidable propositions in the companion Lean 4 project `OctImaging/`; photophysics, clinical, and diagnostic conclusions are sourced from peer-reviewed literature.
