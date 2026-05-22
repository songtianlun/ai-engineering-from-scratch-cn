# GPU Setup & Cloud
GPU 配置与云端环境

> Training on CPU is fine for learning. Training for real needs a GPU.
> 用 CPU 学习完全没问题，但真正做训练时，你需要 GPU。

**Type:** Build
**类型：** Build
**Languages:** Python
**语言：** Python
**Prerequisites:** Phase 0, Lesson 01
**前置要求：** 第 0 阶段，第 01 课
**Time:** ~45 minutes
**耗时：** 约 45 分钟

## Learning Objectives
学习目标

- Verify local GPU availability using `nvidia-smi` and PyTorch's CUDA API
---
- 使用 `nvidia-smi` 和 PyTorch 的 CUDA API 验证本地 GPU 是否可用
- Configure Google Colab with a T4 GPU for free cloud-based experiments
---
- 在 Google Colab 中配置 T4 GPU，用于免费的云端实验
- Benchmark matrix multiplication on CPU vs GPU and measure the speedup
---
- 对比 CPU 与 GPU 上的矩阵乘法速度，并测量加速比
- Estimate the largest model that fits in your VRAM using the fp16 rule of thumb
---
- 使用 fp16 的经验法则估算你的显存能够容纳多大的模型

## The Problem
问题所在

Most lessons in phases 1-3 run fine on CPU. But once you start training CNNs, transformers, or LLMs (phases 4+), you need GPU acceleration. A training run that takes 8 hours on CPU takes 10 minutes on GPU.

第 1 到第 3 阶段中的大多数课程都可以在 CPU 上顺利完成。但一旦你开始训练 CNN、transformers 或 LLMs（第 4 阶段之后），就必须依赖 GPU 加速。一个在 CPU 上需要 8 小时的训练任务，在 GPU 上可能只需要 10 分钟。

You have three options: local GPU, cloud GPU, or Google Colab (free).

你有三种选择：本地 GPU、云端 GPU，或者免费的 Google Colab。

## The Concept
核心概念

```
Your options:

1. Local NVIDIA GPU
   Cost: $0 (you already have it)
   Setup: Install CUDA + cuDNN
   Best for: Regular use, large datasets

2. Google Colab (free tier)
   Cost: $0
   Setup: None
   Best for: Quick experiments, no GPU at home

3. Cloud GPU (Lambda, RunPod, Vast.ai)
   Cost: $0.20-2.00/hr
   Setup: SSH + install
   Best for: Serious training, large models
```

你的选择如下：本地 NVIDIA GPU 成本最低，适合长期使用；Google Colab 上手最快，适合临时实验；云端 GPU 更适合严肃训练和较大模型。

## Build It
动手实践

### Option 1: Local NVIDIA GPU
### 方案 1：本地 NVIDIA GPU

Check if you have one:

先确认你是否拥有可用的 NVIDIA GPU：

```bash
nvidia-smi
```

Install PyTorch with CUDA:

安装支持 CUDA 的 PyTorch：

```python
import torch

print(f"CUDA available: {torch.cuda.is_available()}")
print(f"CUDA version: {torch.version.cuda}")
if torch.cuda.is_available():
    print(f"GPU: {torch.cuda.get_device_name(0)}")
    print(f"Memory: {torch.cuda.get_device_properties(0).total_memory / 1e9:.1f} GB")
```

### Option 2: Google Colab
### 方案 2：Google Colab

1. Go to [colab.research.google.com](https://colab.research.google.com)
---
1. 打开 [colab.research.google.com](https://colab.research.google.com)
2. Runtime > Change runtime type > T4 GPU
---
2. 选择 Runtime > Change runtime type > T4 GPU
3. Run `!nvidia-smi` to verify
---
3. 运行 `!nvidia-smi` 进行验证

Upload notebooks from this course directly to Colab.

你可以把本课程中的 notebooks 直接上传到 Colab 中运行。

### Option 3: Cloud GPU
### 方案 3：云端 GPU

For Lambda Labs, RunPod, or Vast.ai:

如果你使用 Lambda Labs、RunPod 或 Vast.ai，可以这样开始：

```bash
ssh user@your-gpu-instance

pip install torch torchvision torchaudio
python -c "import torch; print(torch.cuda.get_device_name(0))"
```

### No GPU? No problem.
### 没有 GPU？也没关系。

Most lessons work on CPU. The ones that need GPU will say so and include Colab links.

大多数课程都能在 CPU 上完成。确实需要 GPU 的课程会明确说明，并附上 Colab 链接。

```python
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
print(f"Using: {device}")
```

## Build It: GPU vs CPU benchmark
动手实践：GPU 与 CPU 基准测试

```python
import torch
import time

size = 5000

a_cpu = torch.randn(size, size)
b_cpu = torch.randn(size, size)

start = time.time()
c_cpu = a_cpu @ b_cpu
cpu_time = time.time() - start
print(f"CPU: {cpu_time:.3f}s")

if torch.cuda.is_available():
    a_gpu = a_cpu.to("cuda")
    b_gpu = b_cpu.to("cuda")

    torch.cuda.synchronize()
    start = time.time()
    c_gpu = a_gpu @ b_gpu
    torch.cuda.synchronize()
    gpu_time = time.time() - start
    print(f"GPU: {gpu_time:.3f}s")
    print(f"Speedup: {cpu_time / gpu_time:.0f}x")
```

## Exercises
练习

1. Run the benchmark above and compare CPU vs GPU times
---
1. 运行上面的基准测试，对比 CPU 和 GPU 的耗时
2. If you don't have a GPU, run it on Google Colab and compare
---
2. 如果你没有 GPU，就在 Google Colab 上运行并进行对比
3. Check how much GPU memory you have and estimate the largest model you can fit (rule of thumb: 2 bytes per parameter for fp16)
---
3. 查看你的 GPU 显存大小，并估算能容纳多大的模型（经验法则：fp16 每个参数约占 2 字节）

## Key Terms
关键术语

| Term | What people say | What it actually means |
|------|----------------|----------------------|
| CUDA | "GPU programming" | NVIDIA's parallel computing platform that lets you run code on the GPU |
| VRAM | "GPU memory" | Video RAM on the GPU, separate from system RAM. Limits model size. |
| fp16 | "Half precision" | 16-bit floating point, uses half the memory of fp32 with minimal accuracy loss |
| Tensor Core | "Fast matrix hardware" | Specialized GPU cores for matrix multiplication, 4-8x faster than regular cores |

| 术语 | 人们常说的意思 | 实际含义 |
|------|----------------|----------|
| CUDA | “GPU 编程” | NVIDIA 的并行计算平台，让代码能够在 GPU 上运行 |
| VRAM | “GPU 内存” | GPU 上的视频内存，独立于系统内存，决定了模型大小上限 |
| fp16 | “半精度” | 16 位浮点数，在精度损失很小的情况下把内存占用降到 fp32 的一半 |
| Tensor Core | “高速矩阵硬件” | 专为矩阵乘法设计的 GPU 专用核心，速度通常比普通核心快 4-8 倍 |
