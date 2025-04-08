context("Maximum Subarray Algorithms")

# Test data
positive_matrix <- matrix(c(1, 2, 3, 4), nrow = 2)
negative_matrix <- matrix(c(-1, -2, -3, -4), nrow = 2)
mixed_matrix    <- matrix(c(1, -2, 3, -4, 5, -6), nrow = 2)
single_element  <- matrix(5)

test_that("kadane_algorithm works for 1D cases", {
  expect_equal(kadane_algorithm(c(1, 2, 3))$sum, 6)
  expect_equal(kadane_algorithm(c(-1, -2, -3))$sum, -1)
  expect_equal(kadane_algorithm(c(2, -1, 3))$sum, 4)

  # Edge cases
  expect_equal(kadane_algorithm(numeric(0))$sum, -Inf)
  expect_equal(kadane_algorithm(NA)$sum, NA_real_)
})

test_that("max_subarray_sum_naive matches kadane_algorithm results", {
  test_vectors <- list(
    c(1, 2, 3),
    c(-1, -2, -3),
    c(2, -1, 3, -2, 5),
    rnorm(10)
  )

  for (vec in test_vectors) {
    expect_equal(
      max_subarray_sum_naive(vec)$sum,
      kadane_algorithm(vec)$sum,
      info = paste("Vector:", paste(vec, collapse = ", "))
    )
  }
})

test_that("2D algorithms return consistent results", {
  matrices <- list(
    positive_matrix,
    negative_matrix,
    mixed_matrix,
    single_element
  )

  for (mat in matrices) {
    expect_equal(
      max_subarray_rectangle_naive(mat)$sum,
      max_subarray_rectangle_opt(mat)$sum,
      tolerance = 1e-6,
      info = paste("Matrix:\n", paste(capture.output(print(mat)), collapse = "\n"))
    )
  }
})

test_that("2D algorithms handle edge cases", {
  # Empty matrix
  expect_equal(max_subarray_rectangle_opt(matrix(nrow = 0, ncol = 0))$sum, -Inf)

  # Single column matrix
  expect_equal(max_subarray_rectangle_opt(matrix(c(1, -2, 3)))$sum, 3)

  # Matrix with NA values
  expect_equal(max_subarray_rectangle_opt(matrix(c(1, NA, 3, 4), nrow = 2))$sum, NA_real_)
})

test_that("Output structures are correct", {
  expect_type(kadane_algorithm(c(1, 2, 3)), "list")
  expect_type(max_subarray_sum_naive(c(1, 2, 3)), "list")
  expect_type(max_subarray_rectangle_naive(positive_matrix), "list")
  expect_type(max_subarray_rectangle_opt(positive_matrix), "list")
})

test_that("Performance comparison between naive and optimized", {
  skip_on_cran()

  mat <- matrix(runif(20 * 20, min = -10, max = 10), nrow = 20)

  naive_times <- replicate(3, system.time(max_subarray_rectangle_naive(mat))["elapsed"])
  opt_times   <- replicate(3, system.time(max_subarray_rectangle_opt(mat))["elapsed"])

  avg_naive <- mean(naive_times)
  avg_opt   <- mean(opt_times)

  cat("Naive avg:", avg_naive, " | Opt avg:", avg_opt, "\n")

  expect_lt(avg_opt, avg_naive * 1.2)

  if (avg_opt > 0.001) {
    time_ratio <- avg_naive / avg_opt
    expect_gt(time_ratio, 2)
  } else {
    skip("Optimized function too fast to measure reliably")
  }
})
