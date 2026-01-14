# Chi-square test operator

##### Description

The `chisquare_test_operator` performs a chi-square test on a set of data points.

##### Usage

Input projection|.
---|---
`y-axis`        | numeric, measurement (counts)
`row`           | character, first category
`column`        | character, second category

Output relations|.
---|---
`chisq_stat`        | chi-square statistic, per column
`chisq_pval`        | chi-square p-value, per column

##### Details

Based on the `chisq.test` R function.

##### See Also

[fisher_test_operator](https://github.com/tercen/fisher_test_operator)

