# Specular Highlight Removal for Real_World Images

Note: if you have any questions, please contact me by Email: xyzgfu@gmail.com

## Introduction
Removing specular highlight in an image is a fundamental research problem in computer vision and computer graphics. While various methods have been proposed, they typically do not work well for real-world images due to the presence of rich textures, complex materials, hard shadows, occlusions and color illumination, etc. In this paper, we present a novel specular highlight removal method for real-world images. Our approach is based on two observations of the real-world images: (i) the specular highlight is often small in size and sparse in distribution; (ii) the remaining diffuse image can be represented by linear com- bination of a small number of basis colors with the sparse encoding coefficients. Based on the two observations, we design an optimization framework for simultaneously estimating the diffuse and specular highlight images from a single image. Specif- ically, we recover the diffuse components of those regions with specular highlight by encouraging the encoding coefficients sparseness using L0 norm. Moreover, the encoding coefficients and specular highlight are also subject to the non-negativity according to the additive color mixing theory and the illumination definition, respectively. Extensive experiments have been performed on a variety of images to validate the effectiveness of the proposed method and its superiority over the previous methods.

![Specular highlight removal results](teaser.png)
*Specular highlight removal results of our method on an example image. Left: input. Middle: highlight-free image. Right: highlight image*

This is the implementation of our paper:
```
@article{fu-2019-specul-highl,
  author = {Fu, Gang and Zhang, Qing and Song, Chengfang and Lin, Qifeng and Xiao, Chunxia},
  title = {Specular Highlight Removal for Real-World Images},
  journal = {Computer Graphics Forum},
  year = {2019},
  volume = {38},
  number = {7},
  pages = {253--263},
}
```
