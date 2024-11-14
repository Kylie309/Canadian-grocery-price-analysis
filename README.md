# Canadian Grocery Price Analysis on 200G Miss Vickie's Original Recipe Chips of Eight Main Grocery Vendors

## Overview

This paper analyzes observational data on grocery retailer behavior, specifically focusing on price changes over time and their relationship to product availability and promotions. Data manipulation is conducted entirely in SQL to ensure transparency and reproducibility, with R employed for visualization and statistical exploration. Besides the fact that T&T consistently maintains the highest prices across the months and Walmart maintains the lowest, Galleria and Loblaws exhibit stable pricing in a mid-tier range, while Metro and SaveOnFoods display more noticeable month-to-month price changes. Our findings offer insights into grocery pricing dynamics and promotion strategies, helping public have a deeper understand of grocery market.


## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from X.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `other` contains details about LLM chat interactions and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate and clean data.


## Statement on LLM usage

ChatGPT 4o mini was used to provide assistance on resolving issues occurring in the process of uploading large files into git repo, cleaning data using sql, writing citations and constructing graphs. Entire chat history is available in other/llms/usage.txt.