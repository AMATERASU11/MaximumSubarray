context("Maximum Subarray Algorithms")

# Test data
positive_matrix <- matrix(c(1, 2, 3, 4), nrow = 2)
negative_matrix <- matrix(c(-1, -2, -3, -4), nrow = 2)
mixed_matrix <- matrix(c(1, -2, 3, -4, 5, -6), nrow = 2)
single_element <- matrix(5)

test_that("kadane_algorithm works for 1D cases", {
  # Basic cases
  expect_equal(kadane_algorithm(c(1, 2, 3)), 6)
  expect_equal(kadane_algorithm(c(-1, -2, -3)), -1) # Edge case: all negative
  expect_equal(kadane_algorithm(c(2, -1, 3)), 4)

  # Edge cases
  expect_equal(kadane_algorithm(numeric(0)), -Inf) # Empty vector
  expect_equal(kadane_algorithm(NA), NA_real_) # Missing value
})

test_that("max_subarray_sum_naive matches kadane_algorithm results", {
  test_vectors <- list(
    c(1, 2, 3),
    c(-1, -2, -3),
    c(2, -1, 3, -2, 5),
    rnorm(10) # Random normal data
  )

  for (vec in test_vectors) {
    expect_equal(
      max_subarray_sum_naive(vec),
      kadane_algorithm(vec),
      info = paste("Vector:", paste(vec, collapse = ", ")))
  }
}
)

    test_that("2D algorithms return consistent results", {
      matrices <- list(
        positive_matrix,
        negative_matrix,
        mixed_matrix,
        single_element
      )

      for (mat in matrices) {
        expect_equal(
          max_subarray_rectangle_naive(mat),
          max_subarray_rectangle_opt(mat),
          tolerance = 1e-6,
          info = paste("Matrix:\n", paste(capture.output(print(mat)), collapse = "\n")))
      }
    })

        test_that("2D algorithms handle edge cases", {
          # Empty matrix
          expect_equal(max_subarray_rectangle_opt(matrix(nrow = 0, ncol = 0)), -Inf)

          # Single column matrix
          expect_equal(max_subarray_rectangle_opt(matrix(c(1, -2, 3))), 3)

          # Matrix with NA values
          expect_equal(max_subarray_rectangle_opt(matrix(c(1, NA, 3, 4), nrow = 2)), NA_real_)
        })

        test_that("Performance comparison between naive and optimized", {
          skip_on_cran() # Only run locally

          small_mat <- matrix(runif(10 * 10), nrow = 10)
          medium_mat <- matrix(runif(20 * 20), nrow = 20)

          # Verify timing order: opt should be faster
          expect_lt(
            system.time(max_subarray_rectangle_opt(small_mat))["elapsed"],
            system.time(max_subarray_rectangle_naive(small_mat))["elapsed"]
          )

          # Verify scaling difference
          time_ratio <-
            system.time(max_subarray_rectangle_naive(medium_mat))["elapsed"] /
            system.time(max_subarray_rectangle_opt(medium_mat))["elapsed"]
          expect_gt(time_ratio, 10) # Optimized should be >10x faster for 20x20
        })

        test_that("Output structures are correct", {
          # Test that 1D functions return numeric values
          expect_type(kadane_algorithm(c(1, 2, 3)), "double")
          expect_type(max_subarray_sum_naive(c(1, 2, 3)), "double")

          # Test that 2D functions return numeric values
          expect_type(max_subarray_rectangle_naive(positive_matrix), "double")
          expect_type(max_subarray_rectangle_opt(positive_matrix), "double")
        })
