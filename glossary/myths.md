# AI Myths Busted
AI 神话破除

Common misconceptions about AI, ML, and deep learning. Each one explained with what's actually going on.
关于 AI、ML 和深度学习的常见误解。逐条解释实际情况。

---
---

## "AI understands language"
"AI 理解语言"

**Reality:** LLMs predict the next token based on statistical patterns in training data. They have no understanding, no beliefs, no world model (that we can prove). They're very good at pattern matching across billions of examples. The output looks like understanding because the patterns are rich enough to cover most situations.
**现实：** LLMs 基于训练数据中的统计模式预测下一个 token。它们没有理解、没有信念，也没有（我们能够证明的）世界模型。它们非常擅长在数十亿个样本中进行模式匹配。输出看起来像是理解，是因为这些模式足够丰富，能够覆盖大多数情况。

**Why it matters:** If you treat an LLM as a reasoning engine, you'll be surprised when it confidently says wrong things. If you treat it as a pattern matcher, you'll design better systems around it.
**为什么重要：** 如果你把 LLM 当作推理引擎，当它自信地说错话时你就会感到意外。如果你把它当作模式匹配器，你就会围绕它设计出更好的系统。

---
---

## "More parameters = smarter model"
"参数越多 = 模型越聪明"

**Reality:** A 7B parameter model trained on high-quality data with good techniques can outperform a 70B model trained on garbage. Chinchilla showed that most models were over-parameterized and under-trained. The quality and quantity of training data matters as much as model size. Phi-2 (2.7B) beat models 10x its size on many benchmarks.
**现实：** 一个用高质量数据并采用良好技术训练的 7B 参数模型，可能会胜过一个用垃圾数据训练的 70B 模型。Chinchilla 表明，大多数模型都是参数过多而训练不足。训练数据的质量和数量与模型大小同样重要。Phi-2（2.7B）在许多基准测试中击败了体量是它 10 倍的模型。

**Why it matters:** Don't default to the biggest model. Match model size to your task and budget.
**为什么重要：** 不要默认选择最大的模型。让模型规模匹配你的任务和预算。

---
---

## "Neural networks are black boxes"
"神经网络是黑箱"

**Reality:** We have tools to understand what neural networks learn. Attention visualization shows what tokens the model focuses on. Probing classifiers reveal what information is stored in hidden representations. Mechanistic interpretability is finding actual circuits (induction heads, feature detectors). It's not complete transparency, but it's not a black box either.
**现实：** 我们有工具来理解神经网络学到了什么。注意力可视化可以展示模型关注哪些 token。探针分类器揭示隐藏表示中存储了哪些信息。机制可解释性正在寻找真实的电路（induction heads、feature detectors）。这还不是完全透明，但也不完全是黑箱。

**Why it matters:** You can debug neural networks. Gradient analysis, activation visualization, and attention maps are real tools covered in this course.
**为什么重要：** 你可以调试神经网络。梯度分析、激活可视化和注意力图都是真实存在的工具，本课程会讲到。

---
---

## "AI will replace programmers"
"AI 会取代程序员"

**Reality:** AI changed programming, it didn't replace it. AI writes boilerplate. Humans design systems, make architectural decisions, review correctness, and handle the cases AI gets wrong. The role shifted from "write every line" to "review, direct, and architect." The best engineers use AI as a tool, not fear it as a replacement.
**现实：** AI 改变了编程，但没有取代编程。AI 会写样板代码。人类负责设计系统、做架构决策、审查正确性，并处理 AI 会出错的情况。这个角色已经从 "写每一行代码" 转变为 "审查、指导和做架构设计"。最优秀的工程师把 AI 当作工具使用，而不是把它当成替代者去害怕。

**Why it matters:** You're learning AI engineering, which is programming + AI. Both skills together are more valuable than either alone.
**为什么重要：** 你正在学习 AI 工程，也就是编程 + AI。两种技能结合起来比任何一种单独存在都更有价值。

---
---

## "You need a PhD in math to do AI"
"做 AI 需要数学博士学位"

**Reality:** You need high school math plus the specific topics in Phase 1 of this course. Linear algebra, calculus, probability, and optimization. You don't need proofs. You need intuition for what operations do and why they matter. If you can multiply matrices and take derivatives, you can build neural networks.
**现实：** 你需要的是高中数学，再加上本课程 Phase 1 中的特定主题：线性代数、微积分、概率和优化。你不需要证明。你需要的是对这些运算在做什么、以及它们为什么重要的直觉。如果你会做矩阵乘法和求导，你就能构建神经网络。

**Why it matters:** Phase 1 exists to give you exactly the math you need, nothing more.
**为什么重要：** Phase 1 的存在，就是为了给你恰好需要的数学，不多也不少。

---
---

## "GPT stands for General Purpose Technology"
"GPT 的意思是 General Purpose Technology"

**Reality:** GPT stands for Generative Pre-trained Transformer. Generative = it produces text. Pre-trained = trained once on a large corpus before being adapted. Transformer = the architecture from the 2017 "Attention Is All You Need" paper.
**现实：** GPT 代表 Generative Pre-trained Transformer。Generative = 它生成文本。Pre-trained = 在适配之前，先在大型语料库上训练一次。Transformer = 来自 2017 年论文 "Attention Is All You Need" 的架构。

---
---

## "Temperature makes the AI more creative"
"Temperature 会让 AI 更有创造力"

**Reality:** Temperature scales the logits before softmax. Higher temperature = flatter probability distribution = more random token selection. Lower temperature = sharper distribution = more deterministic. It's not creativity, it's randomness. A high-temperature model doesn't think harder, it just considers less likely tokens.
**现实：** Temperature 会在 softmax 之前缩放 logits。更高的 temperature = 更平坦的概率分布 = 更随机的 token 选择。更低的 temperature = 更尖锐的分布 = 更确定的结果。这不是创造力，而是随机性。高 temperature 的模型并不会想得更深入，它只是会考虑更不可能的 token。

**Why it matters:** When your output is too repetitive, raise temperature. When it's too chaotic, lower it. It's a randomness knob, nothing more.
**这为什么重要：** 当输出太重复时，提高 temperature。当输出太混乱时，降低它。它只是一个控制随机性的旋钮，仅此而已。

---
---

## "Fine-tuning teaches the model new knowledge"
"Fine-tuning 会教给模型新知识"

**Reality:** Fine-tuning adjusts how the model uses existing knowledge, not what it knows. If information wasn't in the pre-training data, fine-tuning won't reliably add it. Fine-tuning is better for changing behavior (style, format, tone, task-specific patterns) than for adding facts. For new knowledge, use RAG.
**现实：** Fine-tuning 调整的是模型如何使用已有知识，而不是它知道什么。如果某条信息不在预训练数据里，Fine-tuning 也无法可靠地把它加进去。Fine-tuning 更适合改变行为（风格、格式、语气、任务特定模式），而不是添加事实。要引入新知识，请使用 RAG。

**Why it matters:** If you need the model to know about your company's internal docs, use RAG. If you need it to respond in a specific format, fine-tune.
**这为什么重要：** 如果你需要模型了解你公司内部文档的内容，请使用 RAG。如果你需要它按特定格式回复，就做 Fine-tuning。

---
---

## "Bigger context window = better"
"更大的 context window = 更好"

**Reality:** Models degrade on long contexts. The "lost in the middle" problem means models pay more attention to the beginning and end of long prompts and less to the middle. A 200K context window doesn't mean the model uses all 200K tokens equally well. Also, longer contexts cost more and are slower.
**现实：** 模型在长上下文中的表现会下降。"lost in the middle" 问题意味着，模型会更多关注长提示的开头和结尾，而较少关注中间部分。200K 的 context window 并不意味着模型能同样好地利用全部 200K token。另外，更长的上下文更贵也更慢。

**Why it matters:** Don't dump everything into the context. Be selective. RAG with targeted retrieval beats stuffing the full document in.
**这为什么重要：** 不要把所有东西都塞进上下文。要有选择。使用定向检索的 RAG，胜过把整份文档硬塞进去。

---
---

## "AI agents are autonomous"
"AI agents 是自主的"

**Reality:** Current AI agents run in a loop: think, act, observe, repeat. They follow the pattern the harness defines. They don't have goals, plans, or self-awareness. They're reactive systems that use LLMs to decide what tool to call next. The "autonomy" comes from the loop, not from the AI.
**现实：** 当前的 AI agents 在一个循环中运行：思考、行动、观察、重复。它们遵循的是 harness 所定义的模式。它们没有目标、计划或自我意识。它们是反应式系统，使用 LLM 来决定下一步调用哪个工具。所谓的 "autonomy" 来自这个循环，而不是来自 AI 本身。

**Why it matters:** When building agents, you're building the loop, the tools, and the guardrails. The LLM is just the decision-making component inside your system.
**这为什么重要：** 构建 agents 时，你构建的是循环、工具和护栏。LLM 只是你系统里的决策组件。

---
---

## "Transformers understand order because of positional encoding"
"Transformers 之所以理解顺序，是因为 positional encoding"

**Reality:** Transformers have no inherent sense of order. Self-attention treats input as a set, not a sequence. Positional encoding is a hack to inject order information by adding position-dependent vectors to the input. Different methods (sinusoidal, learned, RoPE, ALiBi) handle this differently. None of them truly give the model sequential understanding the way RNNs had it.
**现实：** Transformers 并没有内在的顺序感。Self-attention 把输入当作一个集合，而不是序列。Positional encoding 是一种注入顺序信息的权宜之计：通过把依赖位置的向量加到输入上来实现。不同方法（sinusoidal、learned、RoPE、ALiBi）对此的处理方式不同。它们都不能真正赋予模型像 RNN 那样的序列理解能力。

**Why it matters:** This is why positional encoding research is still active. It's a solved-enough problem for most uses, but it's fundamentally a workaround.
**这为什么重要：** 这就是为什么 positional encoding 研究仍然很活跃。对大多数用途来说，这个问题已经“足够解决”了，但从根本上说，它仍然是一种变通方案。

---
---

## "Pre-training is just reading the internet"
"Pre-training 只是读互联网"

**Reality:** Pre-training is next-token prediction on a massive corpus. The model learns to predict what comes next given what came before. Through this simple objective, it learns grammar, facts, reasoning patterns, code structure, and more. But it also learns internet nonsense, biases, and incorrect information. The data curation, filtering, and deduplication matter enormously.
**现实：** Pre-training 是在大规模语料库上做 next-token prediction。模型学习的是：给定前文，预测下一个会出现什么。通过这个简单目标，它学会了语法、事实、推理模式、代码结构等等。但它也会学到互联网里的胡说八道、偏见和错误信息。数据整理、过滤和去重极其重要。

**Why it matters:** Garbage in, garbage out. The quality of pre-training data is one of the biggest differentiators between models.
**为什么这很重要：** 输入垃圾，输出垃圾。预训练数据的质量是模型之间最大的差异因素之一。

---
---

## "RLHF aligns AI with human values"
"RLHF 让 AI 与人类价值观保持一致"

**Reality:** RLHF aligns AI with the preferences of the specific humans who provided feedback. Those humans disagree with each other, have biases, and can't cover every situation. RLHF makes the model helpful and harmless in the ways the raters defined, not aligned with some universal human value system.
**现实：** RLHF 让 AI 与提供反馈的特定人类的偏好保持一致。这些人彼此意见不一，带有偏见，也无法覆盖所有情况。RLHF 让模型按照标注者定义的方式变得有帮助且无害，而不是与某种普世的人类价值体系保持一致。

**Why it matters:** RLHF is a training technique, not a solution to alignment. It's one tool in a larger toolkit.
**为什么这很重要：** RLHF 是一种训练技术，不是对齐问题的解决方案。它只是更大工具箱中的一个工具。

---
---

## "Embeddings capture meaning"
"Embeddings 能捕捉意义"

**Reality:** Embeddings capture statistical co-occurrence patterns. Words that appear in similar contexts get similar vectors. This correlates with meaning well enough to be useful, but it's not semantic understanding. "King - Man + Woman = Queen" works because of distributional patterns, not because the model understands monarchy or gender.
**现实：** Embeddings 捕捉的是统计共现模式。出现在相似语境中的词会得到相似的向量。这与意义的相关性足以让它变得有用，但这并不是语义理解。"King - Man + Woman = Queen" 之所以成立，是因为分布模式，而不是因为模型理解了君主制或性别。

**Why it matters:** Embeddings are powerful for similarity search, clustering, and retrieval. But don't over-interpret what "similar" means.
**为什么这很重要：** Embeddings 在相似性搜索、聚类和检索方面非常强大。但不要过度解读 "相似" 的含义。

---
---

## "Zero-shot means no training"
"Zero-shot 意味着无需训练"

**Reality:** Zero-shot means no task-specific examples at inference time. The model was still trained on billions of tokens. It just hasn't seen examples of this specific task format. It generalizes from pre-training patterns. Few-shot means giving a few examples in the prompt. Neither means the model learned without training.
**现实：** Zero-shot 的意思是在推理时没有任务特定的示例。模型仍然是在数十亿 token 上训练出来的。它只是没有见过这种特定任务格式的示例。它是从预训练模式中泛化的。Few-shot 则是在提示中给出少量示例。两者都不意味着模型是在没有训练的情况下学会的。

---
---

## "AI models learn like humans"
"AI 模型像人类一样学习"

**Reality:** Humans learn from few examples, generalize across domains, and update beliefs continuously. Neural networks need millions of examples, generalize within their training distribution, and have fixed weights after training. The learning analogy is loose at best. Backpropagation is nothing like how biological neurons learn.
**现实：** 人类可以从少量示例中学习、跨领域泛化，并持续更新信念。神经网络则需要数百万个示例，只能在其训练分布内泛化，并且在训练后权重就是固定的。把两者类比为“学习”，充其量也很宽泛。反向传播与生物神经元的学习方式完全不同。

**Why it matters:** Don't anthropomorphize models. It leads to wrong expectations about what they can and can't do.
**为什么这很重要：** 不要把模型拟人化。这会导致人们对它们能做什么、不能做什么产生错误预期。

---
---

## "Scaling laws mean bigger is always better"
"Scaling laws 意味着越大就一定越好"

**Reality:** Scaling laws describe predictable relationships between compute, data, and model size. They show diminishing returns: doubling parameters doesn't double performance. They also assume you scale data proportionally. Many practical improvements come from better architectures, training techniques, and data quality, not just scale.
**现实：** Scaling laws 描述了算力、数据和模型规模之间可预测的关系。它们显示出边际收益递减：参数翻倍并不会让性能翻倍。它们还假设数据会按比例扩展。许多实际改进来自更好的架构、训练技术和数据质量，而不只是规模。

**Why it matters:** A 7B model with good engineering can solve your problem. Don't reach for 70B by default.
**为什么这很重要：** 一个工程做得好的 7B 模型就能解决你的问题。不要默认就上 70B。

---
---

## "Open source AI is the same as open weights"
"开源 AI 和 open weights 是一回事"

**Reality:** Most "open source" models are open weights. You get the model files but not the training data, training code, or data pipeline. True open source (like OLMo) releases everything: data, code, intermediate checkpoints, evaluation. Open weights is useful but not the same commitment as open source.
**现实：** 大多数 "open source" 模型其实只是 open weights。你能拿到模型文件，但拿不到训练数据、训练代码或数据管道。真正的 open source（如 OLMo）会公开一切：数据、代码、中间检查点和评估。open weights 很有用，但它与 open source 不是同一种程度的承诺。

**Why it matters:** Know what you're getting. Open weights let you run and fine-tune. True open source lets you reproduce and understand.
**为什么这很重要：** 要清楚你拿到的是什么。open weights 让你能够运行和微调。真正的 open source 让你能够复现并理解。

---
---

## "Prompt engineering is not real engineering"
"提示词工程不是真正的工程"

**Reality:** Prompt engineering is system design. You're designing the interface between human intent and model behavior. Good prompt engineering requires understanding tokenization, attention patterns, context window limits, and output parsing. It's closer to API design than to "talking nicely to the AI."
**现实：** 提示词工程就是系统设计。你是在设计人类意图与模型行为之间的接口。优秀的提示词工程需要理解词元化、注意力模式、上下文窗口限制和输出解析。它更接近 API 设计，而不是 "客客气气地和 AI 说话"。

**Why it matters:** This course teaches prompt engineering as a real engineering discipline in Phase 11.
**为什么这很重要：** 本课程会在 Phase 11 中将提示词工程作为一门真正的工程学科来教授。

---
---

## "CNNs are outdated, everything is transformers now"
"CNN 已经过时了，现在一切都是 transformers"

**Reality:** Vision Transformers (ViT) beat CNNs on many benchmarks, but CNNs are still used extensively. They're faster for inference, work well on mobile/edge, need less data, and have useful inductive biases (translation invariance, local patterns). Many production vision systems still use CNNs. The best architectures often combine both.
**现实：** Vision Transformers (ViT) 在许多基准测试上优于 CNNs，但 CNNs 仍然被广泛使用。它们在推理时更快，在移动端/边缘设备上表现良好，需要的数据更少，并且具备有用的归纳偏置（平移不变性、局部模式）。许多生产级视觉系统仍然使用 CNNs。最好的架构往往会结合两者。

**Why it matters:** Learn both (Phases 4 and 7). Use what works for your constraints.
**为什么这很重要：** 两者都要学（Phase 4 和 Phase 7）。根据你的约束选择真正有效的方案。

---
---

## "You need massive compute to train useful models"
"你需要海量算力才能训练出有用的模型"

**Reality:** You need massive compute to pre-train foundation models. But fine-tuning, LoRA, and transfer learning let you adapt models on a single GPU. Many useful AI applications don't require training at all, just good prompting and RAG. The "compute barrier" is for building foundation models, not for using them.
**现实：** 你需要海量算力来预训练基础模型。但微调、LoRA 和迁移学习让你可以在单张 GPU 上适配模型。许多有用的 AI 应用根本不需要训练，只需要好的提示词和 RAG。"算力门槛" 针对的是构建基础模型，而不是使用它们。

**Why it matters:** You can build real AI applications with a laptop. This course proves it.
**为什么这很重要：** 你可以只用一台笔记本电脑构建真正的 AI 应用。本课程证明了这一点。
