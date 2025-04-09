# MaximumSubarray Vignette

### Khalil Ounis, Manal Derghal, Taqwa Ben Romdhane

#### Evry Paris-Saclay University

### April 7, 2025

> [Package Presentation](#pp)

> [Quick Start](#qs)

> [Examples](#ex)

> [Analysis](#an)

------------------------------------------------------------------------

<a id="pp"></a>

## Package Presentation

The goal of MaximumSubarray is to find the contiguous subarray (or submatrix) within a one-dimensional or two-dimensional array of numbers (which may include negatives) that has the largest possible sum.

 - In the 1D case, the goal is to identify a contiguous segment of the array with the maximum sum.

 - In the 2D case, the objective is to find a rectangular submatrix (i.e., a block of contiguous rows and columns) whose elements yield the largest sum.

These problems are useful in various applications such as time-series analysis, image processing, and optimization tasks where identifying the "best-performing" segment or region is essential.

This Package provides different type of algorithms and implementation in R or C++ to resolve the maximum subarray problem with the possibility to compare between them based time complexity.

------------------------------------------------------------------------

<a id="qs"></a>

## Quick Start

### Prerequisites for Package Development

To develop and use the package, install the necessary dependencies:

``` r
install.packages(c("Rcpp", "RcppArmadillo", "devtools", "roxygen2", "testthat"))
```

### Installing the Package from GitHub

To install the MaximumSubarray package, use:

``` r
devtools::install_github("AMATERASU11/MaximumSubarray")
```

Then, load the package:

``` r
library(MaximumSubarray)
```

### Setting Up a C++ Compiler (Windows Users)

Since Rcpp requires a C++ compiler, Windows users must install Rtools:

Download and install Rtools from:
<https://cran.r-project.org/bin/windows/Rtools/>

For general R updates and additional package downloads, visit the CRAN:
<https://cran.r-project.org/>

### Package Structure

- **One file = one function**: Each function is stored in a separate
  file for clarity.

- **R and C++ function naming convention**:

  - R functions (`fct`) are stored in the `R/` folder.  
  - Their corresponding C++ versions (`fct_Rcpp`) are in the `src/`
    folder.  
  - A **header file** (`.h`) can be used to define functions that are
    accessible across multiple C++ files. In this package, we use for
    example **`TSP_auxiliary.h`** to make the distance function globally
    available to all C++ implementations of heuristic TSP algorithms. To
    use this function in a C++ file, you need to include the header at
    the beginning of the file: `#include "TSP_auxiliary.h"`.

- **Documentation**:

  - Help files for functions are available via `?fct`.  
  - Files in the `man/` folder are automatically generated using
    **Roxygen2**.  
  - To regenerate documentation when installing the package:
    1.  Click **Build** → **More** → **Configure Build Tools…**  
    2.  Enable **Generate Documentation with Roxygen**  
    3.  Click **Configure**, then check **Install and Restart**

- **Key Package Files**:

  - **`DESCRIPTION`**: Modify this file to personalize your package
    (e.g., email, description).  
  - **`NAMESPACE`**: Controls function exports. Customize it to expose
    only desired functions while keeping others internal.  
  - **`.Rbuildignore`**: Excludes files that are unnecessary for package
    building (e.g., the `Pour_les_etudiants/` folder).  
  - **`.gitignore`**: Prevents unnecessary files (e.g., `.o` object
    files) from being tracked on GitHub.

- **Unit tests**. `tests/` folder and `testthat` integration:

  - Unit tests are stored in the `tests/testthat/` folder.  
  - The package uses `testthat` to automate testing and ensure functions
    work correctly.  
  - To avoid warnings during `R CMD check`, `testthat` should be listed
    under **Suggests** in `DESCRIPTION`.

------------------------------------------------------------------------

<a id="ex"></a>

## Examples

### Sorting Algorithms (Recursive)

``` r
arr <- c(1, -2, 3, -4, 5, -6)
arr
```

    ##  [1] 1 -2  3 -4  5 -6
    
``` r
mat <- matrix(c(1, -2, 3, -4, 5, -6), nrow = 2)
mat
```
    ##      [,1] [,2] [,3]
      [1,]    1    3    5
      [2,]   -2   -4   -6
    
    
We implemented 8 algorithms:

- `max_subarray_sum_naive`
- `max_subarray_sum_opt`
- `max_subarray_rectangle_naive`
- `max_subarray_rectangle_opt`

- `max_subarray_sum_naive_Rcpp`
- `max_subarray_sum_opt_Rcpp`
- `max_subarray_rectangle_naive_Rcpp`
- `max_subarray_rectangle_opt_Rcpp`

They all have a unique argument: the array `arr` or the matrix `mat`. Examples:

``` r
max_subarray_sum_naive(arr)
```

    ##  $sum
        [1] 5

        $subarray
        [1] 5


``` r
max_subarray_rectangle_opt_Rcpp(mat)
```

    ##  $sum
        [1] 9

        $submatrix
             [,1] [,2] [,3]
        [1,]    1    3    5
