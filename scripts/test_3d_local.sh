#!/usr/bin/env bash
# Quick local 3D render test using low sample count (1 sample vs 10 in production).
# Runs inside the kicad9_auto_full Docker image. All 3D models are bundled in 3d_models/.
#
# Usage:
#   ./scripts/test_3d_local.sh              # render both sets (all + smd-only)
#   ./scripts/test_3d_local.sh 3d_renders   # render only the all-components set

set -euo pipefail

# Disable Git Bash path mangling on Windows
export MSYS_NO_PATHCONV=1

cd "$(git rev-parse --show-toplevel)"

TARGETS="${*:-3d_renders 3d_renders_smd}"
DOCKER_IMAGE="ghcr.io/inti-cmnb/kicad9_auto_full:latest"

# Resolve host path for Docker volume mount (handles Windows paths)
if command -v cygpath &>/dev/null; then
  HOST_DIR="$(cygpath -w "$(pwd)")"
elif command -v pwd &>/dev/null && pwd -W &>/dev/null; then
  HOST_DIR="$(pwd -W)"
else
  HOST_DIR="$(pwd)"
fi

echo "=== Quick 3D render test (samples: 1) ==="
echo "Targets: ${TARGETS}"

docker run --rm \
  -v "${HOST_DIR}:/workspace" \
  -w /workspace \
  "${DOCKER_IMAGE}" \
  bash -c "
    sed 's/samples: 10/samples: 1/' .kibot.yaml > /tmp/kibot_test.yaml && \
    kibot -c /tmp/kibot_test.yaml \
      -b t-dsp_desktop_pro.kicad_pcb \
      -e t-dsp_desktop_pro.kicad_sch \
      -d manufacturing \
      ${TARGETS}
  "

echo "=== Done. Renders in manufacturing/t-dsp_desktop_pro/ ==="
ls -lh manufacturing/t-dsp_desktop_pro/*3D*.png 2>/dev/null
