# AGENTS.md

## Project: ClearCreds

ClearCreds removes all cached Windows credentials for the currently logged-in
user using the built-in `cmdkey.exe` tool. It is intended to be run as the
logged-in user (NOT as administrator) and does not require local admin rights.

## Repository layout

- `ClearCreds.bat` — original DOS/CMD batch implementation.
- `ClearCreds.ps1` — PowerShell port (in-memory, handles spaces in targets).
- `README.md` — user-facing documentation.
- `AGENTS.md` — this file.

## How it works

1. Run `cmdkey.exe /list` to capture all stored credentials.
2. Filter lines containing `Target` to obtain credential target names.
3. Run `cmdkey.exe /delete:<target>` for each target.
4. (Batch only) clean up temp files.

## Conventions

- Keep both implementations behaviorally in sync: any change to the credential
  discovery/deletion logic must be applied to both `ClearCreds.bat` and
  `ClearCreds.ps1`.
- Do not add external dependencies; the tooling relies solely on `cmdkey.exe`,
  which ships with Windows.
- Preserve the "run as logged-in user, not admin" guidance in docs and output.
- Scripts must remain single-file and self-contained.

## Testing

There is no automated test suite. Manual verification on a Windows machine:
run the script, then `cmdkey /list` should report no stored credentials.
On non-Windows hosts, only syntax review is possible.

## Notes for agents

- The working directory is the repo root; there are no build steps.
- When editing, prefer the `edit` tool for targeted changes and keep diffs small.
- Update `README.md` whenever a new variant or usage option is added.
