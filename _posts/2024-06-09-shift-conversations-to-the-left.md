---
title: Shift conversations to the left
description: A better way of ensuring code quality as a team
date: 2024-06-09 18:00:00 +1000
categories: [Leadership]
tags: [Shift Left, Team Collaboration, Code Review, Engineering Culture, Building Trust, Communications, Team Building]
pin: false
math: false
mermaid: false
toc: true
image:
  path: /assets/img/posts/shift-conversations-to-the-left.jpg
  alt: Photo by Alvaro Reyes - unsplash.com/@alvarordesign
  lqip: data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAf/AABEIAAcACgMBEQACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/APhL4Of8FN/F3wW8C+JfDHh74m+LNY07RtF1u0+Hmgar8IPhuRdav4v8NzeHtXvfE2vS6ld6nZ6fp840vUbK106e5nvE0K2sb9phqNzc2f7JUyLAywftqdVKteg50YvEx9nVk68pxblelOjFUqMXKMvaSdeahClGkpz/AJ5w3FmLpYh4eU8U6EIVvZVKmFy+X1ilD6vThJuNZ1adRqpVlGEqcYxjSj7SdWVVxh+sfw8/4K7/ALLdr4A8DW2s+CvGSavb+D/DMGqoNCs7zZqUWi2Ud8v2sXaC623Syj7QEUT480Ku7AwjkuD5VerK9lf3HvbXq/zPpI8VUnGL9nUV4p2tF2utr9bbX6n/2Q==
---

In many development teams today, the pull request (PR) has become the cornerstone of code review and quality management. Teams rely on PR reviews to catch mistakes, ensure code quality, and maintain project integrity. However, in my experience, this approach often falls short. Pull requests can be ineffective, frequently going unreviewed or receiving such heavy criticism that the author has to rewrite substantial portions of their code or even start from scratch. To understand why this might be happening, let’s take a look at the history of pull requests and their original purpose.

> **Good to Know:** In DevOps, there is a similar term "shift left" which focuses on moving testing, quality, and performance evaluation early in the development process. Although they might sound similar, that concept applies to a wider range of practices beyond code reviews.
{: .prompt-info }

## The History of Pull Requests
Pull requests originated in the world of open-source software development. In these projects, maintainers needed a way to manage contributions from strangers on the internet—people they had never met and whose coding skills and intentions they couldn’t necessarily trust. The pull request mechanism allowed maintainers to review code changes before integrating them, ensuring that only quality, secure code made it into the project.
This process also enabled asynchronous communication, which is crucial in open-source projects where contributors might be in different time zones and have varying schedules. Discussions about the proposed changes could stretch over days, weeks, or even months until consensus was reached.
For open-source projects, this method works well. However, does the same approach make sense for a small, close-knit team in a corporate or startup environment?

## Challenging Pull Requests
Why should a team of trusted developers have to rely so heavily on pull requests to ensure code quality? In environments where team members work closely together and know each other’s strengths, the need for mandatory peer reviews for every single change might not be as critical. There are certainly scenarios where peer reviews are necessary, such as for compliance with government regulations. But does every minor change, like updating a README file, really need to go through the same rigorous review process?
The insistence on constant peer reviews can sometimes stem from a lack of trust within the team. Instead of trusting that our colleagues are doing their best work, we impose a safety net of mandatory reviews. This can create a bottleneck in the development process and can lead to frustration and inefficiency.

## A better way
Instead of waiting until the end to review code changes, teams should shift conversations to the left. This means discussing how to approach solving problems as a team before the coding even begins. Seek feedback early and often to ensure alignment and to catch potential issues before they become significant problems.
Early conversations can help mitigate the risk of receiving poor or overly critical feedback late in the process. When you discuss your approach with your team upfront, you build a shared understanding and trust. By the time you are ready to open a pull request, your team is already familiar with your work and the reasoning behind it, reducing the chances of major rewrites or conflicts.

Looking for ways to make this happen? here are my suggestions:
- Schedule regular meetings to discuss upcoming tasks and their implementation strategies.
- Improve psychological safety so that team members feel comfortable sharing their ideas and feedback early.
- Keep a record of agreed-upon approaches to avoid confusion later in the development process
- Do not shy away from pair programming no matter what level you are at.

## Conclusion
In conclusion, while pull request reviews can be valuable, they should be optional rather than mandatory. We should prioritise a team culture where discussing approaches and seeking early feedback is the norm. This way, by the time a pull request is opened, it’s more of a formality than a critical review point. By prioritizing conversation over pull requests, teams can improve trust, efficiency, and overall code quality.
