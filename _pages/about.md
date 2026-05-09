---
permalink: /
title: "Mingyuan Li"
author_profile: true
redirect_from:
  - /about/
  - /about.html
---

Biography
======

I am a Ph.D. student in the Master-Ph.D. Combined Program in Control Science and Engineering at Northeastern University, China, advised by Prof. Tong Jia. I am also a visiting Ph.D. student in the Lee Kong Chian School of Medicine at Nanyang Technological University, Singapore, advised by Prof. Baosheng Yu.

My research focuses on computer vision and object detection, with recent work on overlapping object perception for real-world visual inspection tasks, including prohibited item detection, prohibited item segmentation, and pneumonia detection.

Research Interests
======

* Object Detection
* Transformer-based Detection
* Contrastive Learning
* Open-Vocabulary Detection
* Diffusion Models
* Overlapping Object Perception

Selected Publications
======

{% assign selected_publications = site.publications | where: "selected", true | sort: "selected_rank" %}
{% for post in selected_publications %}
  {% include publication-card.html %}
{% endfor %}

Education
======

* 2021.09-Present: Visiting Ph.D. student, Lee Kong Chian School of Medicine, Nanyang Technological University, Singapore. Advisor: Prof. Baosheng Yu.
* 2021.09-Present: Master-Ph.D. Combined Program in Control Science and Engineering, Northeastern University, China. Advisor: Prof. Tong Jia.
* 2017.09-2021.06: B.S. in Automation, Northeastern University, China.

Selected Projects
======

* 2021.09-2023.09: Participated in a classified project of the National Key Research and Development Program of China, 5 million RMB.
* 2022.09-2023.03: Participated in and led the Huawei Computer Vision Premium Course project, developing YOLOv5 models with MindSpore, including model construction, training, evaluation, visualization, Jupyter Notebook cases, manuals, textbooks, and presentation materials.
* 2019.11-2021.07: Led a provincial college students' innovative training project on perovskite-based nano-gas sensors for vehicle air quality detection.
* Joint Funds of the National Natural Science Foundation of China (U22A2063): Theory and implementation method of 3D visual perception of industrial robots for flexible and accurate assembly tasks, 2.56 million RMB, project backbone.
* National Key Research and Development Program of China (2022YFF0902401): Research on immersive content intelligent construction and multi-modal fusion technology, 679,000 RMB, project backbone.

Patent
======

* Tong Jia, Yixin Tian, Songsheng Wu, Bowen Ma, Shuyang Lin, Mingyuan Li. A target detection method under complex overlapping backgrounds. China Patent ZL202410572032, approval number CN118135244A.

Professional Services
======

Reviewer for NeurIPS, CVPR, TNNLS, PR, EAAI, TETCI, and PRCV.
