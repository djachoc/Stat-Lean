# Reviewing contributions to StatLean

Review aims to ensure that contributions express the intended mathematics
and are clear, useful, and maintainable. Contributor responsibilities are
described in [CONTRIBUTING.md](CONTRIBUTING.md).

## Mathematical meaning

Compare the contributor's original natural-language statement with the actual
Lean declarations. Check the relevant definitions, assumptions, quantifiers,
and conclusions, including implicit parameters and instances that affect
their meaning. Follow the definitions needed to understand the statement.
Check that mathematical content claimed as proved has not instead been assumed
or built into a definition.

Identify additional assumptions, changes in scope, and assumptions that make
the result vacuous. When a contribution claims correspondence with a specific
published result, check that claim against the cited source. Ensure that
documentation and website statements describe the accepted formalization
accurately.

## Proofs and verification

Confirm that the contribution builds successfully and that applicable
validation steps documented by the project have been completed. Record the
checks performed and any outstanding issues.

For Lean changes, use the repository's specified toolchain and dependencies,
run `lake build`, and check that new modules are imported through their area
umbrella into `StatLean.lean`. See the [installation guide](README.md#installation-guide).
For affected website content, follow the [website validation instructions](website/CONTRIBUTING.md#0-before-you-start),
including `npm run build` from `website/`.

Results presented as complete should have complete proofs, with no transitive
dependency on `sorryAx`. Inspect axiom dependencies of new or changed results
and investigate unexpected dependencies or changes to verification settings.
A successful build alone does not establish proof completeness or agreement
with the intended mathematical statement.

## Implementation and library fit

Consider whether definitions and theorem interfaces are useful, whether
existing results can be reused, and whether the code fits the library's
organization and [style conventions](CONTRIBUTING.md#code-style).

Check that documentation explains important definitions and results. Ask for
explanations of proof structure or implementation choices where needed.
Consider the effects of changes to instances, automation, and dependencies.

## Conducting the review

Match the depth of review to the change. New definitions and major theorems
deserve particular attention. For proof-only changes, confirm that the
statement and the definitions and instances determining its meaning remain
unchanged; prior semantic review can then be reused. Reviewers need not
reconstruct every tactic step.

When using automated or AI-generated review reports, check that the evidence
applies to the version under review and verify the key semantic conclusions
against the Lean declarations and stated mathematics, including conclusions
that report no discrepancy.

Give specific, actionable feedback, distinguishing required changes from
suggestions. Partial reviews are welcome; state their scope.

## Completing the review

Before recommending acceptance, confirm that the applicable validation steps
are complete and substantive concerns have been resolved. Leave a brief record
of the review scope, outcome, and important decisions.

Record the reviewed commit and preserve the mathematical statement used for
review, for example through a versioned document link or a quoted statement.
PR descriptions can change without a new commit. When the code or statement
changes, update the affected checks and review conclusions before acceptance.
Maintainers make the final acceptance decision.
