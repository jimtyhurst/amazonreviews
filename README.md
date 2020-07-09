
# amazonreviews

This package provides tools for analyzing the [Amazon Customer Reviews Dataset](https://s3.amazonaws.com/amazon-reviews-pds/readme.html).

**Contents**

* [Installation](#installation)
* [Accessing data](#accessing-data)
* [Examples](#examples)
* [License](#license)

---

## Installation

Install the _development_ version of `amazonreviews` from [GitHub](https://github.com/jimtyhurst/amazonreviews) with:

``` r
remotes::install_github("jimtyhurst/amazonreviews")
```

There are no plans to created a released version on any repository of published packages.

## Accessing data
Before analyzing the review data, you must download datasets from Amazon's public repository of [review datasets](https://s3.amazonaws.com/amazon-reviews-pds/readme.html). Amazon makes the datasets available from their [S3](https://aws.amazon.com/s3/) service. The files are quite large, so it takes awhile to download each zipped dataset and it takes awhile to load a full dataset into your R environment.

You can either download the datasets manually using the [AWS CLI](https://aws.amazon.com/cli/) from a command line or tools are provided within this package to perform the download from within your code.

We recommend that you specify an environment variable `REVIEW_DIRECTORY` that identifies the directory where the datasets are (or will be) stored in your local environment. For example,

* You could choose to place datasets relative to your home directory:
```r
Sys.setenv("REVIEW_DIRECTORY"="~/data/amazon-customer-reviews")
```
* Or you could place datasets relative to this project's root directory. Assuming you execute this next line of code within a directory that is within this project, you could choose to place datasets in the `amazonreviews/reviews/` directory with this command:
```r
Sys.setenv("REVIEW_DIRECTORY"=here("reviews"))
```
* Or suppose your code is running in a Docker container, where you want to access data at `/app/data/amazon-customer-reviews`, then there should be an environment variable `REVIEW_DIRECTORY` in the container configured as:
```bash
REVIEW_DIRECTORY=/app/data/amazon-customer-reviews
```

## Examples
See the [vignettes](./vignettes) for several analyses of the reviews.

## License
Copyright &#169; 2020 [Jim Tyhurst](https://www.jimtyhurst.com)<br>
Licensed under the [Open Software License version 3.0](./LICENSE).
