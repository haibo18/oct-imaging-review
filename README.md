# oct-imaging-review

光学相干断层扫描（OCT）综述论文 + Lean 4 形式化核验骨架。

**English version: [README.en.md](./README.en.md)**

本仓库沉淀「光学相干断层扫描：从低相干干涉测量到视网膜微血管成像」课题的
研究内容、结论与可机器核验的形式化命题，按语义化版本持续维护，
并提供中英双语论文与文档。

## 目录结构

```
oct-imaging-review/
├── paper/
│   ├── oct_imaging_review.md    # 中文综述
│   └── oct_imaging_review_en.md # English review
├── OctImaging.lean             # Lean 库根模块
├── OctImaging/
│   ├── Basic.lean
│   └── Proofs.lean             # 时间线 / 扫描速率 / 波长与分辨率记录
├── lakefile.toml
├── lean-toolchain
├── lake-manifest.json
├── .github/workflows/          # Lean CI
├── CHANGELOG.md
└── README.md / README.en.md
```

## 论文要点

- **物理原理**：低相干干涉测量，相干门控只放行光程差在相干长度内的回波；轴向分辨率由光源带宽决定。
- **三代演进**：时域 OCT（1991 演示，~0.8 Hz）→ 谱域/Fourier-domain（2000s，灵敏度提升 10–20 dB）→ 扫频光源（2010s，商用 ~100 kHz、实验室 ~1 MHz）。
- **关键数据**：1991 *Science* 首次演示（Huang/Fujimoto/Swanson）；轴向分辨率 ~10 μm → ~5 μm；工作波长 800/840/1050/1310 nm 对应不同组织深度；扫描速率约 10^5–10^6 倍提升。
- **临床**：眼科 AMD、青光眼、糖网常规；冠脉内 OCT 介入；拓展皮肤科、消化内镜、神经外科。
- **奖项**：2023 Lasker-DeBakey 临床医学研究奖；2026 Clarivate 引文桂冠生理学/医学方向 Fujimoto、David Huang、Swanson。

## Lean 形式化工程

工具链：`leanprover/lean4:v4.36.0`，仅依赖核心库，**无 Mathlib**。

构建：

```bash
lake build
```

形式化只覆盖论文中**可数值判定**的陈述：

1. 发展时间线严格递增（`chronology_ordered`）：1991 → 1992 → 1996 → 2023 → 2026；
2. A-scan 速率提升：商用 = 10^5 倍、实验室 = 10^6 倍（`clinical_vs_early_speedup`、`lab_vs_early_speedup`）；
3. 工作波长与轴向分辨率记录（`OctSystem`）；
4. 技术代际 `OctGen` 与速率链 `gen_speedup_chain`；
5. 汇总命题 `paper_evidence_summary`。

> 光物理与临床结论以同行评审文献为准；本工程不把临床诊断命题当作
> 可由算术证明的陈述。工程内 `sorry` / `admit` / `axiom` 数量为 0。

## 双语版本管理

- 论文：`paper/oct_imaging_review.md`（中文）与 `paper/oct_imaging_review_en.md`（英文）内容对齐；
- 文档：`README.md`（中文）与 `README.en.md`（英文）互相链接；
- 变更日志：`CHANGELOG.md` 同时保留中英两段说明；
- 论文修订时应同步更新两个语言版本，提交信息在 subject 中注明 `docs(zh)` / `docs(en)`。

## 版本维护

- 遵循语义化版本（SemVer）：`MAJOR.MINOR.PATCH`。
- 所有显著变更记录于 [`CHANGELOG.md`](CHANGELOG.md)。
- `main` 为主干分支；论文修订、形式化补充、依赖升级分别提交，提交信息
  采用 Conventional Commits（`feat:` / `docs:` / `fix:` / `chore:` 等）。
- 每个发布基线打 Git tag：`vX.Y.Z`。

## 参考文献

见论文末尾「参考文献」一节。
