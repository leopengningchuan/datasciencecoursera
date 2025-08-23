# N-Gram Language Model
Predict the next word in a sequence using N-gram statistics from a text corpus and related applications

## Table of Contents
- [Project Background](#project-background)
- [Project Goal](#project-goal)
- [File Structure](#file-structure)
- [Instructions](#instructions)
- [Future Improvements](#future-improvements)
- [Acknowledgements](#acknowledgements)
- [License](#license)

## Project Background
Language models are key tools in natural language processing, enabling machines to predict and generate text. The N-gram model, one of the earliest and most interpretable, estimates word probabilities from preceding context. By capturing word co-occurrence patterns, it reveals local dependencies and common phrase structures. Though simpler than modern deep models, N-grams remain valued for efficiency, clarity, and as strong baselines.

## Project Goal
This project aims to build an N-gram language model using **Python Jupyter Notebook** to predict the next word in a sequence based on historical text data. It explores applications such as query suggestion and automated sentence generation. By filtering out rare occurrences using quantile thresholds, the model reduces noise and improves efficiency, accelerating the sentence generation process.


## File Structure
Configuration & Metadata:
- `README.md` – project overview
- `LICENSE.txt` – license information
- `.gitignore` – git ignore config
- `.gitattributes` – git attributes config

Core Logic:
- `en_US_twitter.txt` – raw Twitter English text
- `N-gram_modeling.ipynb` – notebook for ngram modeling

## Instructions

### 1. Packages Used
- `pandas`, `np`, `re`, `random`, `collections`: for data manipulation
- `gradio`: for building web-based interactive interface

### 2. Create 3 Gram Dataset
The text corpus (raw Twitter Enlgish text) is processed to construct a N-gram (using 3 as an example) dataset. Each line of text is cleaned to remove non-alphanumeric characters, converted to lowercase, and split into words. Using a sliding window, all consecutive three-word sequences are extracted, and their frequencies are counted.

The collected 3-grams are then transformed into a DataFrame, storing the three words, raw counts, and relative frequencies by conditioning on the first two words. This makes it possible to understand how likely a particular third word follows a given two-word context.

Finally, the dataset is explored by ranking the most frequent 3-grams and computing quantile thresholds to identify and remove very rare cases. This filtering reduces noise and accelerates later modeling steps, while preserving the most informative 3-grams for prediction and sentence generation tasks.

### 3. Phrase Prediction
A phrase prediction module is implemented based on the previously created 3-gram dataset. It first defines a function to validate and clean the input text, ensuring that exactly two words are provided. Using these two words as context, the model searches the 3-gram dataset for matching entries and retrieves the most likely third words.

The predicted words are displayed along with their relative probabilities, calculated from the normalized frequency of occurrence in the dataset. This allows the model to suggest the most plausible continuations of a phrase, effectively simulating next-word prediction in natural language processing tasks.

### 4. Sentence Generation
Given two input words (validated and cleaned), the model repeatedly looks up all 3-grams that share the same first two words and samples a third word from the candidate list. The newly chosen word becomes part of the context, sliding the window forward (the second word becoming the first word, the thrid word becoming the second word), and the process continues until no continuation exists. To avoid repetitive word loops, a random selection strategy is applied when choosing the next word.

By chaining these local next-word predictions, the module produces a fluent sentence that reflects patterns in the corpus. The earlier quantile filtering of rare 3-grams helps reduce noise and speeds up generation while keeping the output readable.

### 5. Gradio
Instead of running predictions directly from code cells, users can input words and instantly see the results through a simple web-based interactive interface enabled by *Gradio*:
- On the left panel, users enter two words to perform word prediction. The interface outputs a prediction table showing possible next words and their associated ratios, as well as the total prediction ratio.
- On the right panel, users enter two words to perform sentence generation, where the model iteratively produces a sentence based on 3-gram probabilities.

## Future Improvements
- **Smoothing Techniques**: Implement methods such as Laplace or Kneser–Ney smoothing to handle unseen N-grams and reduce zero-probability issues.
- **Performance Optimization**: Precompute and cache N-gram mappings or use efficient data structures to speed up text generation.
- **Expanded Text Sources**: Incorporate larger and more diverse corpora (e.g., news, books, social media) to enhance model generalization.

## Acknowledgements
- This project was inspired by the [*John Hopkins University: Data Science Specialization*](https://www.coursera.org/specializations/jhu-data-science) Capstone on [*Coursera*](https://www.coursera.org/).
- Thanks to [`gradio`](https://pypi.org/project/gradio/) for enabling the interactive app interface.

## License
This project is licensed under the MIT License - see the [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/leopengningchuan/ngram-language-model?tab=MIT-1-ov-file) file for details.
