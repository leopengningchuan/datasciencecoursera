# Ngram Language Model
Predict the next word in a sequence using n-gram statistics from a text corpus and related applications

## Table of Contents
- [Project Background](#project-background)
- [Project Goal](#project-goal)
- [File Structure](#file-structure)
- [Instructions](#instructions)
- [Future Improvements](#future-improvements)
- [Acknowledgements](#acknowledgements)
- [License](#license)

## Project Background



## Project Goal




## File Structure
Configuration & Metadata:
- `README.md` – project overview
- `LICENSE.txt` – license information
- `.gitignore` – git ignore config
- `.gitattributes` – git attributes config

Core Logic:
- `en_US_twitter.txt` – raw Twitter text
- `data_cleaning.ipynb` – notebook for data cleaning

## Instructions

### 1. Packages Used
- `pandas`, `np`, `re`, `random`, `collections`: for data manipulation


## Future Improvements
- **Smoothing Techniques**: Implement methods such as Laplace or Kneser–Ney smoothing to handle unseen n-grams and reduce zero-probability issues.
- **Performance Optimization**: Precompute and cache n-gram mappings or use efficient data structures to speed up text generation.
- **Expanded Text Sources**: Incorporate larger and more diverse corpora (e.g., news, books, social media) to enhance model generalization.

## Acknowledgements
- This project was inspired by the [*John Hopkins University: Data Science Specialization*](https://www.coursera.org/specializations/jhu-data-science) Capstone on [*Coursera*](https://www.coursera.org/).
- Thanks to [`gradio`](https://pypi.org/project/gradio/) for enabling the interactive app interface.

## License
This project is licensed under the MIT License - see the [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/leopengningchuan/ngram-language-model?tab=MIT-1-ov-file) file for details.
