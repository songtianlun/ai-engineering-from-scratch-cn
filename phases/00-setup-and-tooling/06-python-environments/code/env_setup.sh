#!/usr/bin/env bash
set -euo pipefail

PYTHON_MIN_MAJOR=3
PYTHON_MIN_MINOR=11
VENV_DIR=".venv"
CORE_PACKAGES="numpy matplotlib jupyter scikit-learn pandas"

RED='[0;31m'
GREEN='[0;32m'
YELLOW='[1;33m'
NC='[0m'

pass() { echo -e "  ${GREEN}[PASS]${NC} $1"; }
fail() { echo -e "  ${RED}[FAIL]${NC} $1"; }
warn() { echo -e "  ${YELLOW}[WARN]${NC} $1"; }

REPO_ROOT="$(cd "$(dirname "$0")/../../../.." && pwd)"
cd "$REPO_ROOT"

echo ""
echo "=== AI Engineering from Scratch: Python Environment Setup ==="
echo "=== AI Engineering from Scratch：Python 环境配置 ==="
echo ""
echo "Repo root / 仓库根目录: $REPO_ROOT"
echo ""

HAS_UV=false
if command -v uv &> /dev/null; then
    HAS_UV=true
    pass "uv found / 已找到 uv: $(uv --version)"
else
    warn "uv not found / 未找到 uv。Install it / 安装命令：curl -LsSf https://astral.sh/uv/install.sh | sh"
    warn "Falling back to python3 -m venv + pip / 将退回到 python3 -m venv + pip"
fi

PYTHON_CMD=""
for cmd in python3 python; do
    if command -v "$cmd" &> /dev/null; then
        version=$("$cmd" -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')" 2>/dev/null || true)
        if [ -n "$version" ]; then
            major=$(echo "$version" | cut -d. -f1)
            minor=$(echo "$version" | cut -d. -f2)
            if [ "$major" -ge "$PYTHON_MIN_MAJOR" ] && [ "$minor" -ge "$PYTHON_MIN_MINOR" ]; then
                PYTHON_CMD="$cmd"
                break
            fi
        fi
    fi
done

if [ -z "$PYTHON_CMD" ]; then
    fail "Python ${PYTHON_MIN_MAJOR}.${PYTHON_MIN_MINOR}+ not found / 未找到 Python ${PYTHON_MIN_MAJOR}.${PYTHON_MIN_MINOR}+"
    echo ""
    echo "Install Python ${PYTHON_MIN_MAJOR}.${PYTHON_MIN_MINOR}+ / 安装 Python ${PYTHON_MIN_MAJOR}.${PYTHON_MIN_MINOR}+："
    echo "  uv:    uv python install 3.12"
    echo "  macOS: brew install python@3.12"
    echo "  Linux: sudo apt install python3.12 python3.12-venv"
    exit 1
fi

pass "Python / Python 版本: $($PYTHON_CMD --version)"

echo ""
echo "--- Creating virtual environment / 创建虚拟环境 ---"
echo ""

if [ -d "$VENV_DIR" ]; then
    warn "Existing $VENV_DIR found / 已发现现有 $VENV_DIR，将继续复用。"
else
    if $HAS_UV; then
        uv venv "$VENV_DIR"
    else
        "$PYTHON_CMD" -m venv "$VENV_DIR"
    fi
    pass "Created / 已创建 $VENV_DIR"
fi

if [ -f "$VENV_DIR/bin/activate" ]; then
    source "$VENV_DIR/bin/activate"
elif [ -f "$VENV_DIR/Scripts/activate" ]; then
    source "$VENV_DIR/Scripts/activate"
else
    fail "Could not find activation script in $VENV_DIR / 无法在 $VENV_DIR 中找到激活脚本"
    exit 1
fi

pass "Activated virtual environment / 已激活虚拟环境"

VENV_PYTHON="$(which python)"
if [[ "$VENV_PYTHON" != *"$VENV_DIR"* ]]; then
    fail "Python is not running from the venv / 当前 Python 不来自虚拟环境: $VENV_PYTHON"
    exit 1
fi
pass "Python path / Python 路径: $VENV_PYTHON"

echo ""
echo "--- Installing core packages / 安装核心依赖 ---"
echo ""

if $HAS_UV; then
    uv pip install $CORE_PACKAGES
else
    pip install --upgrade pip
    pip install $CORE_PACKAGES
fi

pass "Installed / 已安装: $CORE_PACKAGES"

echo ""
echo "--- Verifying installation / 验证安装结果 ---"
echo ""

FAILURES=0

verify_package() {
    local pkg=$1
    local import_name=${2:-$1}
    if python -c "import $import_name; print(f'  $pkg: {${import_name}.__version__}')" 2>/dev/null; then
        return 0
    else
        fail "$pkg"
        FAILURES=$((FAILURES + 1))
        return 1
    fi
}

verify_package "numpy" "numpy"
verify_package "matplotlib" "matplotlib"
verify_package "scikit-learn" "sklearn"
verify_package "pandas" "pandas"
verify_package "jupyter" "jupyter_core"

echo ""
python -c "
import numpy as np
a = np.random.randn(3, 3)
b = np.random.randn(3, 3)
c = a @ b
print(f'  Matrix multiply check / 矩阵乘法检查: ({a.shape}) @ ({b.shape}) = ({c.shape})')
"
pass "NumPy operations working / NumPy 运算正常"

echo ""
if python -c "import torch" 2>/dev/null; then
    TORCH_VERSION=$(python -c "import torch; print(torch.__version__)")
    CUDA_AVAIL=$(python -c "import torch; print(torch.cuda.is_available())")
    pass "PyTorch $TORCH_VERSION (CUDA / CUDA 可用: $CUDA_AVAIL)"
else
    warn "PyTorch not installed / 尚未安装 PyTorch（需要时再安装）："
    echo "    uv pip install torch torchvision torchaudio"
fi

echo ""
echo "=== Summary / 总结 ==="
echo ""
echo "  Repo root / 仓库根目录: $REPO_ROOT"
echo "  Venv / 虚拟环境:        $REPO_ROOT/$VENV_DIR"
echo "  Python / Python 版本:   $(python --version)"
echo "  Packages / 依赖包:      $CORE_PACKAGES"
echo ""

if [ "$FAILURES" -gt 0 ]; then
    fail "$FAILURES package(s) failed verification / 有 $FAILURES 个包未通过验证"
    exit 1
else
    pass "All checks passed / 所有检查通过"
    echo ""
    echo "Activate this environment in future sessions / 后续会话中激活此环境："
    echo ""
    echo "  source $REPO_ROOT/$VENV_DIR/bin/activate"
    echo ""
fi
