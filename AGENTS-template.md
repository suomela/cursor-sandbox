# AGENTS.md

## Information on this sandbox

You are running code on a Linux system inside a Docker sandbox.

You have full internet access. You MAY search online as needed. `curl` is available.

### File systems

The project files from the host computer are mounted in `/workspace`. You SHOULD make edits in `/workspace` so the user can see them, and so your changes persist across runs.

You have access to a temporary volume in `/scratch`. You MAY use it for experiments and build outputs. You SHOULD treat `/scratch` as temporary storage: it MAY be cleared, and you MUST NOT rely on it for long-term persistence.

### Development tools

You have access to the usual development tools. These Ubuntu packages are installed: `ca-certificates curl xdg-utils git time rsync jq poppler-utils build-essential cmake libclang-dev pkg-config nodejs npm libfontconfig1-dev zstd texlive-full`. You MUST NOT try to install new packages or do any system-wide modifications.

**LaTeX:** You MAY run LaTeX compilations as usual, using e.g. `latexmk -pdf foo.tex` and `pdflatex`.

**Rust:** The usual Rust environment is installed with `rustup`. You MAY build with `cargo` as usual. You MAY add external dependencies with `cargo add` as needed.

**Python:** `python3` and `uv` are available. You MUST use `uv` for running Python experiments, especially if you need external packages. You MAY use `uv` to access any Python packages that you need (including `numpy`, `matplotlib`, `sympy`, `python-sat`). You MUST NOT use `pip` to install anything; use `uv run` instead.

**Lean:** `elan` is available, so you have access to the usual Lean tools. Commands like `lake exe cache get` and `lake build` work. You SHOULD run Lean compilations in `/scratch` (see below). If you run out of memory, you SHOULD retry with `LAKE_JOBS=1`.

### Lean-specific advice

Running `lake build` directly in `/workspace` may fail with errors claiming that some `.olean` files do not exist, even though they are present. This is a bug in Docker Desktop for macOS. Therefore you SHOULD avoid doing things like `lake build` in `/workspace`.

Here are the best practices:

- You SHOULD edit sources in `/workspace`, but build/test in `/scratch`.
- You SHOULD keep the scratch copy's `.lake/` directory between builds to preserve caches.
- You SHOULD sync sources to `/scratch/<proj>` (prefer `rsync`).
- After syncing, you SHOULD run `lake exe cache get` (fetch precompiled dependencies when available), then `lake build` (or a specific target).
- If memory is tight, you SHOULD retry with `LAKE_JOBS=1`.
- You SHOULD add and use a small helper script that syncs `/workspace` → `/scratch/<proj>` while preserving `.lake/`, then runs the two `lake` commands.

For very long-running Lean compilations, you SHOULD capture compiler output (e.g., with `tee`) and store it in `/scratch` so nothing gets lost if there are lots of error messages.

You SHOULD follow the same advice for other programming languages when applicable.

### Remarks

If you are looking for Bash, it is available as `/bin/bash` (while `/bin/sh` is `dash`).
