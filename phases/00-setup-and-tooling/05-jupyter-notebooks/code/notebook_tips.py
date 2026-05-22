import time
import sys

import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import pandas as pd


def timing_comparison():
    print("=== Timing: List vs NumPy / 计时：列表 vs NumPy ===\n")

    size = 1_000_000

    start = time.perf_counter()
    python_list = [x ** 2 for x in range(size)]
    list_time = time.perf_counter() - start
    print(f"List comprehension / 列表推导：{list_time:.4f}s")

    start = time.perf_counter()
    numpy_array = np.arange(size) ** 2
    numpy_time = time.perf_counter() - start
    print(f"NumPy / NumPy：              {numpy_time:.4f}s")
    print(f"Speedup / 加速比：            {list_time / numpy_time:.1f}x")


def inline_plotting():
    print("\n=== Inline Plotting / 内联绘图 ===\n")

    np.random.seed(42)
    x = np.linspace(0, 10, 200)
    y_sin = np.sin(x)
    y_noisy = y_sin + np.random.normal(0, 0.2, 200)

    fig, axes = plt.subplots(1, 2, figsize=(12, 4))

    axes[0].plot(x, y_sin, label="sin(x)")
    axes[0].plot(x, y_noisy, alpha=0.5, label="noisy")
    axes[0].set_title("Signal vs Noise / 信号与噪声")
    axes[0].legend()

    axes[1].hist(y_noisy - y_sin, bins=30, edgecolor="black")
    axes[1].set_title("Noise Distribution / 噪声分布")

    plt.tight_layout()
    plt.savefig("notebook_plot.png", dpi=100)
    print("Saved plot to notebook_plot.png / 图已保存到 notebook_plot.png")
    print("In a notebook, plt.show() displays this inline. / 在 notebook 中，plt.show() 会直接内联显示图像。")


def dataframe_display():
    print("\n=== DataFrame Display / DataFrame 显示 ===\n")

    df = pd.DataFrame({
        "model": ["Linear Regression", "Random Forest", "Neural Network", "XGBoost"],
        "accuracy": [0.72, 0.89, 0.94, 0.91],
        "train_time_sec": [0.1, 2.3, 45.6, 8.2],
        "parameters": [102, 50_000, 1_200_000, 25_000],
    })

    print("In a notebook, just typing 'df' renders a rich HTML table:\n在 notebook 中，直接输入 'df' 就会渲染成富 HTML 表格：\n")
    print(df.to_string(index=False))

    print(f"\nBest model / 最佳模型：{df.loc[df['accuracy'].idxmax(), 'model']}")
    print(f"Fastest model / 最快模型：{df.loc[df['train_time_sec'].idxmin(), 'model']}")


def memory_check():
    print("\n=== Memory Usage / 内存使用 ===\n")

    small = np.random.randn(1000)
    medium = np.random.randn(100_000)
    large = np.random.randn(10_000_000)

    for name, arr in [("1K", small), ("100K", medium), ("10M", large)]:
        size_mb = arr.nbytes / 1e6
        print(f"Array {name:>4s} elements / 数组 {name:>4s} 元素：{size_mb:>8.2f} MB")

    print(f"\nPython process memory / Python 进程内存：约 {sys.getsizeof(large) / 1e6:.1f} MB（large array）")
    print("In notebooks, memory accumulates across cells. Restart the kernel to free it. / 在 notebook 中，内存会跨 cell 累积；重启 kernel 才能释放。")


def magic_command_equivalents():
    print("\n=== Magic Command Equivalents / Magic 命令对应关系 ===\n")
    print("In a notebook, you would use magic commands:\n在 notebook 中，你通常会使用这些 magic 命令：")
    print("  %timeit np.random.randn(10000)    -> micro-benchmark / 微基准测试")
    print("  %%time long_operation()            -> wall clock time / 墙钟时间")
    print("  %matplotlib inline                 -> show plots in cells / 在 cell 中显示图表")
    print("  !pip install package               -> install from notebook / 在 notebook 中安装包")
    print("  %env VAR                           -> check env variable / 检查环境变量")
    print()

    iterations = 1000
    start = time.perf_counter()
    for _ in range(iterations):
        np.random.randn(10000)
    elapsed = time.perf_counter() - start
    per_call = elapsed / iterations * 1e6

    print("Manual timing (like %timeit) / 手动计时（类似 %timeit）：np.random.randn(10000)")
    print(f"  {per_call:.1f} us per call / 每次调用 {per_call:.1f} 微秒（{iterations} iterations）")


if __name__ == "__main__":
    print("Notebook Tips - Key Patterns / Notebook 技巧：关键模式\n")
    print("Run these in a Jupyter notebook to see rich output. / 在 Jupyter notebook 中运行这些示例，可以看到更丰富的输出。\n")

    timing_comparison()
    inline_plotting()
    dataframe_display()
    memory_check()
    magic_command_equivalents()
