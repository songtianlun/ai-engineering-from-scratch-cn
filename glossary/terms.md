# AI Engineering Glossary
AI 工程术语表

## A
A

### Agent
智能体
- **What people say:** "An autonomous AI that thinks and acts on its own" --- **人们会说：** "一种会自行思考并自主行动的自治 AI"
- **What it actually means:** A while loop where an LLM decides what tool to call next, executes it, sees the result, and repeats --- **它实际上的意思是：** 一个 while 循环，由 LLM 决定下一步调用哪个工具，执行它，查看结果，然后重复
- **Why it's called that:** Borrowed from philosophy — an "agent" is anything that can act in the world. In AI, it just means "LLM + tools + loop" --- **为什么叫这个：** 借自哲学——“agent”指任何能够在世界中行动的事物。在 AI 里，它其实只是指“LLM + 工具 + 循环”

### Attention
注意力
- **What people say:** "How the AI focuses on important parts" --- **人们会说：** "AI 如何关注重要部分"
- **What it actually means:** A mechanism where every token computes a weighted sum of all other tokens' values, with weights determined by how relevant they are (via dot product of query and key vectors) --- **它实际上的意思是：** 一种机制，其中每个 token 都会对所有其他 token 的值计算加权和，权重由它们的相关性决定（通过 query 向量和 key 向量的点积）
- **Why it's called that:** The 2017 paper "Attention Is All You Need" named it by analogy to human selective attention --- **为什么叫这个：** 2017 年的论文《Attention Is All You Need》通过类比人类的选择性注意而命名了它

### Alignment
对齐
- **What people say:** "Making AI safe" --- **人们会说：** "让 AI 更安全"
- **What it actually means:** The technical challenge of making an AI system's behavior match human intentions, values, and preferences, including edge cases the designer didn't anticipate --- **它实际上的意思是：** 让 AI 系统的行为与人类的意图、价值观和偏好相匹配的技术挑战，包括设计者未曾预料到的边缘情况

### Autoregressive
自回归
- **What people say:** "The AI generates one word at a time" --- **人们会说：** "AI 一次生成一个词"
- **What it actually means:** A model that predicts the next token conditioned on all previous tokens, then feeds that prediction back as input for the next step. GPT, LLaMA, and Claude are all autoregressive. --- **它实际上的意思是：** 一种模型，在所有先前 token 的条件下预测下一个 token，然后把这个预测结果作为下一步的输入再喂回去。GPT、LLaMA 和 Claude 都是自回归模型。

### Activation Function
激活函数
- **What people say:** "The nonlinear thing between layers" --- **人们会说：** "层与层之间的那个非线性东西"
- **What it actually means:** A function applied after each linear layer that introduces nonlinearity. Without it, stacking any number of linear layers collapses to a single linear transformation. ReLU, GELU, and SiLU are the most common. The choice directly affects whether gradients flow during training. --- **它实际上的意思是：** 在线性层之后应用的函数，用来引入非线性。如果没有它，堆叠任意数量的线性层都等价于一次单独的线性变换。最常见的是 ReLU、GELU 和 SiLU。它的选择会直接影响训练时梯度能否传播。

### Adam (Optimizer)
Adam（优化器）
- **What people say:** "The default optimizer" --- **人们会说：** "默认优化器"
- **What it actually means:** Adaptive Moment Estimation. Combines momentum (first moment) with adaptive learning rates per parameter (second moment). Has bias correction for early steps. Works well across most tasks without much tuning. --- **它实际上的意思是：** Adaptive Moment Estimation。它将动量（一阶矩）与每个参数的自适应学习率（二阶矩）结合起来，并对早期步骤做偏差校正。无需太多调参，就能在大多数任务上取得良好效果。

### AdamW
AdamW
- **What people say:** "Adam but better" --- **人们会说：** "Adam，但更好"
- **What it actually means:** Adam with decoupled weight decay. In standard Adam, L2 regularization gets scaled by the adaptive learning rate per parameter, which is not what you want. AdamW applies weight decay directly to the weights, independent of the gradient statistics. The default optimizer for training transformers. --- **它实际上的意思：** 带解耦权重衰减的 Adam。在标准 Adam 中，L2 正则化会按每个参数的自适应学习率进行缩放，这并不是你想要的。AdamW 直接将权重衰减应用到权重本身上，独立于梯度统计。训练 Transformer 的默认优化器。

### Autograd
Autograd
- **What people say:** "Automatic gradients" --- **人们会说：** "自动梯度"
- **What it actually means:** A system that records operations on tensors and automatically computes gradients via reverse-mode differentiation. PyTorch's autograd builds a computation graph on-the-fly (dynamic graph), while JAX uses function transformations (grad). This is what makes backpropagation practical -- you write the forward pass, and the framework computes all the derivatives. --- **它实际上的意思：** 一个记录张量上的操作并通过反向模式求导自动计算梯度的系统。PyTorch 的 autograd 会即时构建计算图（动态计算图），而 JAX 使用函数变换（grad）。这让反向传播变得可行——你只需编写前向传播，框架就会计算出所有导数。

## B
B

### Batch Size
批大小
- **What people say:** "How many examples at once" --- **人们会说：** "一次处理多少个样本"
- **What it actually means:** The number of training examples processed in one forward/backward pass before updating weights. Larger batches give more stable gradient estimates but use more memory. Typical values: 32-512 for training, larger for inference. Batch size interacts with learning rate -- double the batch, double the LR (linear scaling rule). --- **它实际上的意思：** 在更新权重之前，一次前向/反向传播中处理的训练样本数量。更大的批次会带来更稳定的梯度估计，但也会占用更多内存。典型值：训练时为 32-512，推理时更大。批大小会与学习率相互作用——批次翻倍，LR 也翻倍（线性缩放法则）。

### Backpropagation
反向传播
- **What people say:** "How neural networks learn" --- **人们会说：** "神经网络如何学习"
- **What it actually means:** An algorithm that computes how much each weight contributed to the error by applying the chain rule backward through the network, then adjusts weights proportionally --- **它实际上的意思：** 一种算法，通过将链式法则沿网络反向应用，计算每个权重对误差的贡献有多大，然后按比例调整权重
- **Why it's called that:** Errors propagate backward from output to input, layer by layer --- **为什么叫这个名字：** 误差从输出向输入反向传播，逐层回传

## C
C

### Context Window
上下文窗口
- **What people say:** "How much the AI can remember" --- **人们会说：** "AI 能记住多少内容"
- **What it actually means:** The maximum number of tokens (input + output) that fit in a single API call. Not memory — it's a fixed-size buffer that resets every call --- **它实际上的意思：** 单次 API 调用中可容纳的最大 token 数量（输入 + 输出）。这不是记忆——它是一个固定大小的缓冲区，并且每次调用都会重置

### Chain of Thought (CoT)
思维链（CoT）
- **What people say:** "Making the AI think step by step" --- **人们会说：** "让 AI 一步一步思考"
- **What it actually means:** A prompting technique where you ask the model to show its reasoning steps, which improves accuracy on multi-step problems because each step conditions the next token generation --- **它实际上的意思：** 一种提示技术，你要求模型展示其推理步骤。它能提高多步问题上的准确性，因为每一步都会为下一个 token 的生成提供条件

### CNN (Convolutional Neural Network)
CNN（卷积神经网络）
- **What people say:** "Image AI" --- **人们会说：** "图像 AI"
- **What it actually means:** A neural network that uses convolution operations (sliding filters over the input) to detect local patterns. Stacking convolutions detects increasingly complex features: edges, textures, objects. --- **它实际上的意思：** 一种使用卷积操作（让滤波器在输入上滑动）来检测局部模式的神经网络。堆叠多层卷积可以检测越来越复杂的特征：边缘、纹理、物体。

### CUDA
CUDA
- **What people say:** "GPU programming" --- **人们会说：** "GPU 编程"
- **What it actually means:** NVIDIA's parallel computing platform. Lets you run matrix operations on thousands of GPU cores simultaneously. PyTorch and TensorFlow use CUDA under the hood. --- **它的实际含义：** NVIDIA 的并行计算平台。让你可以同时在数千个 GPU 核心上运行矩阵运算。PyTorch 和 TensorFlow 底层都使用 CUDA。

### Chunking
分块
- **What people say:** "Splitting documents into pieces" --- **人们常说：** "把文档切成几块"
- **What it actually means:** Breaking text into segments before embedding for retrieval. Chunk size determines the granularity of search results. Too small: loses context. Too large: dilutes relevance. Common strategies: fixed-size with overlap, sentence-based, or semantic splitting. Typical chunk size: 256-512 tokens with 10-20% overlap. --- **它的实际含义：** 在为检索生成嵌入之前，先把文本拆分成若干片段。块大小决定了搜索结果的粒度。太小：会丢失上下文。太大：会稀释相关性。常见策略：带重叠的固定大小、基于句子，或基于语义的拆分。典型的块大小是 256-512 个 tokens，并带有 10-20% 的重叠。

### Contrastive Learning
对比学习
- **What people say:** "Learning by comparison" --- **人们常说：** "通过比较来学习"
- **What it actually means:** Training by pulling similar pairs closer and pushing dissimilar pairs apart in embedding space. CLIP uses this: matching image-text pairs vs non-matching ones. --- **它的实际含义：** 通过让相似的样本对在嵌入空间中更接近、让不相似的样本对更远离来进行训练。CLIP 就是这样做的：将匹配的图像-文本对与不匹配的图像-文本对进行对比。

### Cosine Similarity
余弦相似度
- **What people say:** "How similar two vectors are" --- **人们常说：** "两个向量有多相似"
- **What it actually means:** The cosine of the angle between two vectors: dot(a, b) / (||a|| * ||b||). Ranges from -1 (opposite) to 1 (identical direction). Ignores magnitude, only cares about direction. The standard similarity metric for embeddings and semantic search. --- **它的实际含义：** 两个向量之间夹角的余弦：dot(a, b) / (||a|| * ||b||)。取值范围从 -1（方向相反）到 1（方向完全相同）。它忽略大小，只关注方向。是嵌入表示和语义搜索的标准相似度度量。

### Cross-Entropy
交叉熵
- **What people say:** "The classification loss" --- **人们常说：** "分类损失"
- **What it actually means:** Measures the difference between two probability distributions. For classification: -sum(y_true * log(y_pred)). For language models: the negative log probability of the correct next token. Lower is better. Perplexity is just exp(cross-entropy). --- **它的实际含义：** 衡量两个概率分布之间的差异。用于分类时：-sum(y_true * log(y_pred))。用于语言模型时：正确下一个 token 的负对数概率。越低越好。困惑度其实就是 exp(cross-entropy)。

## D
D

### Data Augmentation
数据增强
- **What people say:** "Making more training data" --- **人们常说：** "制造更多训练数据"
- **What it actually means:** Creating modified copies of existing data (rotate images, add noise, paraphrase text) to increase training set diversity without collecting new data. Reduces overfitting. --- **它的实际含义：** 通过对现有数据进行修改后复制（旋转图像、添加噪声、改写文本），在不收集新数据的情况下增加训练集的多样性。可以减少过拟合。

### Decoder
解码器
- **What people say:** "The output part" --- **人们常说：** "输出部分"
- **What it actually means:** In transformers, a decoder uses causal (masked) self-attention so each position can only attend to earlier positions. GPT is decoder-only. BERT is encoder-only. T5 is encoder-decoder. --- **它的实际含义：** 在 transformers 中，decoder 使用因果型（masked）自注意力，因此每个位置只能关注更早的位置。GPT 是 decoder-only。BERT 是 encoder-only。T5 是 encoder-decoder。

### Diffusion Model
扩散模型
- **What people say:** "AI that generates images from noise" --- **人们常说：** "从噪声生成图像的 AI"
- **What it actually means:** A model trained to reverse a gradual noising process — it learns to predict and remove noise, and at generation time starts from pure noise and iteratively denoises --- **它的实际含义：** 一种被训练来反转逐步加噪过程的模型——它学习预测并去除噪声，而在生成时则从纯噪声开始，迭代地进行去噪

### DPO (Direct Preference Optimization)
DPO（直接偏好优化）
- **What people say:** "A simpler RLHF" --- **人们会说：** "一个更简单的 RLHF"
- **What it actually means:** A training method that skips the reward model entirely — it directly optimizes the language model to prefer the better response in pairs of human preferences --- **它实际上的意思：** 一种完全跳过奖励模型的训练方法——它直接优化语言模型，使其在人类偏好成对比较中更偏向较好的回答

### Dropout
Dropout
- **What people say:** "Randomly turning off neurons" --- **人们会说：** "随机关闭神经元"
- **What it actually means:** During training, randomly set a fraction of activations to zero. Forces the network to not rely on any single neuron. Turned off during inference. Simple but effective regularization. --- **它实际上的意思：** 在训练期间，随机将一部分激活值设为零。迫使网络不要依赖任何单个神经元。推理期间会关闭。简单但有效的正则化。

## E
E

### Eigenvalue
特征值
- **What people say:** "Some math thing for PCA" --- **人们会说：** "PCA 里的某种数学东西"
- **What it actually means:** For a matrix A, an eigenvalue lambda satisfies Av = lambda*v for some vector v. It tells you how much the matrix scales vectors in that direction. Large eigenvalues = directions of high variance in your data. --- **它实际上的意思：** 对于矩阵 A，某个特征值 lambda 满足：对某个向量 v，有 Av = lambda*v。它告诉你矩阵在该方向上会把向量缩放多少。较大的特征值 = 数据中高方差的方向。

### Embedding
嵌入
- **What people say:** "Some AI magic that turns words into numbers" --- **人们会说：** "某种把词变成数字的 AI 魔法"
- **What it actually means:** A learned mapping from discrete items (words, images, users) to dense vectors in continuous space, where similar items end up close together --- **它实际上的意思：** 一种将离散项（词、图像、用户）映射到连续空间中稠密向量的学习式映射，相似的项会彼此靠近
- **Why it's called that:** The items are "embedded" in a geometric space where distance has meaning --- **为什么这么叫：** 这些项被“嵌入”到一个几何空间中，在那里距离具有意义

### Encoder
编码器
- **What people say:** "The input part" --- **人们会说：** "输入部分"
- **What it actually means:** In transformers, an encoder uses bidirectional self-attention so each position can attend to all positions. BERT is encoder-only. Good for understanding tasks (classification, NER) but not generation. --- **它实际上的意思：** 在 transformers 中，编码器使用双向自注意力，因此每个位置都可以关注所有位置。BERT 是纯编码器模型。适合理解类任务（分类、NER），但不适合生成。

### Epoch
轮次
- **What people say:** "One pass through the data" --- **人们会说：** "把数据完整过一遍"
- **What it actually means:** Exactly that. One complete pass through every example in the training set. Multiple epochs = seeing the data multiple times. More epochs can improve learning but risks overfitting. --- **它实际上的意思：** 就是这个意思。对训练集中每个样本完整遍历一次。多个 epoch = 多次看到同一份数据。更多的 epoch 可以提升学习效果，但也有过拟合风险。

## F
F

### Feature
特征
- **What people say:** "A column in your data" --- **人们会说：** "你数据中的一列"
- **What it actually means:** An individual measurable property of the data. In classical ML, you engineer features by hand. In deep learning, the network learns features automatically from raw data. --- **它实际上的意思：** 数据中一个可测量的单独属性。在经典 ML 中，特征是手工设计的。在深度学习中，网络会从原始数据中自动学习特征。

### Few-Shot
少样本
- **What people say:** "Give the AI some examples first" --- **人们会说：** "先给 AI 一些示例"
- **What it actually means:** Including a small number of input-output examples in the prompt before asking the model to perform a task. Typically 3-5 examples. The model pattern-matches on these examples to understand the desired format and behavior. Contrast with zero-shot (no examples) and fine-tuning (thousands of examples baked into weights). --- **它实际上意味着：** 在让模型执行任务之前，先在提示词中包含少量输入-输出示例。通常是 3-5 个示例。模型会对这些示例进行模式匹配，以理解期望的格式和行为。与 zero-shot（没有示例）和 fine-tuning（将数千个示例固化到权重中）形成对比。

### Fine-tuning
微调
- **What people say:** "Training the AI on your data" --- **人们会说：** "在你的数据上训练 AI"
- **What it actually means:** Starting with a pre-trained model's weights and continuing training on a smaller, task-specific dataset. Only updates existing weights, doesn't add new knowledge from scratch --- **它实际上意味着：** 从预训练模型的权重开始，并在一个更小、针对特定任务的数据集上继续训练。它只会更新现有权重，不会从零开始添加新知识

### Function Calling
函数调用
- **What people say:** "AI that can use tools" --- **人们会说：** "会使用工具的 AI"
- **What it actually means:** A structured way for LLMs to request execution of external functions. You define tools with JSON Schema descriptions, the model outputs a structured JSON object specifying which function to call with what arguments, your code executes it, and the result goes back to the model. Not the same as agents -- function calling is the mechanism, agents are the loop. --- **它实际上意味着：** 一种让 LLM 请求执行外部函数的结构化方式。你用 JSON Schema 描述来定义工具，模型会输出一个结构化的 JSON 对象，指定要调用哪个函数以及使用什么参数，你的代码执行它，然后结果再返回给模型。这和 agents 不一样——function calling 是机制，agents 是循环。

## G
G

### Guardrails
护栏
- **What people say:** "Safety filters for AI" --- **人们会说：** "AI 的安全过滤器"
- **What it actually means:** Input/output validation layers around an LLM that detect and block harmful content, prompt injection attempts, PII leakage, or off-topic responses. Typically a pipeline: input filter -> LLM -> output filter. Can be rule-based (regex, keyword lists) or model-based (classifier that scores safety). --- **它实际上意味着：** 位于 LLM 周围的输入/输出验证层，用于检测并阻止有害内容、提示词注入尝试、PII 泄露或离题回复。通常是一个流水线：输入过滤器 -> LLM -> 输出过滤器。可以是基于规则的（regex、关键词列表），也可以是基于模型的（对安全性进行评分的分类器）。

### GPT
GPT
- **What people say:** "ChatGPT" or "The AI" --- **人们会说：** "ChatGPT" 或 "那个 AI"
- **What it actually means:** Generative Pre-trained Transformer — a specific architecture that predicts the next token using a decoder-only transformer trained on large text corpora --- **它实际上意味着：** Generative Pre-trained Transformer——一种特定架构，使用在大型文本语料上训练的仅解码器 transformer 来预测下一个 token
- **Why it's called that:** Generative (produces text), Pre-trained (trained once on large data, then adapted), Transformer (the architecture) --- **为什么叫这个名字：** Generative（生成文本）、Pre-trained（先在大规模数据上训练一次，然后再适配）、Transformer（这种架构）

### GAN (Generative Adversarial Network)
GAN（生成对抗网络）
- **What people say:** "Two AIs fighting each other" --- **人们会说：** "两个 AI 互相对抗"
- **What it actually means:** A generator network tries to create realistic data while a discriminator network tries to tell real from fake. They train together: the generator gets better at fooling the discriminator, and the discriminator gets better at detecting fakes. --- **它实际上意味着：** 生成器网络试图创建逼真的数据，而判别器网络试图分辨真实与伪造。它们一起训练：生成器越来越擅长欺骗判别器，判别器也越来越擅长检测伪造。

### Gradient
梯度
- **What people say:** "The slope" --- **人们会说：** "斜率"
- **What it actually means:** A vector of partial derivatives pointing in the direction of steepest increase. In ML, you go opposite to the gradient (gradient descent) to minimize the loss. --- **它实际上意味着：** 一个由偏导数组成的向量，指向增长最快的方向。在 ML 中，你会沿着梯度的相反方向（gradient descent）前进，以最小化损失。

### Gradient Descent
梯度下降
- **What people say:** "How AI improves" --- **人们会说：** "AI 如何改进"
- **What it actually means:** An optimization algorithm that adjusts parameters in the direction that reduces the loss function most steeply, like walking downhill in a high-dimensional landscape --- **它的实际含义：** 一种优化算法，沿着使损失函数下降最陡的方向调整参数，就像在高维地形中下山

## H
H

### Hyperparameter
超参数
- **What people say:** "Settings you tune" --- **人们会说：** "你要调的设置"
- **What it actually means:** Values set before training that control the training process itself: learning rate, batch size, number of layers, dropout rate. Unlike model parameters (weights), these aren't learned from data. --- **它的实际含义：** 在训练开始前设定、用于控制训练过程本身的值：学习率、批大小、层数、dropout 率。与模型参数（权重）不同，这些不是从数据中学出来的。

### Hallucination
幻觉
- **What people say:** "The AI is lying" or "making things up" --- **人们会说：** "AI 在撒谎" 或 "胡编乱造"
- **What it actually means:** The model generates plausible-sounding text that isn't grounded in its training data or the given context — it's pattern-completing, not fact-retrieving --- **它的实际含义：** 模型生成了听起来合理、但并不基于其训练数据或给定上下文的文本——它是在补全模式，而不是检索事实

## I
I

### Inference
推理
- **What people say:** "Running the AI" --- **人们会说：** "运行 AI"
- **What it actually means:** Using a trained model to make predictions on new data. No weight updates happen. This is what you do in production: send input, get output. --- **它的实际含义：** 使用训练好的模型对新数据进行预测。不会发生权重更新。这就是你在生产环境中做的事：发送输入，得到输出。

### Inductive Bias
归纳偏置
- **What people say:** Never heard of it --- **人们会说：** 从没听说过
- **What it actually means:** The assumptions built into a model's architecture. CNNs assume local patterns matter (convolution). RNNs assume order matters (sequential processing). Transformers assume everything might relate to everything (attention). The right bias helps the model learn faster from less data. --- **它的实际含义：** 内置在模型架构中的假设。CNNs 假设局部模式很重要（卷积）。RNNs 假设顺序很重要（序列处理）。Transformers 假设任何东西都可能与任何东西相关（注意力）。合适的偏置能帮助模型用更少的数据更快学习。

### JAX
JAX
- **What people say:** "Google's ML framework" --- **人们会说：** "Google 的 ML 框架"
- **What it actually means:** A NumPy-compatible library that adds automatic differentiation (grad), JIT compilation (jit), automatic vectorization (vmap), and multi-device parallelism (pmap). Unlike PyTorch's object-oriented style, JAX is purely functional -- no hidden state, no in-place mutation. Used by Google DeepMind for AlphaFold, Gemini, and large-scale research. --- **它的实际含义：** 一个与 NumPy 兼容的库，增加了自动微分（`grad`）、JIT 编译（`jit`）、自动向量化（`vmap`）和多设备并行（`pmap`）。不同于 PyTorch 的面向对象风格，JAX 是纯函数式的——没有隐藏状态，没有原地修改。Google DeepMind 用它来做 AlphaFold、Gemini 和大规模研究。

## K
K

### KV Cache
KV 缓存
- **What people say:** "Makes inference faster" --- **人们会说：** "让推理更快"
- **What it actually means:** During autoregressive generation, caching the key and value matrices from previous tokens so you don't recompute them at each step. Trades memory for speed. Essential for fast LLM inference. --- **它的实际含义：** 在自回归生成过程中，缓存先前 token 的 key 和 value 矩阵，这样就不必在每一步重新计算它们。用内存换速度。对快速 LLM 推理至关重要。

## L
L

### Latent Space
潜在空间
- **What people say:** "The hidden representation" --- **人们常说：**“隐藏表示”
- **What it actually means:** A compressed, learned representation space where similar inputs map to nearby points. Autoencoders, VAEs, and diffusion models all work in latent space. It's lower-dimensional than the input but captures the important structure. --- **它的实际含义：**一种压缩的、学习得到的表示空间，在这个空间中，相似的输入会映射到彼此接近的点。Autoencoders、VAEs 和 diffusion models 都在 latent space 中工作。它的维度低于输入，但能捕捉重要结构。

### Learning Rate
学习率
- **What people say:** "How fast the AI learns" --- **人们常说：**“AI 学得有多快”
- **What it actually means:** A scalar that controls step size during gradient descent. Too high: overshoots the minimum and diverges. Too low: converges too slowly or gets stuck. The single most important hyperparameter. --- **它的实际含义：**一个在梯度下降过程中控制步长的标量。太高：会越过最小值并发散。太低：收敛太慢或卡住。它是最重要的超参数。

### LLM (Large Language Model)
LLM（Large Language Model）
- **What people say:** "AI" or "the brain" --- **人们常说：**“AI”或“the brain”
- **What it actually means:** A transformer-based neural network trained to predict the next token in a sequence, with billions of parameters, trained on internet-scale text data --- **它的实际含义：**一种基于 transformer 的神经网络，经过训练来预测序列中的下一个 token，拥有数十亿参数，并在互联网规模的文本数据上训练

### LoRA (Low-Rank Adaptation)
LoRA（Low-Rank Adaptation）
- **What people say:** "Efficient fine-tuning" --- **人们常说：**“高效微调”
- **What it actually means:** Instead of updating all weights, insert small low-rank matrices alongside the original weights. Only these small matrices are trained, reducing memory by 10-100x --- **它的实际含义：**不更新全部权重，而是在原始权重旁插入小型低秩矩阵。只训练这些小矩阵，从而将内存占用降低 10-100 倍

### Loss Function
损失函数
- **What people say:** "How wrong the AI is" --- **人们常说：**“AI 错得有多离谱”
- **What it actually means:** A function that measures the gap between predicted and actual output. Training minimizes this function. MSE for regression, cross-entropy for classification, contrastive loss for embeddings. The choice of loss function defines what "good" means to the model. --- **它的实际含义：**一种衡量预测输出与实际输出之间差距的函数。训练的目标就是最小化这个函数。回归用 MSE，分类用 cross-entropy，embeddings 用 contrastive loss。损失函数的选择定义了对模型来说什么是“好”。

## M
M

### Mixed Precision
混合精度
- **What people say:** "Training trick for speed" --- **人们常说：**“用于提速的训练技巧”
- **What it actually means:** Using float16 for forward pass and most operations (faster, less memory) but keeping float32 for gradient accumulation and weight updates (more precise). Gets 2x speedup with negligible accuracy loss. --- **它的实际含义：**前向传播和大多数运算使用 float16（更快、更省内存），但梯度累积和权重更新保留 float32（更精确）。可获得 2 倍速度提升，而精度损失可以忽略不计。

### MoE (Mixture of Experts)
MoE（Mixture of Experts）
- **What people say:** "Only part of the model runs" --- **人们常说：**“只有模型的一部分会运行”
- **What it actually means:** A model with many "expert" subnetworks where a routing mechanism sends each input to only a few experts. The full model is huge but each forward pass is cheap because most experts are skipped. Mixtral and GPT-4 use this. --- **它的实际含义：**一种包含许多“专家”子网络的模型，其中路由机制只会将每个输入发送给少数几个专家。完整模型非常庞大，但每次前向传播的成本很低，因为大多数专家都会被跳过。Mixtral 和 GPT-4 都使用这种方式。

### MCP (Model Context Protocol)
MCP（Model Context Protocol）
- **What people say:** "A way for AI to use tools" --- **人们常说：**“一种让 AI 使用工具的方法”
- **What it actually means:** An open protocol (JSON-RPC over stdio/HTTP) that standardizes how AI applications connect to external data sources and tools, with typed schemas for tools, resources, and prompts --- **它的实际含义：**一种开放协议（基于 stdio/HTTP 的 JSON-RPC），用于标准化 AI 应用如何连接外部数据源和工具，并为工具、资源和 prompts 提供类型化 schema

## N
N

### NaN (Not a Number)
NaN（不是数字）
- **What people say:** "Training crashed" --- **人们常说：** "训练崩了"
- **What it actually means:** A floating-point value indicating undefined results (0/0, inf-inf). In training, NaN loss usually means: learning rate too high, exploding gradients, log of zero, or division by zero. Always the first thing to check when training fails. --- **它的实际意思是：** 一种表示未定义结果（0/0、inf-inf）的浮点值。在训练中，loss 出现 NaN 通常意味着：学习率过高、梯度爆炸、对零取对数，或除以零。训练失败时，这通常是第一个要检查的问题。

### Normalization
归一化
- **What people say:** "Scaling the data" --- **人们常说：** "缩放数据"
- **What it actually means:** Adjusting values to a standard range. Batch normalization normalizes across a batch. Layer normalization normalizes across features. Both stabilize training and allow higher learning rates. --- **它的实际意思是：** 将数值调整到一个标准范围。批归一化会在一个批次上做归一化。层归一化会在特征维度上做归一化。两者都能稳定训练，并允许使用更高的学习率。

## O
O

### Overfitting
过拟合
- **What people say:** "The model memorized the data" --- **人们常说：** "模型把数据背下来了"
- **What it actually means:** The model performs well on training data but poorly on unseen data. It learned the noise, not the signal. Fix with: more data, regularization (dropout, weight decay), early stopping, data augmentation, simpler model. --- **它的实际意思是：** 模型在训练数据上表现很好，但在未见过的数据上表现很差。它学到的是噪声，而不是信号。解决方法包括：更多数据、正则化（dropout、weight decay）、早停、数据增强、更简单的模型。

### Optimizer
优化器
- **What people say:** "The thing that updates weights" --- **人们常说：** "更新权重的那个东西"
- **What it actually means:** An algorithm that uses gradients to update model parameters. SGD is the simplest. Adam is the most common. Each optimizer has different properties: convergence speed, memory usage, sensitivity to hyperparameters. --- **它的实际意思是：** 一种利用梯度更新模型参数的算法。SGD 最简单。Adam 最常见。不同优化器有不同特性：收敛速度、内存使用、对超参数的敏感性。

## P
P

### Parameter
参数
- **What people say:** "Model size" --- **人们常说：** "模型大小"
- **What it actually means:** A learnable value in the model, typically a weight or bias. "7B parameters" means 7 billion learnable numbers. Each float32 parameter takes 4 bytes, so 7B parameters = 28GB of memory just for the weights. --- **它的实际意思是：** 模型中的一个可学习数值，通常是权重或偏置。"7B parameters" 表示 70 亿个可学习数字。每个 float32 参数占 4 字节，因此 7B parameters 仅权重就需要 28GB 内存。

### Perplexity
困惑度
- **What people say:** "How confused the model is" --- **人们常说：** "模型有多困惑"
- **What it actually means:** The exponential of the average cross-entropy loss. Lower is better. A perplexity of 10 means the model is as uncertain as if it were choosing uniformly among 10 tokens at each step. --- **它的实际意思是：** 平均交叉熵损失的指数形式。越低越好。困惑度为 10 表示，模型的不确定程度相当于它在每一步都在 10 个 token 中均匀随机选择一个。

### Precision & Recall
精确率与召回率
- **What people say:** "Accuracy metrics" --- **人们常说：** "准确性指标"
- **What it actually means:** Precision = of items you flagged, how many were correct. Recall = of all correct items, how many did you find. They trade off: catching every spam email (high recall) means more false alarms (low precision). F1 score is their harmonic mean. Use precision when false positives are costly, recall when false negatives are costly. --- **它的实际意思是：** Precision = 在你标记出来的项目中，有多少是正确的。Recall = 在所有正确的项目中，你找到了多少。两者存在权衡：想抓住每一封垃圾邮件（高 recall）通常意味着更多误报（低 precision）。F1 score 是它们的调和平均数。误报代价高时用 precision，漏报代价高时用 recall。

### Prompt Engineering
提示工程
- **What people say:** "Talking to AI the right way" --- **人们常说：** "以正确的方式与 AI 对话"
- **What it actually means:** Designing the input text to reliably produce desired outputs -- including system prompts, few-shot examples, format instructions, and chain-of-thought triggers --- **它实际的意思：** 设计输入文本，以可靠地产生期望的输出——包括系统提示词、少样本示例、格式指令和思维链触发器

### Prompt Injection
提示注入
- **What people say:** "Hacking the AI with words" --- **人们常说：** "用文字黑掉 AI"
- **What it actually means:** An attack where malicious text in the input overrides the system prompt or instructions. Direct injection: user types "Ignore previous instructions." Indirect injection: a retrieved document contains hidden instructions. The LLM equivalent of SQL injection. No complete solution exists -- defense is layers of input validation, output filtering, and privilege separation. --- **它实际的意思：** 一种攻击：输入中的恶意文本会覆盖系统提示词或指令。直接注入：用户输入“忽略之前的指令。”间接注入：检索到的文档包含隐藏指令。这相当于 LLM 版的 SQL 注入。不存在完整的解决方案——防御需要多层输入验证、输出过滤和权限隔离。

## Q
Q

### QLoRA
QLoRA
- **What people say:** "LoRA but cheaper" --- **人们常说：** "LoRA，但更便宜"
- **What it actually means:** Quantized LoRA. Keeps the frozen base model weights in 4-bit precision (NF4 format) while training LoRA adapters in 16-bit. Reduces memory by another 3-4x compared to standard LoRA. A 7B model that needs 14GB with LoRA fits in 4-6GB with QLoRA. Quality is within 1% of full fine-tuning on most benchmarks. --- **它实际的意思：** 量化 LoRA。将冻结的基础模型权重保留为 4-bit 精度（NF4 格式），同时以 16-bit 训练 LoRA 适配器。与标准 LoRA 相比，内存再减少 3-4 倍。一个使用 LoRA 需要 14GB 的 7B 模型，用 QLoRA 可装入 4-6GB。质量在大多数基准上与完整微调的差距在 1% 以内。

## R
R

### RAG (Retrieval-Augmented Generation)
RAG（检索增强生成）
- **What people say:** "AI that can search" --- **人们常说：** "会搜索的 AI"
- **What it actually means:** A pattern where you retrieve relevant documents from a knowledge base (using embedding similarity), stuff them into the prompt, and let the LLM answer based on that context --- **它实际的意思：** 一种模式：从知识库中检索相关文档（使用嵌入相似度），将它们放入提示词中，再让 LLM 基于这些上下文作答
- **Why it's called that:** Retrieval (find documents) + Augmented (add to prompt) + Generation (LLM writes the answer) --- **为什么叫这个名字：** 检索（找到文档）+ 增强（加入提示词）+ 生成（LLM 写出答案）

### RLHF (Reinforcement Learning from Human Feedback)
RLHF（基于人类反馈的强化学习）
- **What people say:** "How they make AI helpful" --- **人们常说：** "他们让 AI 变得有用的方式"
- **What it actually means:** A training pipeline: (1) collect human preferences on model outputs, (2) train a reward model on those preferences, (3) use PPO to optimize the LLM to produce higher-reward outputs --- **它实际的意思：** 一条训练流水线：(1) 收集人类对模型输出的偏好，(2) 在这些偏好上训练奖励模型，(3) 使用 PPO 优化 LLM，使其产生更高奖励的输出

### Quantization
量化
- **What people say:** "Making the model smaller" --- **人们常说：** "让模型变小"
- **What it actually means:** Reducing the precision of model weights from float32 (4 bytes) to int8 (1 byte) or int4 (0.5 bytes). Trades a small amount of accuracy for 4-8x less memory and faster inference. GPTQ, AWQ, and GGUF are common formats. --- **它实际的意思：** 将模型权重的精度从 float32（4 字节）降低到 int8（1 字节）或 int4（0.5 字节）。以少量精度损失换取 4-8 倍更低的内存占用和更快的推理速度。GPTQ、AWQ 和 GGUF 是常见格式。

### ReLU
ReLU
- **What people say:** "Activation function" --- **人们常说：** "激活函数"
- **What it actually means:** Rectified Linear Unit: f(x) = max(0, x). The simplest non-linear activation. Fast to compute, doesn't saturate for positive values. Used everywhere because it works and is cheap. Variants: LeakyReLU, GELU, SiLU. --- **它实际的意思：** 修正线性单元：f(x) = max(0, x)。最简单的非线性激活函数。计算速度快，对正值不会饱和。之所以被广泛使用，是因为它有效且成本低。变体：LeakyReLU、GELU、SiLU。

### ROUGE
ROUGE
- **What people say:** "Summarization metric" --- **人们常说：** "摘要指标"
- **What it actually means:** Recall-Oriented Understudy for Gisting Evaluation. Measures overlap between generated text and reference text. ROUGE-1 counts unigram matches, ROUGE-2 counts bigram matches, ROUGE-L finds the longest common subsequence. Cheap to compute but only measures surface similarity -- two sentences with the same meaning but different words score poorly. --- **它实际上指的是：** Recall-Oriented Understudy for Gisting Evaluation。衡量生成文本与参考文本之间的重叠。ROUGE-1 统计 unigram 匹配，ROUGE-2 统计 bigram 匹配，ROUGE-L 找出最长公共子序列。计算成本低，但只衡量表面相似性 -- 两个含义相同但用词不同的句子得分会很低。

## S
S

### Semantic Search
语义搜索
- **What people say:** "Smart search that understands meaning" --- **人们常说：** "理解含义的智能搜索"
- **What it actually means:** Finding documents by meaning rather than keyword matching. Embed the query and all documents into the same vector space, then return documents whose embeddings are closest to the query embedding. "payment failed" finds "transaction declined" even though they share no words. Powered by embedding models + vector databases. --- **它实际上指的是：** 按含义而不是关键词匹配来查找文档。将查询和所有文档嵌入到同一个向量空间中，然后返回嵌入与查询嵌入最接近的文档。"支付失败" 可以找到 "交易被拒绝"，即使它们没有共享任何词语。由嵌入模型 + 向量数据库驱动。

### Streaming
流式传输
- **What people say:** "Seeing the response appear word by word" --- **人们常说：** "看到回复一个词一个词地出现"
- **What it actually means:** The LLM sends tokens as they are generated rather than waiting for the complete response. Uses Server-Sent Events (SSE) or WebSocket protocols. Reduces perceived latency from seconds to milliseconds for the first token. Essential for production chat interfaces. Each chunk contains a delta (partial token or word). --- **它实际上指的是：** LLM 在生成 token 时就立即发送，而不是等完整回复生成完再发送。使用 Server-Sent Events (SSE) 或 WebSocket 协议。将首个 token 的感知延迟从几秒降低到几毫秒。对生产环境的聊天界面至关重要。每个块都包含一个 delta（部分 token 或单词）。

### Self-Attention
自注意力
- **What people say:** "How the model decides what to focus on" --- **人们常说：** "模型如何决定关注什么"
- **What it actually means:** Each token computes query, key, and value vectors. Attention weight between two tokens = dot product of their query and key, scaled and softmaxed. Output = weighted sum of value vectors. Lets every token see every other token. --- **它实际上指的是：** 每个 token 都会计算 query、key 和 value 向量。两个 token 之间的注意力权重 = 它们的 query 和 key 的点积，再经过缩放和 softmax。输出 = value 向量的加权和。它让每个 token 都能看到其他所有 token。

### SFT (Supervised Fine-Tuning)
SFT（监督微调）
- **What people say:** "Teaching the model to follow instructions" --- **人们常说：** "教模型遵循指令"
- **What it actually means:** Fine-tuning a pre-trained model on (instruction, response) pairs. The model learns to generate the response given the instruction. This is what turns a base model into a chat model. --- **它实际上指的是：** 在（指令，回复）对上对预训练模型进行微调。模型学会根据指令生成回复。这就是把基础模型变成聊天模型的过程。

### Softmax
Softmax
- **What people say:** "Turns numbers into probabilities" --- **人们常说：** "把数字变成概率"
- **What it actually means:** softmax(x_i) = exp(x_i) / sum(exp(x_j)). Transforms a vector of arbitrary real numbers into a probability distribution (all positive, sums to 1). Used in classification heads, attention weights, and anywhere you need probabilities. --- **它实际上指的是：** softmax(x_i) = exp(x_i) / sum(exp(x_j))。将任意实数组成的向量转换为概率分布（全部为正，且总和为 1）。用于分类头、注意力权重，以及任何需要概率的地方。

### Swarm
群体
- **What people say:** "A bunch of AI agents working together like bees" --- **人们常说：** "一群 AI agents 像蜜蜂一样协同工作"
- **What it actually means:** Multiple agents sharing state and coordinating through message passing, with emergent behavior arising from simple individual rules rather than central control --- **它实际上指的是：** 多个 agents 共享状态并通过消息传递进行协调，涌现行为来自简单的个体规则而不是中心化控制

## T
T

### System Prompt
系统提示词
- **What people say:** "The AI's instructions" --- **人们常说：** "AI 的指令"
- **What it actually means:** A special message at the start of a conversation that sets the model's behavior, persona, and constraints. Processed before user messages. Not visible to the user in most UIs. Defines what the model should and shouldn't do, its tone, format preferences, and domain focus. Different from user prompts -- system prompts are set by the developer. --- **它实际上的意思是：** 在对话开始时的一条特殊消息，用于设定模型的行为、人设和约束。在用户消息之前处理。在大多数 UI 中对用户不可见。它定义了模型应该做什么和不应该做什么、它的语气、格式偏好以及领域侧重点。它不同于用户提示词 -- 系统提示词由开发者设置。

### Tensor
张量
- **What people say:** "A multi-dimensional array" --- **人们常说：** "多维数组"
- **What it actually means:** The fundamental data structure in deep learning frameworks. A 0D tensor is a scalar, 1D is a vector, 2D is a matrix, 3D+ is a tensor. In PyTorch and JAX, tensors track their computation history for automatic differentiation and can live on CPU or GPU. All neural network inputs, outputs, weights, and gradients are tensors. --- **它实际上的意思是：** 深度学习框架中的基础数据结构。0D 张量是标量，1D 是向量，2D 是矩阵，3D+ 则是张量。在 PyTorch 和 JAX 中，张量会跟踪其计算历史以进行自动微分，并且可以位于 CPU 或 GPU 上。所有神经网络的输入、输出、权重和梯度都是张量。

### Token
词元
- **What people say:** "A word" --- **人们常说：** "一个词"
- **What it actually means:** A subword unit (typically 3-4 characters in English) produced by a tokenizer like BPE. "unbelievable" might be 3 tokens: "un" + "believ" + "able" --- **它实际上的意思是：** 由像 BPE 这样的分词器生成的子词单元（在英语中通常为 3-4 个字符）。"unbelievable" 可能会被分成 3 个词元："un" + "believ" + "able"

### Temperature
温度
- **What people say:** "Creativity setting" --- **人们常说：** "创造力设置"
- **What it actually means:** A scalar that divides logits before softmax. Temperature=1 is default. Higher = flatter distribution = more random outputs. Lower = sharper distribution = more deterministic. Temperature=0 is argmax (always pick the most likely token). --- **它实际上的意思是：** 在 softmax 之前用于除 logits 的一个标量。Temperature=1 是默认值。更高 = 分布更平坦 = 输出更随机。更低 = 分布更尖锐 = 输出更确定。Temperature=0 时为 argmax（总是选择最可能的 token）。

### Transfer Learning
迁移学习
- **What people say:** "Using a pre-trained model" --- **人们常说：** "使用预训练模型"
- **What it actually means:** Taking a model trained on one task and adapting it to a different task. The early layers learn general features (edges, syntax patterns) that transfer. Only the later layers need task-specific training. This is why you can fine-tune BERT for any NLP task. --- **它实际上的意思是：** 将一个在某项任务上训练好的模型适配到另一项任务。前面的层会学习可迁移的通用特征（边缘、语法模式）。只有后面的层需要针对具体任务进行训练。这就是为什么你可以为任何 NLP 任务微调 BERT。

### Transformer
Transformer
- **What people say:** "The architecture behind modern AI" --- **人们常说：** "现代 AI 背后的架构"
- **What it actually means:** A neural network architecture that processes sequences using self-attention (letting every position attend to every other position) instead of recurrence, enabling massive parallelization --- **它实际上的意思是：** 一种使用 self-attention（让每个位置都能关注其他所有位置）而不是循环来处理序列的神经网络架构，从而实现大规模并行化
- **Why it's called that:** It transforms input representations into output representations through attention layers --- **为什么叫这个名字：** 它通过 attention 层将输入表示转换为输出表示

## U
U

### Underfitting
欠拟合
- **What people say:** "The model isn't learning" --- **人们常说：** "模型没有学到东西"
- **What it actually means:** The model is too simple to capture the patterns in the data. Training loss stays high. Fix with: more parameters, more layers, longer training, lower regularization, better features. --- **它实际上的意思是：** 模型过于简单，无法捕捉数据中的模式。训练损失保持较高。可通过以下方式修复：更多参数、更多层、更长训练时间、更低正则化、更好的特征。

## V
V

### VAE (Variational Autoencoder)
VAE（变分自编码器）
- **What people say:** "A generative model" --- **人们常说：** "一种生成模型"
- **What it actually means:** An autoencoder that learns a smooth latent space by forcing the encoder output to follow a Gaussian distribution. You can sample from this distribution and decode to generate new data. The reparameterization trick makes it trainable via backpropagation. --- **它实际上的意思是：** 一种自编码器，它通过强制编码器输出服从高斯分布来学习一个平滑的潜在空间。你可以从这个分布中采样并进行解码，以生成新数据。重参数化技巧使它能够通过反向传播进行训练。

### Vector Database
向量数据库
- **What people say:** "A special database for AI" --- **人们常说：** "一种专门用于 AI 的特殊数据库"
- **What it actually means:** A database optimized for storing vectors (dense arrays of floats) and performing fast approximate nearest-neighbor search. The core operation in similarity search, RAG, and recommendation systems. --- **它实际上的意思是：** 一种针对存储向量（由浮点数组成的稠密数组）并执行快速近似最近邻搜索而优化的数据库。它支撑了相似性搜索、RAG 和推荐系统中的核心操作。

## W
W

### Weight
权重
- **What people say:** "What the model learned" --- **人们常说：** "模型学到的东西"
- **What it actually means:** A single number in a model's parameter matrix. A linear layer with input size 768 and output size 3072 has 768*3072 = 2,359,296 weights. Training adjusts each weight to minimize the loss function. --- **它实际上的意思是：** 模型参数矩阵中的一个数字。一个输入大小为 768、输出大小为 3072 的线性层有 768*3072 = 2,359,296 个权重。训练会调整每个权重，以最小化损失函数。

### Weight Decay
权重衰减
- **What people say:** "Regularization" --- **人们常说：** "正则化"
- **What it actually means:** Adding a penalty proportional to the magnitude of weights to the loss function. Equivalent to L2 regularization. Prevents weights from growing too large. Typical value: 0.01-0.1. --- **它实际上的意思是：** 在损失函数中加入一个与权重大小成正比的惩罚项。等价于 L2 正则化。它可以防止权重增长得过大。典型取值：0.01-0.1。

## Z
Z

### Zero-Shot
零样本
- **What people say:** "No training needed" --- **人们常说：** "不需要训练"
- **What it actually means:** Using a model on a task it wasn't explicitly trained for, with no task-specific examples in the prompt. The model generalizes from pre-training. Works because large models have seen enough variety to handle new task formats. --- **它实际上的意思是：** 在一个任务上使用模型，而这个任务并不是它被明确训练来处理的，并且提示中没有任何任务特定示例。模型会从预训练中进行泛化。之所以可行，是因为大型模型见过足够多样的内容，能够处理新的任务格式。
