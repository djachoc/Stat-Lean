# Contributing to Stat-Lean — Statistical Theory in Lean 4

Thank you for your interest in contributing! This project formalizes
statistical theory in Lean 4 / Mathlib, organized into per-area sublibraries
under `StatLean/` — asymptotic (parametric & semiparametric) statistics,
Bayesian statistics, concentration inequalities, high-dimensional statistics,
minimaxity, multiple testing, and optimization. Contributions of new theorems,
improved proofs, website content, and documentation are all welcome.

## Contributor responsibility

Contributors should be responsible for the code they submit, including its
definitions, assumptions, theorem statements, and proofs. They should be
prepared to explain relevant mathematical and implementation choices and
address review feedback. These expectations apply equally to AI-assisted
contributions.

## Getting started

1. Fork the repository and clone your fork.
2. Follow the [Installation Guide](README.md#installation-guide) to set up Lean
   and fetch the Mathlib cache.
3. Run `lake build` to verify that everything compiles before making changes.

## Types of contributions

### New formalizations

If you want to add a new theorem or definition:

- Place Lean source files under `StatLean/` in the appropriate area
  (e.g., `StatLean/Bayesian/`, `StatLean/ConcentrationInequalities/`,
  `StatLean/AsymptoticStatistics/`). Pure-math prerequisites that could live in
  Mathlib go in that area's `ForMathlib/` subdirectory; concept files should
  stay theorem-agnostic, with theorem-specific wiring in assembly files.
- Ensure the new module is imported in its area umbrella
  (`StatLean/<Area>.lean`), which `StatLean.lean` imports.
- Every user-facing result should have a corresponding entry in
  `website/src/data/results.json` with:
  - `informal` — the natural-language statement with LaTeX math (`$…$`)
  - `leanSignature` — the verbatim Lean `theorem`/`def` header
  - `hypotheses` — the list mapping Lean hypothesis names to their
    informal descriptions (used for hover-highlighting)
  - `citation` — the required website citation field; for a sourced result,
    identify the theorem/lemma in the source text. See the
    [website contribution guide](website/CONTRIBUTING.md) for the data format.
    If no published source applies, identify the contributor-provided statement
    or project documentation.

### Improving existing proofs

- Shorter or more readable proofs are always welcome.
- If a proof currently uses `sorry`, replacing it with a complete proof is a
  high-priority contribution.
- Lean proofs should be self-contained: avoid introducing new `sorry`s.

### Website content

The interactive atlas lives in `website/`. See
[`website/README.md`](website/README.md) for the development workflow.

- Informal statement improvements: edit the `informal` field in
  `website/src/data/results.json`. Statements should be in natural language
  with LaTeX math — no Lean-style identifiers.
- Adding a result to the site: add a full entry to `results.json` and a
  corresponding line in `website/targets.txt` (`<id>\t<fullName>`).

### Bug reports and suggestions

Open a [GitHub issue](https://github.com/StatLean/Stat-Lean/issues)
describing the problem or suggestion.

## Pull request guidelines

- **Branch from `main`** — create a feature branch (`git checkout -b my-feature`).
- **One logical change per PR** — keep related Lean code, result pages, and
  documentation together; separate unrelated refactors or website edits.
- **All files must compile** — run `lake build` (and for website changes,
  `npm run build` inside `website/`) before opening a PR.
- **Commit messages** — use a short imperative subject line, e.g.:
  `Add Donsker theorem for VC classes` or `Fix: remove sorry in LANExpansion`.
- **Describe the mathematical content** — provide or link to a clear
  natural-language statement, including relevant definitions, assumptions,
  and conclusions, and explain its intended use. For existing results,
  highlight changes to definitions, assumptions, conclusions, or public
  interfaces. Include references where applicable; claims of correspondence
  with a particular published result should identify its source and location.

## Review process

Contributions are reviewed for mathematical accuracy, clarity, and
maintainability, including whether the Lean formalization matches the stated
mathematical content. Reviewers consider the documented validation results
alongside the code and mathematical statement. Maintainers make the final
acceptance decision. See [Reviewing contributions](REVIEWING.md) for the
review guidelines.

## Code style

### Lean

- Follow [Mathlib style conventions](https://leanprover-community.github.io/contribute/style.html).
- Name theorems and definitions using `camelCase` consistent with the existing
  codebase.
- Add a `/-! … -/` module docstring at the top of each new file.
- Hypothesis names should be short and descriptive (`h_qmd`, `hJ`, etc.).

### Website (TypeScript / React)

- Run `npm run build` to type-check before committing.
- Informal statements in `results.json` must not contain Lean-style notation —
  translate all hypotheses to standard mathematical language and LaTeX.
- The `informal` field may contain HTML (`<span data-link="hN">…</span>` for
  hover-linking, `<p>`, `<strong>`, etc.) but all math must use `$…$` or
  `$$…$$` KaTeX delimiters.

## License

By contributing, you agree that your contributions will be licensed under the
[Apache License 2.0](LICENSE).
