# AGENTS.md

## Information on this sandbox

You are running code in a Linux system that runs inside a Docker sandbox.

You should have full Internet access, so feel free to search online as needed.

### Filesystems

The project files from the host computer are mounted in `/workspace`. This is where all the code lives, and where you are supposed to edit the code. The user will see your edits there. Your edits there will be persistent.

You have access to a temporary volume in `/scratch`. Feel free to use it especially for experiments that might create large numbers of temporary files. Doing test builds there might be a good idea.

### Development tools

You should have access to the usual development tools. These Ubuntu packages have been installed: `ca-certificates curl xdg-utils git build-essential cmake libclang-dev pkg-config nodejs npm libfontconfig1-dev zstd texlive-full`.

**LaTeX:** You can run LaTeX compilations as usual, e.g. `latexmk -pdf foo.tex` and `pdflatex` should work.

**Rust:** The usual Rust environment has been installed with `rustup`. You can build with `cargo` as usual. Feel free to add any external dependencies with `cargo add` as needed.

**Python:** There is `python3` and `uv` available. Please use `uv` for running Python experiments, especially if you need some external packages. Feel free to use `uv` to access whatever Python packages you might need, including `numpy`, `matplotlib`, `sympy`, and all kinds of solvers such as `python-sat`. Do not try to use `pip` etc. to install anything, just use `uv run` etc.

**Lean:** There is `elan` available, so you also have access to the usual Lean tools. Things like `lake exe cache get` and `lake build` should work fine, but please make sure you do these kinds of compilations in `/scratch` (see below). If you run out of memory, consider using `LAKE_JOBS=1`.

### Lean-specific advice

If the host operating system is macOS, and if you try to do `lake build` (especially for a large project that uses mathlib) directly in `/workspace`, you may get errors claiming that some `.olean` files do not exist, even though they clearly are there in the filesystem. This is a bug in Docker Desktop for macOS: high load in bind-mounted filesystems can lead to such errors. So let us try to avoid doing things like `lake build` in `/workspace`.

Please try to do development so that:

1. you edit the source files in `/workspace`
2. after each edit you `cp -a` the source code `/scratch`
3. you try to compile and test everything in `/scratch`.

It might make sense to follow the same advice also for other programming languages, especially if you are dealing with projects that have gigabytes of dependencies.
