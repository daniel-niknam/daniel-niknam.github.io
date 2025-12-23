---
title: Ruby is not inefficient
description: Addressing some of the common misunderstanding about Ruby.
date: 2025-12-23 16:00:00 +1000
categories: [Coding] 
tags:
  [
    Ruby,
    Developer efficiency,
    Benchmarking
  ]
pin: false
math: false
mermaid: false
toc: true
image:
  path: /assets/img/posts/ruby-is-not-inefficient.png
  alt: Screenshot of Ruby official website, https://www.ruby-lang.org/
  lqip: data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAGCAYAAAD68A/GAAAAAklEQVR4AewaftIAAADNSURBVAXBTTPDQACA4Xe/WiGdtNNkmtTH5GSmbn4GB3/Z1Q9wYEgPOChGMZrY3ezG84jN/e0wOTpBKUkIkRgDIJBSoLUhhABDRP/Glruba85Wp8Qosc0aORqhDiuUNvTe03UtOpvOyGY5L08N88c14+d3wtcWdXWJqGu2n2+Uyxr5uvnAuz/KRY7an+CaB8LPN9Y5+r6nKAqEGNBVtSCEHm1S/PkKsWuRRU63LEmMwjqJ3Vm02ZuSaI0xhlaPiRfHpOkB3nVYF5lnCQyBfwgeV1zriFeDAAAAAElFTkSuQmCC
---

One of the long-running myths about Ruby and Ruby on Rails is that they're "inefficient".

The usual evidence goes like this: someone writes  a **Hello World** app in Go or Rust, writes the same thing in Ruby or Ruby on Rails, benchmarks them, and then concludes Ruby is "10x worse" because it handles fewer requests per second or has higher latency. Those benchmarks aren't useless, and they *do* tell you something about raw throughput and runtime overhead, but they're also one of the easiest ways to confuse **raw performance** with **efficiency**, and that confusion is where most of the bad decisions come from. To take a step further, I need to explain a few key points.

## "Efficiency" is a relative term

Efficiency depends on what you're optimizing for, which could mean:

- **Speed of development**: how quickly you can ship a feature
- **Speed of change**: how safely and predictably you can evolve the system
- **Operational efficiency**: how well your app uses CPU/Memory for a given workload
- **Business efficiency**: how much revenue you can generate per engineering hour.

A language might be "less efficient" in one dimension while being wildly more efficient in another, which is often the case. So before we say "Ruby is inefficient", the right question that we need to ask ourselves is: **inefficient at what, and how?**

## Hello World is not production
> Before we talk about a common misunderstanding of using the Hello World benchmark, I need to say that benchmarks are not bad, but what we take away from the output of the benchmark is very important. One of the oldest tools that I know of in relation to benchmarking is something called **Whetstone**, which played a very important role in measuring computer/CPU performance. I'm not an expert, so I won't go deep into this, but I want to point out that people used Whetstone to measure performance in different computers because Whetstone will always instruct the CPU in the same way, so running it on multiple *real* computer CPUs will help you understand their strengths and weaknesses in executing those instructions. Generally, you always want to have a fixed part and a variable part in a comparison to be able to understand the result. *However, if you benchmark multiple HDMI Cables and then blindly purchase a monitor, although you can trust the cable to be as good as what you have discovered, the monitor may not be what you wanted.*
{: .prompt-tip }

This should go without saying that we don't deploy "Hello World" to production. A real production system includes, but is not limited to:

- Authentication
- Authorization
- Database Access
- Caching
- Third-party APIs
- Input Validation
- Serialization
- Logging
- Error handling, retries
- Business logic that changes rapidly

In my experience, the bottleneck is rarely "the time it takes the runtime to return a string". If a Go "Hello World" app can handle 10x more requests than a Ruby app, that does not automatically mean Ruby is "10x inefficient" for real systems. It just means that **Go has higher raw throughput for that tiny workload**. That's a true statement, and it can matter in the right context, because it's also a long way from answering the question you actually care about, which usually is:

**How does this system perform under realistic workloads, with realistic constraints and realistic development velocity?**

Unfortunately, this is not an easy question to answer, but often people rely on simple questions to answer much more complicated ones, and that leads to making wrong assumptions and mistakes. Unless your business model is deploying Hello World apps to production, I'm afraid these Hello World examples are not going to give you the right answer.

## The cost conversation is often upside down

A lot of these debates eventually shift to cost: "If Ruby needs more computation power, it costs more", which is a true statement, but framed in a way that ignores where the money really goes.

In practice, the **pure hardware cost is usually one of the most affordable components** of building a product, and the expensive parts are:

- Engineering time
- Opportunity cost
- Product iteration
- Marketing
- Customer Acquisition

And many other things. Even when we talk about "hardware cost", people are actually talking about **cloud provider pricing**, which is not the same thing. Cloud Bills include:

- Convenience and managed services
- Elasticity and global infrastructure
- Operational tooling and reliability features
- Support SLAs, network, storage, backups, and more

You might pay 3x (or more) compared to the raw computation cost because you are buying part of an ecosystem, not just CPU and RAM. So “Ruby is expensive to run” is a vague and unhelpful statement. Are we talking about the runtime’s CPU efficiency, or the cost of a particular Cloud provider, or mixing both and blaming Ruby for things that are actually pricing and are more about architecture choice? If you are running Ruby on Cloud, chances are that as your application scales, you have to spend more, but that’s not inherently bad. But understandably, Cloud providers' costs are not in your favour.

## A better way to think about it

If you really insist on proving the efficiency of one language over another, here is what I think will give you a fair result:

- Pick a real workload or hot path in your application that could be implemented separately.
- Define your requirements. 
  - Latency
  - Throughput
  - Development time
  - etc
- Implement your tasks/app in both languages and measure your requirements
- Pick what is important for you
  - Raw throughput?
  - Development time?
  - Cost of running?
- As a bonus, implement one additional change that requires a fair bit of development, and measure your requirements again
- Compare and decide

I know this is not an easy way to find the answer you are looking for, but I think it’s the best way to find an honest answer. What this pattern does, as long as you build the code in the same way in both languages, make your process.

## Stop comparing

Another thing to think about is, just stop comparing languages/runtimes' performance and use a programming language that **you are efficient** in and that works best for you. Ruby isn’t the fastest programming language in the world. That’s not controversial, but “not the fastest” is not the same as *“inefficient”*.
